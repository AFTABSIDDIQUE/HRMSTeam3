<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Trainer.aspx.cs" Inherits="HRMSTeam3.Training.Trainer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="form-section">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <span class="grid-header">Trainer Details</span>
                <a href="../Training/AddTrainer.aspx" class="btn btn-custom">Add Trainer</a>
            </div>

                <div class="grid-wrapper gridview">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-striped table-hover" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="tid" HeaderText="Trainer ID" />
                            <asp:BoundField DataField="fname" HeaderText="First Name" />
                            <asp:BoundField DataField="lname" HeaderText="Last Name" />
                            <asp:BoundField DataField="phone" HeaderText="Phone" />
                            <asp:BoundField DataField="email" HeaderText="Email" />

                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("stat") %>' 
                                        CssClass='<%# Eval("stat").ToString() == "Active" ? "badge bg-success" : "badge bg-danger" %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:ImageField DataImageUrlField="timg" HeaderText="Image" ControlStyle-Height="60px" ControlStyle-Width="60px" />


                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <a href="../Training/UpdateTrainer.aspx" class="btn btn-sm btn-custom">
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
