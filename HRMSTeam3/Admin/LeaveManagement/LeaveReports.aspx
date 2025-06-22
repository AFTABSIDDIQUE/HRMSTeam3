<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="LeaveReports.aspx.cs" Inherits="HRMSTeam3.Admin.Leave_Management.LeaveReports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-4">
        <asp:GridView ID="GridView1" runat="server"
            CssClass="table table-bordered table-striped table-hover"
            Width="100%"
            BorderColor="Black"
            HeaderStyle-CssClass="bg-primary text-white"
            EmptyDataText="No records found.">
        </asp:GridView>
    </div>

</asp:Content>
