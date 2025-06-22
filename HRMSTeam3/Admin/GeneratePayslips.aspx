<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="GeneratePayslips.aspx.cs" Inherits="HRMSTeam3.Admin.GeneratePayslips" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-5 mb-5 d-flex justify-content-center">
        <div class="card shadow-sm" style="width: 100%; max-width: 600px;">
            <div class="card-header text-white text-center" style="background-color: #3B060A;">
                <h4 class="mb-0">Generate Payslip</h4>
            </div>
            <div class="card-body">

                <!-- Employee Selection -->
                <div class="form-group mb-3">
                    <label for="DropDownList1">Select Employee:</label>
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                </div>

                <!-- Employee Name -->
                <div class="form-group mb-3">
                    <label for="TextBox2">Employee Name:</label>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" ReadOnly="True" placeholder="Employee full name will appear here" />
                </div>

                <!-- Month Selection -->
                <div class="form-group mb-3">
                    <label for="DropDownList2">Select Month:</label>
                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control">
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

                <!-- Year Input -->
                <div class="form-group mb-4">
                    <label for="TextBox1">Enter Year:</label>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="e.g., 2024" />
                </div>

                <!-- Button -->
                <div class="form-group text-center">
                    <asp:Button ID="Button2" runat="server" CssClass="btn text-white px-4" Style="background-color: #3B060A;" Text="Generate Payslip" OnClick="Button2_Click" />
                </div>

            </div>
        </div>
    </div>
</asp:Content>