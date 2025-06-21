<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="CreateEmp.aspx.cs" Inherits="HRMSTeam3.Admin.CreateEmp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="form-section">
            <h3 class="mb-4">Add Employee</h3>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Full Name</label>
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-6">
                    <label class="form-label">Email ID</label>
                    <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" />
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Mobile Number</label>
                    <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-6">
                    <label class="form-label">Date of Birth</label>
                    <asp:TextBox ID="TextBox6" runat="server" TextMode="Date" CssClass="form-control" />
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Date of Joining</label>
                    <asp:TextBox ID="TextBox7" runat="server" TextMode="Date" CssClass="form-control" />
                </div>
                <div class="col-md-6">
                    <label class="form-label">Department</label>
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-select">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>IT</asp:ListItem>
                        <asp:ListItem>HR</asp:ListItem>
                        <asp:ListItem>Sales</asp:ListItem>
                        <asp:ListItem>Marketing</asp:ListItem>
                        <asp:ListItem>Support</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Designation</label>
                    <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-6">
                    <label class="form-label">Manager</label>
                    <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-select">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Sahil Tiwari</asp:ListItem>
                        <asp:ListItem>Bhargav Nene</asp:ListItem>
                        <asp:ListItem>Shashi Prajapati</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="row mb-4">
                <div class="col-md-6">
                    <label class="form-label">Employee Status</label>
                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-select">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Active</asp:ListItem>
                        <asp:ListItem>Inactive</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="text-end">
                <asp:Button ID="Button2" runat="server" Text="Submit" CssClass="btn btn-custom" OnClick="Button2_Click" />
            </div>
        </div>
    </div>
</asp:Content>
