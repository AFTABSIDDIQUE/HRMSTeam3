<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="LeaveCalender.aspx.cs" Inherits="HRMSTeam3.User.Leaves_Management_users.LeaveCalender" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <div class="card">
            <div class="card-header bg-primary text-white">
                Leave Calendar
            </div>
            <div class="card-body">
                <asp:Calendar ID="Calendar1" runat="server" 
                    CssClass="table table-bordered"
                    Height="556px" Width="940px"
                    OnDayRender="Calendar1_DayRender">
                </asp:Calendar>
            </div>
        </div>
    </div>
</asp:Content>
