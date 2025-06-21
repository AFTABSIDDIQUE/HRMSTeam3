<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="yourtickets.aspx.cs" Inherits="HRMSTeam3.User.yourtickets" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <div class="card shadow-sm">
            <div class="card-header bg-primary text-white">
                <h5 class="mb-0">Your Tickets</h5>
            </div>
            <div class="card-body">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                    CssClass="table table-sm table-striped table-bordered text-nowrap"
                    Font-Names="Segoe UI" Font-Size="11px"
                    GridLines="None" CellPadding="4"
                    Width="100%">
                    
                    <Columns>
                        <asp:BoundField DataField="employee_id" HeaderText="Emp ID">
                            <ItemStyle Width="60px" />
                        </asp:BoundField>

                        <asp:BoundField DataField="name" HeaderText="Name">
                            <ItemStyle Width="120px" />
                        </asp:BoundField>

                        <asp:BoundField DataField="tik_dept" HeaderText="Department">
                            <ItemStyle Width="100px" />
                        </asp:BoundField>

                        <asp:BoundField DataField="tik_description" HeaderText="Description">
                            <ItemStyle Width="200px" />
                        </asp:BoundField>

                        <asp:BoundField DataField="tik_status" HeaderText="Status">
                            <ItemStyle Width="80px" />
                        </asp:BoundField>

                        <asp:TemplateField HeaderText="Attachment">
                            <ItemStyle Width="80px" />
                            <ItemTemplate>
                                <a href='<%# Eval("tik_attachment") %>' target="_blank" class="btn btn-outline-primary btn-sm">View</a>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="assinged_to" HeaderText="Assigned To">
                            <ItemStyle Width="120px" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
