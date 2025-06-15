<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Bulkupload.aspx.cs" Inherits="HRMSTeam3.Admin.Bulkupload" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        Bulk Upload Employee Data</p>
    <p>
        &nbsp;</p>
    <asp:FileUpload ID="FileUpload1" runat="server" />
    <br />
    <br />
<asp:Button ID="btnUpload" runat="server" Text="Upload CSV" OnClick="btnUpload_Click" />
    <br />
    <br />
<asp:Label ID="Label1" runat="server" ForeColor="Green" />
</asp:Content>
