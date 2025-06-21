<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ReportsForPayroll.aspx.cs" Inherits="HRMSTeam3.Admin.Reports.ReportsForPayroll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-4">
        <h3>Payroll Contribution Analysis</h3>
        <div class="row mb-3">
            <div class="col-md-4">
                <label>Department</label>
                <asp:DropDownList ID="ddlDepartment" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged" CssClass="form-control">
                </asp:DropDownList>
            </div>
            
        </div>

        <div class="row">
            <div class="col-md-6">
                <asp:Chart ID="Chart1" runat="server" Width="847px" Height="586px">
                    <ChartAreas>
                        <asp:ChartArea Name="EarningArea"></asp:ChartArea>
                    </ChartAreas>
                    <Legends>
                        <asp:Legend Name="Legend1"></asp:Legend>
                    </Legends>
                </asp:Chart>
            </div>
            
        </div>
    </div>

</asp:Content>
