<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="TrainingType.aspx.cs" Inherits="HRMSTeam3.Training.TrainingType" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="form-section">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <span class="grid-header">Training Type</span>
                <a href="../Training/AddTrainingType.aspx" class="btn btn-custom">Add Training</a>
            </div>

                <div class="grid-wrapper gridview">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-striped table-hover" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="ttypeid" HeaderText="Training ID" />
                            <asp:BoundField DataField="trainingname" HeaderText="Training Name" />
                            <asp:BoundField DataField="trainingDesc" HeaderText="Description" />

                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("status") %>' 
                                        CssClass='<%# Eval("status").ToString() == "Active" ? "badge bg-success" : "badge bg-danger" %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <a  href="../Training/UpdateTrainigType.aspx" class="btn btn-sm btn-custom">
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
