<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddTrainer.aspx.cs" Inherits="HRMSTeam3.Admin.AddTrainer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="form-section">
            <h3 class="mb-4">Add Trainer</h3>

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
                    <label>Phone No.</label>
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-6">
                    <label>Upload Image</label>
                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label>Role</label>
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-select" />
                </div>
                <div class="col-md-6">
                    <label>Email</label>
                    <asp:TextBox ID="TextBox4" runat="server" TextMode="Email" CssClass="form-control" />
                </div>
            </div>

            <div class="mb-3">
                <label>Description</label>
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <label>Status</label>
                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-select">
                    <asp:ListItem>Active</asp:ListItem>
                    <asp:ListItem>InActive</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="text-end">
                <asp:Button ID="Button2" runat="server" Text="Add Trainer" OnClick="Button2_Click" CssClass="btn btn-custom" />
            </div>
        </div>
    </div>
</asp:Content>
