<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="EmpSalaries.aspx.cs" Inherits="HRMSTeam3.Admin.EmpSalaries" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <div class="card shadow">
            <div class="card-header text-white" style="background-color: #3B060A;">
                <h4 class="mb-0">Employee Salary </h4>
            </div>
            <div class="card-body">

                <!-- Department -->
                <div class="form-group">
                    <label>Department:</label>
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" />
                </div>

                <!-- Designation -->
                <div class="form-group">
                    <label>Designation:</label>
                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" />
                </div>

                <!-- Employee -->
                <div class="form-group">
                    <label>Employee:</label>
                    <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control" AutoPostBack="True" />
                </div>

                <!-- Total Salary -->
                <div class="form-group">
                    <label>Total Salary:</label>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged" />
                </div>

               <!-- Earnings -->
<div class="form-group">
    <label><strong>Earnings:</strong></label>
    <div class="card border-success mb-3">
        <div class="card-body" style="background-color: #f8fff8;">
            <asp:PlaceHolder ID="PlaceHolder1" runat="server" />
        </div>
    </div>
</div>

<!-- Deductions -->
<div class="form-group">
    <label><strong>Deductions:</strong></label>
    <div class="card border-danger mb-3">
        <div class="card-body" style="background-color: #fff8f8;">
            <asp:PlaceHolder ID="PlaceHolder3" runat="server" />
        </div>
    </div>
</div>


                <!-- Buttons -->
                <div class="form-group text-center">
                    <asp:Button ID="Button2" runat="server" Text="Add Salary Record" CssClass="btn btn-info" OnClick="Button2_Click" />
                    <asp:Label ID="Label2" runat="server" CssClass="text-success d-block mt-2" />
                </div>

            </div>
        </div>
    </div>
</asp:Content>
