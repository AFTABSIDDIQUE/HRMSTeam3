<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="user.aspx.cs" Inherits="HRMSTeam3.UserCreation.user" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
        <div class="form-section">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <span class="grid-header">User Details</span>
                <a href="../UserCreation/UserCreation.aspx" class="btn btn-custom">Add User</a>
            </div>

                <div class="grid-wrapper gridview">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-striped table-hover" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="userId" HeaderText="Training ID" />
                            <asp:BoundField DataField="fname" HeaderText="Training Name" />
                            <asp:BoundField DataField="email" HeaderText="Description" />
                            <asp:BoundField DataField="dob" HeaderText="Training Cost" />
                            <asp:BoundField DataField="address" HeaderText="Description" />
                            <asp:BoundField DataField="deptId" HeaderText="Description" />
                            <asp:BoundField DataField="roleId" HeaderText="Description" />
                            <asp:BoundField DataField="designation" HeaderText="Description" />

                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("stat") %>' 
                                        CssClass='<%# Eval("stat").ToString() == "Active" ? "badge bg-success" : "badge bg-danger" %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <a href="UserUpdation.aspx" class="btn btn-sm btn-custom">
                                        Update
                                    </a>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>

            </div>
        </div>
</asp:Content>
