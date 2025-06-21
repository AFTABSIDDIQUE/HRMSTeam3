<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ReportsForLeave.aspx.cs" Inherits="HRMSTeam3.Admin.Reports.LeaveReports" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Leave Report & Analysis</h2>
   <div class="container mt-4">
    <div class="form-group">
        <label for="ddlDepartment">Select Department</label>
        <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-control w-50"
            AutoPostBack="true" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged">
        </asp:DropDownList>
    </div>

    <div class="row mb-4">
        <div class="col-md-6 mb-3">
            <asp:Chart ID="Chart1" runat="server" CssClass="border rounded p-2 bg-light" Width="500" Height="300">
                <Legends>
                    <asp:Legend Name="Legend"></asp:Legend>
                </Legends>
                <Series>
                    <asp:Series ChartType="StackedBar" Name="Series1"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
        </div>

        <div class="col-md-6 mb-3">
            <asp:Chart ID="Chart3" runat="server" CssClass="border rounded p-2 bg-light" Width="500" Height="300">
                <Series>
                    <asp:Series Name="Series1"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea2"></asp:ChartArea>
                </ChartAreas>
                <Legends>
                    <asp:Legend Name="Legend1"></asp:Legend>
                </Legends>
            </asp:Chart>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6 mb-3">
            <asp:Chart ID="Chart2" runat="server" CssClass="border rounded p-2 bg-light" Width="500" Height="300">
                <Series>
                    <asp:Series ChartType="Area" Name="Series1"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea3"></asp:ChartArea>
                </ChartAreas>
                <Legends>
                    <asp:Legend Name="Legend2"></asp:Legend>
                </Legends>
            </asp:Chart>
        </div>

        <div class="col-md-6 mb-3">
            <asp:Chart ID="Chart4" runat="server" CssClass="border rounded p-2 bg-light" Width="500" Height="300">
                <Series>
                    <asp:Series Name="Series1"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea4"></asp:ChartArea>
                </ChartAreas>
                <Legends>
                    <asp:Legend Name="Legend3"></asp:Legend>
                </Legends>
            </asp:Chart>
        </div>
    </div>
</div>


</asp:Content>
