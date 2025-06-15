<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Create User.aspx.cs" Inherits="HRMSTeam3.Create_User" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<br />
Full Name:&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
<br />
<br />
Email Id:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
<br />
&nbsp;<br />
Mobile Number:<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
<br />
&nbsp;<br />
&nbsp;Dob:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
<br />
&nbsp;<br />
&nbsp;Doj:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="TextBox7" runat="server" TextMode="Date"></asp:TextBox>
<br />
<br />
&nbsp;Department:&nbsp;&nbsp;&nbsp;
<asp:DropDownList ID="DropDownList1" runat="server">
    <asp:ListItem></asp:ListItem>
    <asp:ListItem>IT</asp:ListItem>
    <asp:ListItem>HR</asp:ListItem>
    <asp:ListItem>Sales</asp:ListItem>
    <asp:ListItem>Marketing</asp:ListItem>
    <asp:ListItem>Support</asp:ListItem>
</asp:DropDownList>
<br />
&nbsp;<br />
&nbsp;Designation:&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
<br />
<br />
Employee Status:
<asp:DropDownList ID="DropDownList2" runat="server">
    <asp:ListItem></asp:ListItem>
    <asp:ListItem>Active</asp:ListItem>
    <asp:ListItem>Inactive</asp:ListItem>
</asp:DropDownList>
<br />
<br />
<p>
&nbsp;
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Submit" />
</p>
</asp:Content>
