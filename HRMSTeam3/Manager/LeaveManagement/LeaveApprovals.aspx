<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/Manager.Master" AutoEventWireup="true" CodeBehind="LeaveApprovals.aspx.cs" Inherits="HRMSTeam3.Manager.Leave_Management.LeaveApprovals" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-4">

        <asp:GridView ID="ApproveGrid" runat="server"
            CssClass="table table-bordered table-striped"
            AutoGenerateColumns="True"
            OnRowCommand="ApproveGrid_RowCommand"
            Width="100%">

            <Columns>
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnApprove" runat="server" Text="Approve"
                            CssClass="btn btn-success btn-sm"
                            CommandName="Approve"
                            CommandArgument='<%# Eval("requestId") %>' />
                        &nbsp;
                        <asp:LinkButton ID="btnReject" runat="server" Text="Reject"
                            CssClass="btn btn-danger btn-sm"
                            CommandName="Reject"
                            CommandArgument='<%# Eval("requestId") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <br />

        <asp:Button ID="CheckStatId" runat="server" Text="View Leave Status"
            CssClass="btn btn-primary" OnClick="CheckStatId_Click" />

        <br /><br />

        <asp:GridView ID="CheckStatLeave" runat="server"
            CssClass="table table-hover table-bordered"
            Width="100%">
        </asp:GridView>

    </div>

</asp:Content>
