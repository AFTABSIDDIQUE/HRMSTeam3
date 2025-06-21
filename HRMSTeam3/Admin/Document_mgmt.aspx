<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Document_mgmt.aspx.cs" Inherits="HRMSTeam3.Admin.Document_mgmt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <p>
    Employee Id:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
</p>
Document Type:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:DropDownList ID="DropDownList1" runat="server">
    <asp:ListItem></asp:ListItem>
    <asp:ListItem>Employment Letter</asp:ListItem>
    <asp:ListItem> Relieving Letter </asp:ListItem>
</asp:DropDownList>
<br />
<br />
Upload Document:&nbsp;&nbsp;
<asp:FileUpload ID="FileUpload1" runat="server" />
<br />
<br />
<br />
<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Submit" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="View Documents" />
</asp:Content>
