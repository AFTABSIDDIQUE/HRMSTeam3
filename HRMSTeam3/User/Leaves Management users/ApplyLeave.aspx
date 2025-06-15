<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="ApplyLeave.aspx.cs" Inherits="HRMSTeam3.User.Leaves_Management_users.ApplyLeave" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <p>
    Employee Full Name&nbsp;
    <asp:TextBox ID="EmpName" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="EmpName" ErrorMessage="*Enter Name" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</p>
<p>
    &nbsp;</p>
<p>
    Leave Type&nbsp;&nbsp;
    <asp:DropDownList ID="LeaveList" runat="server">
    </asp:DropDownList>
</p>
<p>
    &nbsp;</p>
<p>
    Start Date&nbsp;&nbsp;
    <asp:TextBox ID="StartDate" runat="server"></asp:TextBox>
</p>
<p>
    &nbsp;</p>
<p>
    End Date&nbsp;&nbsp;
    <asp:TextBox ID="EndDate" runat="server"></asp:TextBox>
</p>
<p>
    &nbsp;</p>
<p>
    Duration&nbsp;&nbsp;
    <asp:TextBox ID="Duration" runat="server"></asp:TextBox>
</p>
<p>
    &nbsp;</p>
<p>
    Reason&nbsp;&nbsp;
    <asp:TextBox ID="Reason" runat="server"></asp:TextBox>
</p>
<p>
    &nbsp;</p>
<p>
    <asp:Button ID="LeaveRequestBtn" runat="server" OnClick="LeaveRequestBtn_Click" Text="Submit" />
</p>
<p>
    &nbsp;</p>
<p>
    <asp:Button ID="TrackId" runat="server" OnClick="TrackId_Click" Text=" Track Status" />
</p>
<asp:GridView ID="TrackView" runat="server" Width="424px">
</asp:GridView>
<p>
    &nbsp;</p>
<p>
    &nbsp;</p>


</asp:Content>
