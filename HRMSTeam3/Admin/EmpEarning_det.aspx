<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="EmpEarning_det.aspx.cs" Inherits="HRMSTeam3.Admin.EmpEarning_det" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    
    <div class="container mt-4">
        <div class="card shadow">
            <div class="card-header text-white" style="background-color: #3B060A;">
                <h4 class="mb-0">Add Earnings</h4>
            </div>


            <div class="card-body">
                <!-- Earning Type -->
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Earning Type:</label>
                    <div class="col-sm-6">
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" AutoPostBack="True"></asp:DropDownList>
                    </div>
                </div>

                <!-- Department -->
                <div class="form-group row mt-3">
                    <label class="col-sm-2 col-form-label">Department:</label>
                    <div class="col-sm-6">
                        <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </div>

                <!-- Designation -->
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Designation:</label>
                    <div class="col-sm-6">
                        <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control" AutoPostBack="True"></asp:DropDownList>
                    </div>
                </div>

                <!-- Percentage -->
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Percentage (%):</label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Enter percentage"></asp:TextBox>
                    </div>
                </div>

                <!-- Buttons -->
                <div class="form-group row">
                    <div class="col-sm-8 offset-sm-2">
                        <asp:Button ID="Button2" runat="server" CssClass="btn btn-dark text-white mr-2" Text="Add" OnClick="Button2_Click" />
                        <asp:Button ID="Button3" runat="server" CssClass="btn text-white" Style="background-color: #00897B;" Text="View" OnClick="Button3_Click" />
                    </div>
                </div>
            </div>
        </div>

        <!-- GridView -->
        <div class="mt-4">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Visible="False"
    CssClass="table table-bordered table-striped"
    OnRowCommand="GridView1_RowCommand" DataKeyNames="EarningType,Department,Designation">
    <Columns>
        <asp:BoundField DataField="EarningType" HeaderText="Earning Type" />
        <asp:BoundField DataField="Department" HeaderText="Department" />
        <asp:BoundField DataField="Designation" HeaderText="Designation" />
        <asp:BoundField DataField="Percentage" HeaderText="Percentage (%)" />

        <asp:TemplateField HeaderText="Action">
            <ItemTemplate>
                <asp:Button ID="btnEdit" runat="server"
                    CommandName="EditRow"
                    CommandArgument='<%# Container.DataItemIndex %>'
                    Text="Edit" CssClass="btn btn-sm btn-warning mr-2" />

                <asp:Button ID="btnDelete" runat="server"
                    CommandName="DeleteRow"
                    CommandArgument='<%# Container.DataItemIndex %>'
                    Text="Delete" CssClass="btn btn-sm btn-danger"
                    OnClientClick="return confirm('Are you sure you want to delete this record?');" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>


       <!-- Edit Modal -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header bg-primary text-white">
        <h5 class="modal-title" id="editModalLabel">Edit Earning</h5>
        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="form-group">
          <label>Earning Type</label>
          <asp:DropDownList ID="ddlEditEarningType" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="form-group">
          <label>Department</label>
          <asp:DropDownList ID="ddlEditDepartment" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="form-group">
          <label>Designation</label>
          <asp:DropDownList ID="ddlEditDesignation" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="form-group">
          <label>Percentage</label>
          <asp:TextBox ID="txtEditPercentage" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
      </div>
      <div class="modal-footer">
        <asp:Button ID="btnUpdateEarning" runat="server" Text="Update" CssClass="btn btn-success" OnClick="btnUpdateEarning_Click" />
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


        </div>
    </div>
</asp:Content>
