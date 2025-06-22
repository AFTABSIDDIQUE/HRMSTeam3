<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="TransactionHistory.aspx.cs" Inherits="HRMSTeam3.Admin.TransactionHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <div class="card shadow-sm">
            <div class="card-header bg-dark text-white d-flex justify-content-between align-items-center">
                <h4 class="mb-0">Transaction History</h4>
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="View All Records" CssClass="btn btn-warning btn-sm" />
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <div class="row mt-3 mb-4">
    <div class="col-md-3">
        <label>Department</label>
        <asp:DropDownList ID="ddlFilterDepartment" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="FilterChanged" />
    </div>
    <div class="col-md-3">
        <label>Month</label>
        <asp:DropDownList ID="ddlFilterMonth" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="FilterChanged" />
    </div>
    <div class="col-md-3">
        <label>Year</label>
        <asp:DropDownList ID="ddlFilterYear" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="FilterChanged" />
    </div>
</div>

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover text-center"
                        HeaderStyle-CssClass="thead-dark" OnRowCommand="GridView1_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="employee_id" HeaderText="Emp ID" />
                            <asp:BoundField DataField="full_name" HeaderText="Employee" />
                            <asp:BoundField DataField="email" HeaderText="Email" />
                            <asp:BoundField DataField="mobile_num" HeaderText="Phone" />
                            <asp:BoundField DataField="DeptName" HeaderText="Department" />
                            <asp:BoundField DataField="month" HeaderText="Month" />
                            <asp:BoundField DataField="year" HeaderText="Year" />
                            <asp:BoundField DataField="GeneratedOn" HeaderText="Generated On" />
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:Button ID="btnView" runat="server" Text="View" CssClass="btn btn-sm btn-primary me-1"
                                        CommandName="ViewPayslip"
                                        CommandArgument='<%# Eval("employee_id") + "|" + Eval("month") + "_" + Eval("year") %>' />
                                    <asp:Button ID="btnDownload" runat="server" Text="Download" CssClass="btn btn-sm btn-success"
                                        CommandName="DownloadPayslip"
                                        CommandArgument='<%# Eval("employee_id") + "|" + Eval("month") + "_" + Eval("year") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
