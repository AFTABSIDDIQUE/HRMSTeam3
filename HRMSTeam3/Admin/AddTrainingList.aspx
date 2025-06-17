<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddTrainingList.aspx.cs" Inherits="HRMSTeam3.Admin.AddTrainingList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        &nbsp;Add Training List</p>
    <p>
        &nbsp;</p>
    <p>
&nbsp; Trainer</p>
    <p>
        &nbsp;&nbsp;<asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
    </p>
    <p>
&nbsp; Training Type</p>
    <p>
&nbsp;
        <asp:DropDownList ID="DropDownList2" runat="server">
        </asp:DropDownList>
    </p>
    <p>
        &nbsp;Employee</p>
    <p>
&nbsp;
        <asp:DropDownList ID="DropDownList3" runat="server">
        </asp:DropDownList>
    </p>
    <p>
        &nbsp;Training Cost</p>
&nbsp;
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <p>
        &nbsp;Description</p>
    <p>
        &nbsp;&nbsp;<textarea id="TextArea1" cols="20" name="S1" rows="2"></textarea></p>
    <p>
        &nbsp;Status</p>
    <p>
        &nbsp;&nbsp;<asp:DropDownList ID="DropDownList4" runat="server">
        </asp:DropDownList>
    </p>
    <p>
        &nbsp;Start Date</p>
&nbsp;
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <br />
    <p>
        &nbsp;End Date</p>
&nbsp;
    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
    <br />
    <br />
    <p>
&nbsp; &nbsp;&nbsp;<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Add" />
    </p>
</asp:Content>
