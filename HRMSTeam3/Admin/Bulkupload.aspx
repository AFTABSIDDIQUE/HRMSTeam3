<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Bulkupload.aspx.cs" Inherits="HRMSTeam3.Admin.Bulkupload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <div class="form-section">
            <h3 class="mb-4">Bulk Upload Employee Data</h3>

            <div class="mb-3">
                <label for="FileUpload1" class="form-label">Upload CSV File</label>
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
            </div>

            <div class="text-end">
                <asp:Button ID="btnUpload" runat="server" Text="Upload CSV" CssClass="btn btn-custom" OnClick="btnUpload_Click" />
            </div>

            <div class="mt-3">
                <asp:Label ID="Label1" runat="server" CssClass="text-success fw-semibold" />
            </div>
        </div>
    </div>
</asp:Content>
