<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Training.aspx.cs" Inherits="HRMSTeam3.User.Training" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        &nbsp;Trainings&nbsp;&nbsp;
            <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" CellPadding="5">
                <ItemTemplate>
                    <div style="border:1px solid #ccc; padding:10px;">
                        Trainer: <strong><%# Eval("trainerName") %></strong><br />
                        Type: <%# Eval("trainingType") %><br />
                        Cost: ₹<%# Eval("trainingCost") %><br />Duration: <%# Eval("startDate") %> to <%# Eval("endDate") %><br />
                        Status: <%# Eval("stat") %><br /><br />
            
                        <asp:Button ID="btnEnroll" runat="server" Text="Enroll" OnClick="btnEnroll_Click"
                            CommandName="Enroll" 
                            CommandArgument='<%# Eval("trainingAId") %>' />
                    </div>
                </ItemTemplate>
            </asp:DataList>

    </p>
</asp:Content>
