<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="UpdateInfo.aspx.cs" Inherits="HRMSTeam3.User.UpdateInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        Employee Id:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
<br />
<br />
Full Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
<br />
<br />Email Id:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
<br />&nbsp;<br />Mobile Number:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
<br />&nbsp;<br />&nbsp;Dob:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
<br />&nbsp;<br />&nbsp;Doj:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox7" runat="server" TextMode="Date"></asp:TextBox>
<br />
<br />&nbsp;Department:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:DropDownList ID="DropDownList1" runat="server">
    <asp:ListItem></asp:ListItem>
    <asp:ListItem>IT</asp:ListItem>
    <asp:ListItem>HR</asp:ListItem>
    <asp:ListItem>Sales</asp:ListItem>
    <asp:ListItem>Marketing</asp:ListItem>
    <asp:ListItem>Support</asp:ListItem>
</asp:DropDownList>
<br />&nbsp;<br />&nbsp;Designation:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
<br />
<br />
        Manager:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:DropDownList ID="DropDownList3" runat="server">
    <asp:ListItem></asp:ListItem>
    <asp:ListItem>Sahil Tiwari</asp:ListItem>
    <asp:ListItem>Bhargav Nene</asp:ListItem>
    <asp:ListItem>Shashi Prajapati</asp:ListItem>
</asp:DropDownList>
<br />
<br />Employee Status:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:DropDownList ID="DropDownList2" runat="server">
    <asp:ListItem></asp:ListItem>
    <asp:ListItem>Active</asp:ListItem>
    <asp:ListItem>Inactive</asp:ListItem>
</asp:DropDownList>
<br />
<br />
Emergency Contact:&nbsp; <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
        <br />
        <br />
        Profile Picture:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:FileUpload ID="FileUpload1" runat="server" />
<br />
<asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Update" />
<br />

</asp:Content>
