<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Training.aspx.cs" Inherits="HRMSTeam3.Training.Training" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
        <div class="form-section">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <span class="grid-header">Assign Training</span>
                <a href="../Training/AddTrainingList.aspx" class="btn btn-custom">Assign Training</a>
            </div>

                <div class="grid-wrapper gridview">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-striped table-hover" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="trainingAId" HeaderText="Training ID" />
                            <asp:BoundField DataField="trainerName" HeaderText="Training Name" />
                            <asp:BoundField DataField="trainingType" HeaderText="Training Type" />
                            <asp:BoundField DataField="employeeName" HeaderText="EmployeeName" />
                            <asp:BoundField DataField="trainingCost" HeaderText="Training Cost" />
                            <asp:BoundField DataField="descp" HeaderText="Description" />

                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("stat") %>' 
                                        CssClass='<%# Eval("stat").ToString() == "Active" ? "badge bg-success" : "badge bg-danger" %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <a href="../Training/UpdateTrainingList.aspx" class="btn btn-sm btn-custom">
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
