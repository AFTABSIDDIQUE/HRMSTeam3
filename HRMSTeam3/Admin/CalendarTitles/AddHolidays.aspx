<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddHolidays.aspx.cs" Inherits="HRMSTeam3.Admin.Calendar_Titles.AddHolidays" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">

        <div class="form-group">
            <label for="title">Title</label>
            <asp:TextBox ID="title" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="EventList">Event</label>
            <asp:DropDownList ID="EventList" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>

        <div class="form-group">
            <label for="dateId">Date</label>
            <asp:TextBox ID="dateId" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <asp:Button ID="titleBtn" runat="server" Text="Add" OnClick="titleBtn_Click" CssClass="btn btn-primary" />
        </div>

    </div>
</asp:Content>
