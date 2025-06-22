<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/Manager.Master" AutoEventWireup="true" CodeBehind="LeaveDocumentation.aspx.cs" Inherits="HRMSTeam3.Manager.Leave_Management.LeaveDocumentation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">

        <div class="row mb-3">
            <div class="col-md-4">
                <label for="ddlDepartment">Department</label>
                <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-control"
                    AutoPostBack="true" OnSelectedIndexChanged="FilterChanged"></asp:DropDownList>
            </div>
            <div class="col-md-4">
                <label for="ddlLeaveType">Leave Type</label>
                <asp:DropDownList ID="ddlLeaveType" runat="server" CssClass="form-control"
                    AutoPostBack="true" OnSelectedIndexChanged="FilterChanged"></asp:DropDownList>
            </div>
        </div>

        <asp:GridView ID="LeaveGrid" runat="server"
            CssClass="table table-bordered table-striped table-hover"
            Width="100%" BorderColor="Black"
            HeaderStyle-CssClass="bg-primary text-white"
            EmptyDataText="No records found.">
        </asp:GridView>

        <asp:Label ID="Label2" runat="server" CssClass="mt-2 d-block text-muted"></asp:Label>

    </div>
</asp:Content>
