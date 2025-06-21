<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/Manager.Master" AutoEventWireup="true" CodeBehind="assingticket.aspx.cs" Inherits="HRMSTeam3.Manager.assingticket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <div class="form-section">
        <div class="bg-white p-4 rounded shadow-sm border">
            <h4 class="mb-4 text-dark fw-semibold">Assign Tickets</h4>
            <div class="grid-wrapper gridview">

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                        CssClass="table table-bordered table-striped table-hover"
                        OnRowCommand="GridView1_RowCommand" HeaderStyle-CssClass="table-dark">
                        <Columns>
                            <asp:BoundField DataField="employee_id" HeaderText="Employee ID" />
                            <asp:BoundField DataField="name" HeaderText="Name" />
                            <asp:BoundField DataField="tik_dept" HeaderText="Department" />
                            <asp:BoundField DataField="tik_description" HeaderText="Description" />
                            <asp:BoundField DataField="tik_status" HeaderText="Status" />
                            <asp:BoundField DataField="closed_by" HeaderText="Closed By" />

                            <asp:TemplateField HeaderText="Attachment">
                                <ItemTemplate>
                                    <a class="btn btn-outline-secondary btn-sm" href='<%# Eval("tik_attachment") %>' target="_blank">
                                        View
                                    </a>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Assign To">
                                <ItemTemplate>
                                    <asp:DropDownList ID="ddlAssignTo" runat="server" CssClass="form-select form-select-sm">
                                        <asp:ListItem Text="Select" Value="" />
                                        <asp:ListItem Text="Meet" Value="Meet" />
                                        <asp:ListItem Text="Sarthak" Value="Sarthak" />
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:Button ID="btnAssign" runat="server" Text="Assign" CommandName="Assign"
                                        CssClass="btn btn-custom btn-sm me-1" CommandArgument='<%# Container.DataItemIndex %>' />
                                    <asp:Button ID="btnClose" runat="server" Text="Close" CommandName="Close"
                                        CssClass="btn btn-danger btn-sm mt-2" CommandArgument='<%# Container.DataItemIndex %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
