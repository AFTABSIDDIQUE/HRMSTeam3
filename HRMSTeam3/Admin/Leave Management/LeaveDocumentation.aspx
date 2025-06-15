<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="LeaveDocumentation.aspx.cs" Inherits="HRMSTeam3.Admin.Leave_Management.LeaveDocumentation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <p>
        ,<asp:GridView ID="LeaveGrid" runat="server" Height="171px" Width="318px">
        </asp:GridView>
       </p>
    <p>
        &nbsp;</p>
    <p>

        <asp:Label ID="Label2" runat="server"></asp:Label>

       </p>


</asp:Content>
