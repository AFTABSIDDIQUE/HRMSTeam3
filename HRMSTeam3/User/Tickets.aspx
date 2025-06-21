<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Tickets.aspx.cs" Inherits="HRMSTeam3.User.Tickets" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <div class="card shadow-sm">
            <div class="card-header text-white" style="background-color: #311E10;">
                <h5 class="mb-0">Raise a Ticket</h5>
            </div>
            <div class="card-body">

                <div class="mb-3">
                    <label for="TextBox1" class="form-label">Name</label>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" />
                </div>

                <div class="mb-3">
                    <label for="TextBox3" class="form-label">Employee ID</label>
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" />
                </div>

                <div class="mb-3">
                    <label for="DropDownList1" class="form-label">Ticket Raised For</label>
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-select">
                        <asp:ListItem Text="" Value="" />
                        <asp:ListItem>IT</asp:ListItem>
                        <asp:ListItem>HR</asp:ListItem>
                        <asp:ListItem>Sales</asp:ListItem>
                        <asp:ListItem>Marketing</asp:ListItem>
                        <asp:ListItem>Support</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="mb-3">
                    <label for="TextBox2" class="form-label">Ticket Description</label>
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" />
                </div>

                <div class="mb-4">
                    <label for="FileUpload1" class="form-label">Attachments</label>
                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                </div>

                <div class="d-flex gap-3">
                    <asp:Button ID="Button2" runat="server" Text="Raise Ticket" CssClass="btn btn-custom" OnClick="Button2_Click" />
                    <asp:Button ID="Button3" runat="server" Text="View Tickets" CssClass="btn btn-secondary" OnClick="Button3_Click" />
                </div>

            </div>
        </div>
    </div>
</asp:Content>
