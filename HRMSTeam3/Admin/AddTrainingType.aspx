<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddTrainingType.aspx.cs" Inherits="HRMSTeam3.Admin.AddTrainingType" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <p>
        &nbsp;&nbsp;&nbsp;&nbsp; Add Training Type</p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp; Training Type&nbsp;</p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp; Description&nbsp;</p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    </p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp; Status</p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>Active</asp:ListItem>
            <asp:ListItem>InActive</asp:ListItem>
        </asp:DropDownList>
    </p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Add" />
    </p>
    <p>
        &nbsp;</p>


</asp:Content>
