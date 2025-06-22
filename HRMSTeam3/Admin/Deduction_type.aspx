<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Deduction_type.aspx.cs" Inherits="HRMSTeam3.Admin.Deduction_type" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <div class="card shadow">
            <div class="card-header text-white" style="background-color: #3B060A;">
                <h4 class="mb-0">Add Deduction Type</h4>
            </div>

            <div class="card-body">
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Deduction Type:</label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Enter Deduction Type"></asp:TextBox>
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

        <!-- GridView Section -->
        <div class="card mt-4 shadow">
            <div class="card-header bg-secondary text-white">
                <h5 class="mb-0">Deduction Types</h5>
            </div>
            <div class="card-body">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped"
                    OnRowCommand="GridView1_RowCommand" DataKeyNames="DeductionTypeID">
                    <Columns>
                        <asp:BoundField DataField="DeductionTypeID" HeaderText="ID" />
                        <asp:BoundField DataField="DeductionTypeName" HeaderText="Deduction Type" />

                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnDelete" runat="server" CommandName="DeleteRow" 
                                    CommandArgument='<%# Eval("DeductionTypeID") %>' CssClass="btn btn-danger btn-sm"
                                    OnClientClick="return confirm('Are you sure you want to delete this deduction type?');">
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
