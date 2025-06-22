<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="apply.aspx.cs" Inherits="HRMSTeam3.User.Leaves_Management_users.apply" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <div class="form-section">
        <div class="card shadow-sm">
            <div class="card-header card-header-custom">
                <h5 class="mb-0">Apply for Leave</h5>
            </div>
            <div class="card-body">
                <div class="mb-3">
                    <label for="EmpName" class="form-label">Employee Full Name</label>
                    <asp:TextBox ID="EmpName" runat="server" CssClass="form-control" AutoPostBack="True" OnTextChanged="EmpName_TextChanged1" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="EmpName" ErrorMessage="*Enter Name" ForeColor="Red" CssClass="text-danger" />
                </div>

                <div class="mb-3">
                    <label for="deptId" class="form-label">Department</label>
                    <asp:TextBox ID="deptId" runat="server" CssClass="form-control" />
                </div>

                <div class="mb-3">
                    <label for="LeaveList" class="form-label">Leave Type</label>
                    <asp:DropDownList ID="LeaveList" runat="server" CssClass="form-select" />
                </div>

                <div class="mb-3">
                    <label for="StartDate" class="form-label">Start Date</label>
                    <asp:TextBox ID="StartDate" runat="server" TextMode="Date" CssClass="form-control" AutoPostBack="True" OnTextChanged="StartDate_TextChanged" />
                </div>

                <div class="mb-3">
                    <label for="EndDate" class="form-label">End Date</label>
                    <asp:TextBox ID="EndDate" runat="server" TextMode="Date" CssClass="form-control" AutoPostBack="True" OnTextChanged="EndDate_TextChanged" />
                </div>

                <div class="mb-3">
                    <label for="Duration" class="form-label">Duration</label>
                    <asp:TextBox ID="Duration" runat="server" CssClass="form-control" ReadOnly="True" />
                </div>

                <div class="mb-3">
                    <label for="Reason" class="form-label">Reason</label>
                    <asp:TextBox ID="Reason" runat="server" CssClass="form-control" />
                </div>

                <div class="mb-4 d-flex gap-3">
                    <asp:Button ID="LeaveRequestBtn" runat="server" Text="Submit" CssClass="btn btn-custom" OnClick="LeaveRequestBtn_Click" />
                    <asp:Button ID="TrackId" runat="server" Text="Track Status" CssClass="btn btn-secondary" OnClick="TrackId_Click" />
                </div>

                <div class="mt-4">
                    <asp:GridView ID="TrackView" runat="server" CssClass="table table-bordered table-striped table-hover" Width="100%" />
                </div>
            </div>
            </div>
        </div>
    </div>
</asp:Content>
