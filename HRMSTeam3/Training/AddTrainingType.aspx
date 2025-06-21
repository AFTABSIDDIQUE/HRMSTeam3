<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddTrainingType.aspx.cs" Inherits="HRMSTeam3.Admin.AddTrainingType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="form-section">
            <h3 class="mb-4">Add Training Type</h3>

            <div class="mb-3">
                <label>Training Type</label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <label>Description</label>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <label>Status</label>
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-select">
                    <asp:ListItem>Active</asp:ListItem>
                    <asp:ListItem>InActive</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="text-end">
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Add" CssClass="btn btn-custom" />
            </div>
        </div>
    </div>
</asp:Content>
