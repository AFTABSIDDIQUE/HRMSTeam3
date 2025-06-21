<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="apply.aspx.cs" Inherits="HRMSTeam3.User.Leaves_Management_users.apply" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">

        <div class="form-group">
            <label for="EmpName">Employee Full Name</label>
            <asp:TextBox ID="EmpName" runat="server" CssClass="form-control" AutoPostBack="True" OnTextChanged="EmpName_TextChanged1"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="EmpName" ErrorMessage="*Enter Name" ForeColor="Red" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
            <label for="deptId">Department</label>
            <asp:TextBox ID="deptId" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="LeaveList">Leave Type</label>
            <asp:DropDownList ID="LeaveList" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>

        <div class="form-group">
            <label for="StartDate">Start Date</label>
            <asp:TextBox ID="StartDate" runat="server" TextMode="Date" CssClass="form-control" AutoPostBack="True" OnTextChanged="StartDate_TextChanged"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="EndDate">End Date</label>
            <asp:TextBox ID="EndDate" runat="server" TextMode="Date" CssClass="form-control" AutoPostBack="True" OnTextChanged="EndDate_TextChanged"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="Duration">Duration</label>
            <asp:TextBox ID="Duration" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="Reason">Reason</label>
            <asp:TextBox ID="Reason" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <asp:Button ID="LeaveRequestBtn" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="LeaveRequestBtn_Click" />
            <asp:Button ID="TrackId" runat="server" Text="Track Status" CssClass="btn btn-secondary ml-2" OnClick="TrackId_Click" />
        </div>

        <div class="mt-3">
            <asp:GridView ID="TrackView" runat="server" CssClass="table table-bordered table-striped table-hover" Width="100%"></asp:GridView>
        </div>

    </div>
</asp:Content>
