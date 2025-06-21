<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ViewAllEmp.aspx.cs" Inherits="HRMSTeam3.Admin.ViewAllEmp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid mt-4">
        <div class="form-section">
            <h4 class="mb-4">View All Employees</h4>

            <div class="row mb-3 g-2">
                <div class="col-md-2">
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" />
                </div>
                <div class="col-md-2">
                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" />
                </div>
                <div class="col-md-2">
                    <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                        <asp:ListItem>Sort By</asp:ListItem>
                        <asp:ListItem>Asc Sort</asp:ListItem>
                        <asp:ListItem>Desc Sort</asp:ListItem>
                        <asp:ListItem>Recent</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-2">
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Placeholder="Search..." AutoPostBack="True" OnTextChanged="TextBox1_TextChanged" />
                </div>
                <div class="col-md-2">
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" TextMode="Date" />
                </div>
                <div class="col-md-2">
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" TextMode="Date" AutoPostBack="True" OnTextChanged="TextBox3_TextChanged" />
                </div>
            </div>

            <asp:GridView ID="GridView1" runat="server"
                AutoGenerateColumns="False"
                CssClass="table table-bordered table-hover table-striped"
                OnRowDataBound="GridView1_RowDataBound"
                Font-Names="Segoe UI" Font-Size="11px"
                GridLines="None"
                CellPadding="3"
                Width="100%">
                <Columns>
                    <asp:BoundField DataField="employee_id" HeaderText="ID" />
                    <asp:BoundField DataField="full_name" HeaderText="Name" />
                    <asp:BoundField DataField="email" HeaderText="Email" />
                    <asp:BoundField DataField="mobile_num" HeaderText="Mobile" />
                    <asp:BoundField DataField="dob" HeaderText="DOB" />
                    <asp:BoundField DataField="doj" HeaderText="DOJ" />
                    <asp:BoundField DataField="department" HeaderText="Dept" />
                    <asp:BoundField DataField="designation" HeaderText="Designation" />
                    <asp:BoundField DataField="manager" HeaderText="Manager" />

                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("status") %>'
                                CssClass='<%# Eval("status").ToString() == "Active" ? "badge bg-success" : "badge bg-danger" %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="created_at" HeaderText="Created" />
                    <asp:BoundField DataField="emergency_contact" HeaderText="Emergency" />

                    <asp:TemplateField HeaderText="Profile Pic">
                        <ItemTemplate>
                            <asp:Image ID="imgProfile" runat="server"
                                ImageUrl='<%# ResolveUrl(Eval("profile_pic").ToString()) %>'
                                Width="60px" Height="60px"
                                Style="object-fit: cover; border-radius: 4px;" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
