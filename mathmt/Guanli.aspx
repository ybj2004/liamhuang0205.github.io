<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Guanli.aspx.cs" Inherits="Guanli" %>

<!DOCTYPE html>

<html xmlns="">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <asp:DataGrid runat="server" ID="ClassesGrid">
        </asp:DataGrid>
        选择ID号：
        <asp:TextBox runat="server" ID="txtid" TextMode="Number"></asp:TextBox><br />
        课 程 名：
        <asp:DropDownList runat="server" ID="KechengName"></asp:DropDownList><br />
        日　　期：
        <input type="date" id="KechenDate" runat="server" required="required" /><br />
        时　　间：
        <input type="time" runat="server" id="TimeStart" step="1800" value="00:00" />到<input type="time" runat="server" id="TimeEnd" step="1800" value="00:00" /><br />
        剩余人数：
        <asp:TextBox runat="server" ID="txtRemaining" TextMode="Number" ></asp:TextBox><br />
        总 人 数：
        <asp:TextBox runat="server" ID="txtNumber" TextMode="Number"></asp:TextBox><br />
        地　　点：
        <asp:TextBox runat="server" ID="txtPlace"></asp:TextBox><br />
        授课老师：
        <asp:TextBox runat="server" ID="txtTeacher"></asp:TextBox><br />
        课程价格：
        <asp:TextBox runat="server" ID="txtJiage"></asp:TextBox><br />
        <asp:Button runat="server" ID="btnSave" Text="保存" OnClick="btnSave_Click" />
        <asp:Button runat="server" ID="btnChange" Text="修改" OnClick="btnChg_Click" />
        <asp:Button runat="server" ID="btnDel" Text="删除" OnClick="btnDel_Click" />
    </div>
    </form>
</body>
</html>
