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
            <input type="file" id="File1" runat="server" />
        </div>
        <div>
            <p>Select Private Key : </p>
            <input type="file" id="File2" runat="server" />
        </div>
        <p>
            <asp:Button ID="submit" runat="server" OnClick="Button1_Click" Text="Upload" />
        </p>
    </form>
</body>
</html>
