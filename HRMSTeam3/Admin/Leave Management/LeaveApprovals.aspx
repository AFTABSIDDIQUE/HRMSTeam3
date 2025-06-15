<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="LeaveApprovals.aspx.cs" Inherits="HRMSTeam3.Admin.Leave_Management.LeaveApprovals" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="ApproveGrid" runat="server"
    BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="4"  GridLines="Both"
    HeaderStyle-Font-Bold="True"
    AutoGenerateColumns="True"
    OnRowCommand="ApproveGrid_RowCommand" >
    <Columns>
        <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>
                <asp:LinkButton ID="btnApprove" runat="server"
                    Text="Approve"
                    CommandName="Approve"
                    CommandArgument='<%# Eval("leaveRequestId") %>' />
                &nbsp;
                <asp:LinkButton ID="btnReject" runat="server"
                    Text="Reject"
                    CommandName="Reject"
                    CommandArgument='<%# Eval("leaveRequestId") %>' />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
    <br />
    <br />
    <asp:Button ID="CheckStatId" runat="server" Text="View Leave Status" OnClick="CheckStatId_Click" />
    <asp:GridView ID="CheckStatLeave" runat="server"></asp:GridView>
 </asp:Content>
