<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="payslip.aspx.cs" Inherits="HRMSTeam3.User.payslip" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5 d-flex justify-content-center">
        <div class="card shadow-sm w-100" style="max-width: 700px;">
            <div class="card-header bg-info text-white text-center">
                <h4 class="mb-0">Your Payslips</h4>
            </div>
            <div class="card-body">

                <!-- Filters -->
                <div class="row mb-4">
                    <div class="col-md-5 mb-2">
                        <label for="DropDownList1" class="form-label">Select Month</label>
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" AutoPostBack="True">
                            <asp:ListItem>January</asp:ListItem>
                            <asp:ListItem>February</asp:ListItem>
                            <asp:ListItem>March</asp:ListItem>
                            <asp:ListItem>April</asp:ListItem>
                            <asp:ListItem>May</asp:ListItem>
                            <asp:ListItem>June</asp:ListItem>
                            <asp:ListItem>July</asp:ListItem>
                            <asp:ListItem>August</asp:ListItem>
                            <asp:ListItem>September</asp:ListItem>
                            <asp:ListItem>October</asp:ListItem>
                            <asp:ListItem>November</asp:ListItem>
                            <asp:ListItem>December</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-5 mb-2">
                        <label for="TextBox1" class="form-label">Enter Year</label>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="e.g., 2024" />
                    </div>
                    <div class="col-md-2 d-flex align-items-end">
                        <asp:Button ID="Button2" runat="server" Text="Apply" CssClass="btn btn-success w-100" OnClick="Button2_Click" />
                    </div>
                </div>

                <!-- Result Label -->
                <asp:Label ID="Label2" runat="server" CssClass="text-danger mb-3 d-block text-center"></asp:Label>

                <!-- GridView -->
                <div class="table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered text-center">
                        <Columns>
                            <asp:BoundField DataField="month" HeaderText="Month" />
                            <asp:BoundField DataField="year" HeaderText="Year" />
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:Button ID="btnDownload" runat="server" Text="Download" CssClass="btn btn-primary btn-sm"
                                        CommandArgument='<%# Eval("FileName") %>' OnCommand="btnDownload_Command" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
