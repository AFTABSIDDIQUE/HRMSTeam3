<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Attendence.aspx.cs" Inherits="HRMSTeam3.User.Attendence" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <div class="card shadow mx-auto" style="max-width: 400px;">
            <div class="card-body text-center">
                <asp:Image ID="imgProfile" runat="server" CssClass="rounded-circle mb-3" Height="150px" Width="150px" Style="object-fit: cover;" />
                
                <asp:Label ID="lblName" runat="server" CssClass="h5 fw-semibold d-block mb-4" Text="User Name"></asp:Label>
                
                <div class="d-flex justify-content-center gap-3 mb-3">
                    <asp:Button ID="btnCheckIn" runat="server" CssClass="btn btn-success" Text="Check In" OnClick="btnCheckIn_Click" />
                    <asp:Button ID="btnCheckOut" runat="server" CssClass="btn btn-danger" Text="Check Out" OnClick="btnCheckOut_Click" />
                </div>

                <asp:Label ID="lblStatus" runat="server" CssClass="text-muted mt-2 d-block"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
