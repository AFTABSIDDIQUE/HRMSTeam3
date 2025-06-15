<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="LeaveBalance.aspx.cs" Inherits="HRMSTeam3.User.Leaves_Management_users.LeaveBalance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <p>
    Enter Name&nbsp;&nbsp;
    <asp:TextBox ID="EmName" runat="server"></asp:TextBox>
</p>
<p>
    &nbsp;</p>
<p>
    <asp:Button ID="LeaveBalanceBtn" runat="server" OnClick="LeaveBalanceBtn_Click" Text="View Leave Balances" />
</p>
<p>
    &nbsp;</p>
<p>
    <asp:GridView ID="LeaveBalanceView" runat="server">
    </asp:GridView>
</p>


</asp:Content>
