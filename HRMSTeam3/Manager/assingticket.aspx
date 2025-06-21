<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/Manager.Master" AutoEventWireup="true" CodeBehind="assingticket.aspx.cs" Inherits="HRMSTeam3.Manager.assingticket" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
    CssClass="table table-bordered" OnRowCommand="GridView1_RowCommand" >
    <Columns>
        <asp:BoundField DataField="employee_id" HeaderText="Employee ID" />
        <asp:BoundField DataField="name" HeaderText="Name" />
        <asp:BoundField DataField="tik_dept" HeaderText="Department" />
        <asp:BoundField DataField="tik_description" HeaderText="Description" />
        <asp:BoundField DataField="tik_status" HeaderText="Status" />
        <asp:BoundField DataField="closed_by" HeaderText="Closed By" />
        <asp:BoundField DataField="closed_by" HeaderText="Closed By" />
        <asp:TemplateField HeaderText="Attachment">
            <ItemTemplate>
                <a href='<%# Eval("tik_attachment") %>' target="_blank">View</a>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Assign To">
            <ItemTemplate>
                <asp:DropDownList ID="ddlAssignTo" runat="server" CssClass="form-select">
                    <asp:ListItem Text="Select" Value="" />
                    <asp:ListItem Text="Support Team A" Value="Support Team A" />
                    <asp:ListItem Text="Support Team B" Value="Support Team B" />
                    <asp:ListItem Text="Sarthak" Value="Sarthak" />
                </asp:DropDownList>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>
                <asp:Button ID="btnAssign" runat="server" Text="Assign" CommandName="Assign" CssClass="btn btn-primary btn-sm" CommandArgument='<%# Container.DataItemIndex %>' />
                <asp:Button ID="btnClose" runat="server" Text="Close" CommandName="Close" CssClass="btn btn-danger btn-sm" CommandArgument='<%# Container.DataItemIndex %>' />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

</asp:Content>
