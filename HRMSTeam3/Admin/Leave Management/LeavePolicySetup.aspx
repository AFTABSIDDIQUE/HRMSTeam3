<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="LeavePolicySetup.aspx.cs" Inherits="HRMSTeam3.Admin.Leave_Management.LeavePolicySetup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <p>
    Leave Title&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="LeaveTitleId" runat="server"></asp:TextBox>
</p>
<p>
    &nbsp;</p>
<p>
    Leave Entitlements&nbsp;&nbsp;
    <asp:TextBox ID="EntitlementsId" runat="server"></asp:TextBox>
</p>
<p>
    &nbsp;</p>
<p>
    <asp:Button ID="AddLeaveBtn" runat="server" OnClick="AddLeaveBtn_Click" Text="Add Leave" />
</p>

</asp:Content>
