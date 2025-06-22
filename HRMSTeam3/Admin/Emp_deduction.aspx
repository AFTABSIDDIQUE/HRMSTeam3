<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Emp_deduction.aspx.cs" Inherits="HRMSTeam3.Admin.Emp_deduction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <div class="card shadow">
            <div class="card-header text-white" style="background-color: #3B060A;">
                <h4 class="mb-0">Add Deduction</h4>
            </div>

            <div class="card-body">
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Deduction Type:</label>
                    <div class="col-sm-6">
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" AutoPostBack="True"></asp:DropDownList>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Department:</label>
                    <div class="col-sm-6">
                        <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Designation:</label>
                    <div class="col-sm-6">
                        <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control" AutoPostBack="True"></asp:DropDownList>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Percentage (%):</label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group row mt-3">
                    <div class="col-sm-8 offset-sm-2">
                        <asp:Button ID="Button2" runat="server" CssClass="btn btn-dark text-white mr-2" Text="Add" OnClick="Button2_Click" />
                        <asp:Button ID="Button3" runat="server" CssClass="btn text-white" Style="background-color: #00897B;" Text="View" OnClick="Button3_Click" />
                    </div>
                </div>
            </div>
        </div>

        <!-- GridView -->
        <div class="card mt-4 shadow">
            <div class="card-header bg-secondary text-white">
                <h5 class="mb-0">Deduction Records</h5>
            </div>
            <div class="card-body">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped"
                              OnRowCommand="GridView1_RowCommand" DataKeyNames="DeductionType,Department,Designation">
                    <Columns>
                        <asp:BoundField DataField="DeductionType" HeaderText="Deduction Type" />
                        <asp:BoundField DataField="Department" HeaderText="Department" />
                        <asp:BoundField DataField="Designation" HeaderText="Designation" />
                        <asp:BoundField DataField="Percentage" HeaderText="Percentage (%)" />

                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditRow"
                                                CommandArgument='<%# Container.DataItemIndex %>'
                                                CssClass="btn btn-sm btn-primary mr-2" ToolTip="Edit">
                                    <i class="fas fa-edit"></i> Edit
                                </asp:LinkButton>

                                <asp:LinkButton ID="btnDelete" runat="server" CommandName="DeleteRow"
                                                CommandArgument='<%# Container.DataItemIndex %>'
                                                CssClass="btn btn-sm btn-danger"
                                                OnClientClick="return confirm('Are you sure you want to delete this deduction?');"
                                                ToolTip="Delete">
                                    <i class="fas fa-trash-alt"></i> Delete
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
