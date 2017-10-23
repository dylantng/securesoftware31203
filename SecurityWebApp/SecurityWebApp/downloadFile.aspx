<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="downloadFile.aspx.cs" Inherits="SecurityWebApp.downloadFile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p>File Name</p>
            <asp:DataList ID="DataListContent" runat="server" RepeatDirection="Vertical" BorderStyle="None" Style="padding: 0px!important">
                <ItemTemplate>
                    <div>
                        <asp:LinkButton ID="ButtonDownload" runat="server" Style="padding-left: 5px; text-decoration: none"
                            ToolTip="Click here to download" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"DownLoadLink") %>'
                            Text=' <%# DataBinder.Eval(Container.DataItem,"FileName") %>' OnClick="ButtonDownload_Click"></asp:LinkButton>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
        <div>
            <p>Select Private Key : </p>
            <input type="file" id="File2" runat="server" />
        </div>
    </form>
</body>
</html>
