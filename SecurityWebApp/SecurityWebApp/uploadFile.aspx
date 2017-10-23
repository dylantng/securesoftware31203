<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="uploadFile.aspx.cs" Inherits="SecurityWebApp.uploadFile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" enctype="multipart/form-data" runat="server">
        <div>
            <p>Select File : </p>
            <input type="file" id="inputFile" runat="server" />
        </div>
        <div>
            <p>Select Private Key : </p>
            <textarea id="privatekey" rows="15" cols="65"></textarea>
        </div>
        <div>
            <p>Select Public Key : </p>
            <textarea id="publickey" rows="15" cols="65"></textarea>
        </div>

        <p>
            <asp:Button ID="submit" runat="server" OnClick="Button1_Click" Text="Upload" />
        </p>
    </form>
</body>
<script type="text/javascript" src="Scripts/jsencrypt.min.js"></script>
<script type="text/javascript" src="http://kjur.github.io/jsrsasign/jsrsasign-latest-all-min.js"></script>
<script type="text/javascript" src="https://cdn.rawgit.com/ricmoo/aes-js/e27b99df/index.js"></script>
<script>
    function uploadFile() {
        var selectedFile = document.getElementById('inputFile').files[0];
        var reader = new FileReader();

        reader.onload = function () {
            var fileBuffer = reader.result;
            var fileBytes = new Uint8Array(fileBuffer);
            var fileString = aesjs.utils.hex.fromBytes(fileBytes);
            console.log("File: ", fileString);

            //Signature (Always 256 characters)
            var rsa = new RSAKey();
            //TODO READ STRING FROM PRIVATE KEY PEM FILE
            rsa.readPrivateKeyFromPEMString(document.getElementById('privatekey').value);
            var hSig = rsa.sign(fileString, "sha1");
            console.log("Singature: ", hSig);

            //Random Key
            var key = generateKey();
            var keyString = aesjs.utils.hex.fromBytes(key);
            console.log("Key: ", keyString);

            //Encryption of Message
            var combined = fileString.concat(hSig);
            var combinedBytes = aesjs.utils.hex.toBytes(combined);
            var aesCtr = new aesjs.ModeOfOperation.ctr(key, new aesjs.Counter(1));
            var encryptedBytes = aesCtr.encrypt(combinedBytes); // encryptedBytes -> File
            var encryptedContent = aesjs.utils.hex.fromBytes(encryptedBytes);
            
            //TODO: WRITE encryptedContent INTO TXT FILE
            console.log("Encrypted content + Cert: ", aesjs.utils.hex.fromBytes(encryptedBytes));

            //Encryption of Key
            var encrypt = new JSEncrypt();
            var publicKey = document.getElementById('publickey').value; //Should be gotten from CA
            encrypt.setPublicKey(publicKey);
            var encryptedKey = encrypt.encrypt(keyString);
            //TODO WRITE FILE FORMAT & encryptedKey INTO SQL
            console.log("Encrypted Key: ", encryptedKey);

            /*
            $.ajax({
                type: "POST",
                url: "uploadFile.aspx/upload",
                data: JSON.stringify({ encryptedContent: encryptedContent, encryptedKey: encryptedKey }),
                contentType: "application/json",
                dataType: "json",
                success: function (msg) {
                    // Replace the div's content with the page method's return.
                    window.location.replace("uploadFile.aspx");
                }
            });
            */

        }

        reader.readAsArrayBuffer(selectedFile);
        return false;
    }

    function generateKey() {
        //Generate a 128 bit key
        var key = new Array(16);
        for (var i = 0; i < key.length; i++) {
            key[i] = Math.floor(Math.random() * 127 + 1);
        }
        return key;
    }

</script>
</html>
