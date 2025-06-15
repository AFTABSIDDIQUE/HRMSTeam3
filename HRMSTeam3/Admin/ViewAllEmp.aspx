<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ViewAllEmp.aspx.cs" Inherits="HRMSTeam3.Admin.ViewAllEmp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="employee_id" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" Height="147px" Width="935px">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:BoundField DataField="employee_id" HeaderText="employee_id" InsertVisible="False" ReadOnly="True" SortExpression="employee_id" />
        <asp:BoundField DataField="full_name" HeaderText="full_name" SortExpression="full_name" />
        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
        <asp:BoundField DataField="mobile_num" HeaderText="mobile_num" SortExpression="mobile_num" />
        <asp:BoundField DataField="dob" HeaderText="dob" SortExpression="dob" />
        <asp:BoundField DataField="doj" HeaderText="doj" SortExpression="doj" />
        <asp:BoundField DataField="department" HeaderText="department" SortExpression="department" />
        <asp:BoundField DataField="designation" HeaderText="designation" SortExpression="designation" />
        <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
        <asp:BoundField DataField="created_at" HeaderText="created_at" SortExpression="created_at" />
        <asp:BoundField DataField="emergency_contact" HeaderText="emergency_contact" SortExpression="emergency_contact" />
    </Columns>
    <EditRowStyle BackColor="#7C6F57" />
    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#E3EAEB" />
    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#F8FAFA" />
    <SortedAscendingHeaderStyle BackColor="#246B61" />
    <SortedDescendingCellStyle BackColor="#D4DFE1" />
    <SortedDescendingHeaderStyle BackColor="#15524A" />
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" SelectCommand="SELECT * FROM [Employees]"></asp:SqlDataSource>
</asp:Content>
