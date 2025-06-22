<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="LeaveBalance.aspx.cs" Inherits="HRMSTeam3.User.Leaves_Management_users.LeaveBalance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <div class="form-section">
            <div class="card-header card-header-custom">
                <h5 class="mb-0">Leave Balance</h5>
            </div>

            <div class="card-body">
                <div class="mb-3">
                    <label for="EmName" class="form-label">Enter Name</label>
                    <asp:TextBox ID="EmName" runat="server" CssClass="form-control" />
                </div>

                <div class="mb-4">
                    <asp:Button ID="LeaveBalanceBtn" runat="server" Text="View Leave Balances" CssClass="btn btn-custom" OnClick="LeaveBalanceBtn_Click" />
                </div>

                <div class="mb-4">
                    <asp:GridView ID="LeaveBalanceView" runat="server" CssClass="table table-bordered table-striped table-hover" Width="100%" />
                </div>

                <div class="mb-3">
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
        </div>
    </div>
</asp:Content>
