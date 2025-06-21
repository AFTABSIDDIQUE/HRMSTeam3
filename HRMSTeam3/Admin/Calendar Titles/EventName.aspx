<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="EventName.aspx.cs" Inherits="HRMSTeam3.Admin.Calendar_Titles.EventName" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">

        <div class="form-group">
            <label for="eventId">Event Name</label>
            <asp:TextBox ID="eventId" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="DropDownList1">Status</label>
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                <asp:ListItem>Active</asp:ListItem>
                <asp:ListItem>Inactive</asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <label for="ColorId">Colour</label>
            <asp:TextBox ID="ColorId" runat="server" TextMode="Color" ></asp:TextBox>
        </div>

        <div class="form-group">
            <asp:Button ID="EventBtn" runat="server" Text="Add" OnClick="EventBtn_Click1" CssClass="btn btn-primary" />
        </div>

    </div>
</asp:Content>
