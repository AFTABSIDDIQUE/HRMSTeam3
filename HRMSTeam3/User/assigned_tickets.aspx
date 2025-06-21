<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="assigned_tickets.aspx.cs" Inherits="HRMSTeam3.User.assigned_tickets" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
    CssClass="table table-bordered table-sm" OnRowCommand="GridView1_RowCommand">
    <Columns>
        <asp:BoundField DataField="employee_id" HeaderText="Emp ID" />
        <asp:BoundField DataField="name" HeaderText="Name" />
        <asp:BoundField DataField="tik_dept" HeaderText="Department" />
        <asp:BoundField DataField="tik_description" HeaderText="Description" />
        <asp:BoundField DataField="tik_status" HeaderText="Status" />
        <asp:TemplateField HeaderText="Attachment">
            <ItemTemplate>
                <a href='<%# Eval("tik_attachment") %>' target="_blank">View</a>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="assinged_to" HeaderText="Assigned To" />
        <asp:TemplateField HeaderText="Action">
            <ItemTemplate>
                <asp:Button ID="btnClose" runat="server" Text="Close" CommandName="closebtn"
                    CommandArgument='<%# Eval("employee_id") %>' CssClass="btn btn-danger btn-sm" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>


</asp:Content>
