<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Attendence.aspx.cs" Inherits="HRMSTeam3.User.Attendence" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                <div class="card mx-auto" style="width: 20rem;">
               <asp:Image ID="imgProfile" runat="server" CssClass="card-img-top rounded-circle mx-auto d-block mt-3" Height="150px" Width="150px" Style="object-fit: cover;" />
                <div class="card-body text-center">
                <asp:Label ID="lblName" runat="server" CssClass="h5 d-block mb-3" Text="User Name"></asp:Label>     
                <asp:Button ID="btnCheckIn" runat="server" CssClass="btn btn-success me-2" Text="Check In" OnClick="btnCheckIn_Click" />
                <asp:Button ID="btnCheckOut" runat="server" CssClass="btn btn-danger ms-2" Text="Check Out" OnClick="btnCheckOut_Click" />
                <asp:Label ID="lblStatus" runat="server" CssClass="text-muted mt-3 d-block"></asp:Label>
             </div>
             </div>
            
     
 </asp:Content>
