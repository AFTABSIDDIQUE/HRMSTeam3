<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Document_mgmt.aspx.cs" Inherits="HRMSTeam3.Admin.Document_mgmt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <div class="form-section">
            <h4 class="mb-4">Document Management</h4>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="TextBox1" class="form-label">Employee ID</label>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" />
                </div>

                <div class="col-md-6">
                    <label for="DropDownList1" class="form-label">Document Type</label>
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-select">
                        <asp:ListItem Text="-- Select --" Value="" />
                        <asp:ListItem Text="Employment Letter" />
                        <asp:ListItem Text="Relieving Letter" />
                    </asp:DropDownList>
                </div>
            </div>

            <div class="mb-3">
                <label for="FileUpload1" class="form-label">Upload Document</label>
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
            </div>

            <div class="text-end">
                <asp:Button ID="Button2" runat="server" Text="Submit" CssClass="btn btn-custom me-2" OnClick="Button2_Click" />
                <asp:Button ID="Button3" runat="server" Text="View Documents" CssClass="btn btn-outline-secondary" OnClick="Button3_Click" />
            </div>
        </div>
    </div>
</asp:Content>
