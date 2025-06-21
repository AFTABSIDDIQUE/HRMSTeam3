<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Training.aspx.cs" Inherits="HRMSTeam3.User.Training" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <h4 class="mb-3">Available Trainings</h4>

        <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" CellPadding="10" CssClass="row">
            <ItemTemplate>
                <div class="card mb-4 shadow-sm me-3" style="min-width: 250px;">
                    <div class="card-body">
                        <h5 class="card-title"><%# Eval("trainerName") %></h5>
                        <p class="card-text mb-1"><strong>Type:</strong> <%# Eval("trainingType") %></p>
                        <p class="card-text mb-1"><strong>Cost:</strong> ₹<%# Eval("trainingCost") %></p>
                        <p class="card-text mb-1"><strong>Duration:</strong> <%# Eval("startDate") %> to <%# Eval("endDate") %></p>
                        <p class="card-text mb-3"><strong>Status:</strong> 
                            <span class='<%# Eval("stat").ToString() == "Active" ? "badge bg-success" : "badge bg-danger" %>'>
                                <%# Eval("stat") %>
                            </span>
                        </p>
                        <asp:Button ID="btnEnroll" runat="server" Text="Enroll"
                            CssClass="btn btn-primary w-100"
                            CommandName="Enroll"
                            CommandArgument='<%# Eval("trainingAId") %>' OnClick="btnEnroll_Click" />
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
