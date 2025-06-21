<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="UserUpdation.aspx.cs" Inherits="HRMSTeam3.Admin.UserUpdation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="form-section">
            <h3 class="mb-4">User Updation</h3>

            <div class="mb-3">
                <label>User ID</label>
                <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control" AutoPostBack="True" OnTextChanged="TextBox9_TextChanged" />
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label>First Name</label>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-6">
                    <label>Last Name</label>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" />
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label>Date of Birth</label>
                    <asp:TextBox ID="TextBox3" runat="server" TextMode="Date" CssClass="form-control" />
                </div>
                <div class="col-md-6">
                    <label>Date of Joining</label>
                    <asp:TextBox ID="TextBox8" runat="server" TextMode="Date" CssClass="form-control" />
                </div>
            </div>

            <div class="mb-3">
                <label>Address</label>
                <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <label>Email</label>
                <asp:TextBox ID="TextBox5" runat="server" TextMode="Email" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <label>Password</label>
                <asp:TextBox ID="TextBox6" runat="server" TextMode="Password" CssClass="form-control" />
            </div>

            <div class="row mb-3">
                <div class="col-md-4">
                    <label>Role</label>
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-select">
                        <asp:ListItem>HR</asp:ListItem>
                        <asp:ListItem>Manager</asp:ListItem>
                        <asp:ListItem>User</asp:ListItem>
                        <asp:ListItem>Admin</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="col-md-4">
                    <label>Department</label>
                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-select">
                        <asp:ListItem>HR</asp:ListItem>
                        <asp:ListItem>Manager</asp:ListItem>
                        <asp:ListItem>IT</asp:ListItem>
                        <asp:ListItem>Sales</asp:ListItem>
                        <asp:ListItem>Finanace</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="col-md-4">
                    <label>Status</label>
                    <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-select">
                        <asp:ListItem>Active</asp:ListItem>
                        <asp:ListItem>InActive</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="mb-3">
                <label>Designation</label>
                <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control" />
            </div>

            <div class="text-end">
                <asp:Button ID="Button2" runat="server" Text="Update User" CssClass="btn btn-custom" OnClick="Button2_Click" />
            </div>
        </div>
    </div>
</asp:Content>
