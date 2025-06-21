<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddPIndicator.aspx.cs" Inherits="HRMSTeam3.Admin.AddPIndicator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="form-section">
            <h3 class="mb-4">Add New Indicator</h3>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label>Designation</label>
                    <asp:DropDownList ID="DropDownList10" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="DropDownList10_SelectedIndexChanged" />
                </div>
                <div class="col-md-6">
                    <label>Department</label>
                    <asp:DropDownList ID="DropDownList11" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="DropDownList11_SelectedIndexChanged" />
                </div>
            </div>

            <h5 class="mt-4">Technical</h5>
            <div class="row mb-3">
                <div class="col-md-3">
                    <label>Customer Experience</label>
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-select" >
                        <asp:ListItem>Beginer</asp:ListItem>
                        <asp:ListItem>Intermidate</asp:ListItem>
                        <asp:ListItem>Advanced</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-3">
                    <label>Marketing</label>
                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-select" >
                        <asp:ListItem>Beginer </asp:ListItem>
                        <asp:ListItem>Intermidate</asp:ListItem>
                        <asp:ListItem>Advanced</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-3">
                    <label>Management</label>
                    <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-select" >
                        <asp:ListItem>Beginer</asp:ListItem>
                        <asp:ListItem>Intermidate</asp:ListItem>
                        <asp:ListItem>Advanced</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-3">
                    <label>Administration</label>
                    <asp:DropDownList ID="DropDownList4" runat="server" CssClass="form-select" >
                        <asp:ListItem>Beginer</asp:ListItem>
                        <asp:ListItem>Intermidate</asp:ListItem>
                        <asp:ListItem>Advanced</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <h5 class="mt-4">Organizational</h5>
            <div class="row mb-3">
                <div class="col-md-3">
                    <label>Integrity</label>
                    <asp:DropDownList ID="DropDownList5" runat="server" CssClass="form-select" >
                        <asp:ListItem>Begineer</asp:ListItem>
                        <asp:ListItem>Intermidate</asp:ListItem>
                        <asp:ListItem>Advanced</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-3">
                    <label>Professionalism</label>
                    <asp:DropDownList ID="DropDownList6" runat="server" CssClass="form-select" >
                        <asp:ListItem>Beginer</asp:ListItem>
                        <asp:ListItem>Intermidate</asp:ListItem>
                        <asp:ListItem>Advanced</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-3">
                    <label>Team Work</label>
                    <asp:DropDownList ID="DropDownList7" runat="server" CssClass="form-select" >
                        <asp:ListItem>Beginer</asp:ListItem>
                        <asp:ListItem>Intermidate</asp:ListItem>
                        <asp:ListItem>Advanced</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-3">
                    <label>Critical Thinking</label>
                    <asp:DropDownList ID="DropDownList8" runat="server" CssClass="form-select" >
                        <asp:ListItem>Beginer</asp:ListItem>
                        <asp:ListItem>Intermediate</asp:ListItem>
                        <asp:ListItem>Advanced</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label>Status</label>
                    <asp:DropDownList ID="DropDownList9" runat="server" CssClass="form-select">
                        <asp:ListItem>Active</asp:ListItem>
                        <asp:ListItem>InActive</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="text-end">
                <asp:Button ID="Button2" runat="server" Text="Add Indicator" CssClass="btn btn-custom" OnClick="Button2_Click" />
            </div>
        </div>
    </div>
</asp:Content>
