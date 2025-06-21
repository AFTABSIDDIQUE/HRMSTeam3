<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="LeaveBalance.aspx.cs" Inherits="HRMSTeam3.User.Leaves_Management_users.LeaveBalance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">

        <div class="form-group">
            <label for="EmName">Enter Name</label>
            <asp:TextBox ID="EmName" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <asp:Button ID="LeaveBalanceBtn" runat="server" Text="View Leave Balances" CssClass="btn btn-primary" OnClick="LeaveBalanceBtn_Click" />
        </div>

        <div class="form-group">
            <asp:GridView ID="LeaveBalanceView" runat="server" CssClass="table table-bordered table-striped table-hover" Width="100%" />
        </div>

        <div class="form-group mt-4">
            <asp:Chart ID="Chart1" runat="server" Width="600px" Height="400px">
                <Series>
                    <asp:Series ChartType="Pie" Name="Series1" />
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1" />
                </ChartAreas>
                <Legends>
                    <asp:Legend Name="Legend1" />
                </Legends>
            </asp:Chart>
        </div>

    </div>
</asp:Content>
