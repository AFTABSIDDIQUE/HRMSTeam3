<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Tickets.aspx.cs" Inherits="HRMSTeam3.User.Tickets" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
    <br />
    Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
</p>
<p>
    Employee Id:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
</p>
<p>
    Ticket Raised For&nbsp; :<asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem></asp:ListItem>
        <asp:ListItem>IT</asp:ListItem>
        <asp:ListItem>HR</asp:ListItem>
        <asp:ListItem>Sales</asp:ListItem>
        <asp:ListItem>Marketing</asp:ListItem>
        <asp:ListItem>Support</asp:ListItem>
    </asp:DropDownList>
</p>
<p>
    Ticket Description:
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
</p>
<p>
    Attachments:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:FileUpload ID="FileUpload1" runat="server" />
</p>
<p>
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Raise Ticket" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button3" runat="server" Text="View Tickets" OnClick="Button3_Click" />
</p>
</asp:Content>
