<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Earning_type.aspx.cs" Inherits="HRMSTeam3.Admin.Earning_type" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <div class="container mt-4">
        <div class="card shadow">
            <div class="card-header text-white" style="background-color: #3B060A;">
                <h4 class="mb-0">Add Earning Type</h4>
            </div>
            <div class="card-body">
                <!-- Input Field -->
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Earning Type:</label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Enter earning type name"></asp:TextBox>
                    </div>
                </div>
                <!-- Buttons -->
                <div class="form-group row mt-3">
                    <div class="col-sm-8 offset-sm-2">
                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Add" CssClass="btn btn-dark text-white mr-2" />
                        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="View" CssClass="btn text-white" Style="background-color: #00897B;" />
                    </div>
                </div>
            </div>
        </div>

        <!-- Success Alert Panel -->
        <asp:Panel ID="Panel1" runat="server" CssClass="alert alert-success alert-dismissible fade show mt-4" Visible="false" role="alert">
            <strong>Success!</strong>
            <asp:Label ID="alertMsg" runat="server" Text="Earning Type added successfully." CssClass="font-weight-bold" />
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </asp:Panel>

        <!-- GridView -->
        <div class="mt-4">
           <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Visible="false" CssClass="table table-bordered table-hover text-center shadow-sm" GridLines="None" HeaderStyle-CssClass="thead-dark">
                <Columns>
                    <asp:BoundField DataField="EarningTypeID" HeaderText="ID" />
                    <asp:BoundField DataField="EarningTypeName" HeaderText="Earning Type" />
                    <asp:TemplateField HeaderText="Action">
              <ItemTemplate>
               <asp:LinkButton ID="btnDelete" runat="server" CommandName="DeleteRow" 
                CommandArgument='<%# Eval("EarningTypeID") %>' CssClass="btn btn-danger btn-sm"
                 OnClientClick ="return confirm('Are you sure you want to delete this earning type?');">
                   <i class="fas fa-trash-alt"></i> Delete
                </asp:LinkButton>

               </ItemTemplate>
              </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>

</asp:Content>
