<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/Manager.Master" AutoEventWireup="true" CodeBehind="LeavePolicySetup.aspx.cs" Inherits="HRMSTeam3.Manager.Leave_Management.LeavePolicySetup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-4">
        <div class="form-group row">
            <label for="department" class="col-sm-2 col-form-label">Department&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="department" ErrorMessage="*Enter Department" ForeColor="Red"></asp:RequiredFieldValidator>
            </label>
&nbsp;<div class="col-sm-6">
                <asp:TextBox ID="department" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        <div class="form-group row">
            <label for="LeaveTitleId" class="col-sm-2 col-form-label">Leave Title&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="EntitlementsId" ErrorMessage="*Enter title" ForeColor="Red"></asp:RequiredFieldValidator>
            </label>
            &nbsp;<div class="col-sm-6">
                <asp:TextBox ID="LeaveTitleId" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <br />
        <div class="form-group row">
            <label for="EntitlementsId" class="col-sm-2 col-form-label">Leave Entitlements&nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="EntitlementsId" ErrorMessage="*Enter Entitlements" ForeColor="Red"></asp:RequiredFieldValidator>
            </label>
            &nbsp;<div class="col-sm-6">
                <asp:TextBox ID="EntitlementsId" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-6 offset-sm-2">
                <asp:Button ID="AddLeaveBtn" runat="server" OnClick="AddLeaveBtn_Click" Text="Add Leave" CssClass="btn btn-primary" />
            </div>
        </div>
    </div>

</asp:Content>
