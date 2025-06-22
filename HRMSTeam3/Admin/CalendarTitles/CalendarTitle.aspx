<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="CalendarTitle.aspx.cs" Inherits="HRMSTeam3.Admin.Calendar_Titles.CalendarTitle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <div class="d-flex justify-content-center">
            <asp:Calendar ID="Calendar1" runat="server"
                CssClass="border rounded p-2 bg-light"
                Height="405px" Width="1056px"
                OnDayRender="Calendar1_DayRender">
            </asp:Calendar>
        </div>
    </div>
</asp:Content>
