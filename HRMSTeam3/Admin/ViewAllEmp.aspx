<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ViewAllEmp.aspx.cs" Inherits="HRMSTeam3.Admin.ViewAllEmp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    &nbsp;

    <div class="d-flex gap-2 mb-3">
    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-select" Width="120px" Height="40px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" />
    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-select" Width="120px" Height="40px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" />
    <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-select" Width="120px" Height="40px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" >
        <asp:ListItem>Sort By</asp:ListItem>
        <asp:ListItem>Asc Sort</asp:ListItem>
        <asp:ListItem>Desc Sort</asp:ListItem>
        <asp:ListItem>Recent</asp:ListItem>
        </asp:DropDownList>

        <asp:TextBox ID="TextBox1" runat="server"  AutoPostBack="True"
            input class="form-control mr-sm-2" type="search" placeholder="Search" Width="200px" aria-label="Search" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
        <asp:TextBox ID="TextBox2" runat="server" class="form-control mr-sm-2" Width="150px" TextMode="Date"></asp:TextBox>
        <asp:TextBox ID="TextBox3" runat="server" class="form-control mr-sm-2" Width="150px" AutoPostBack="True" OnTextChanged="TextBox3_TextChanged" TextMode="Date"></asp:TextBox>
</div>


    <br />
           
      <asp:GridView ID="GridView1" runat="server"
            AutoGenerateColumns="False"
            CssClass="table table-sm table-striped table-bordered text-nowrap"
            OnRowDataBound="GridView1_RowDataBound"
            Font-Names="Segoe UI" Font-Size="11px"
            GridLines="None"
            CellPadding="3"
            HorizontalAlign="Center"
            Width="100%">

    <Columns>
        <asp:BoundField DataField="employee_id" HeaderText="ID">
            <ItemStyle Width="50px" />
        </asp:BoundField>

        <asp:BoundField DataField="full_name" HeaderText="Name">
            <ItemStyle Width="120px" />
        </asp:BoundField>

        <asp:BoundField DataField="email" HeaderText="Email">
            <ItemStyle Width="150px" />
        </asp:BoundField>

        <asp:BoundField DataField="mobile_num" HeaderText="Mobile">
            <ItemStyle Width="100px" />
        </asp:BoundField>

        <asp:BoundField DataField="dob" HeaderText="DOB">
            <ItemStyle Width="80px" />
        </asp:BoundField>

        <asp:BoundField DataField="doj" HeaderText="DOJ">
            <ItemStyle Width="80px" />
        </asp:BoundField>

        <asp:BoundField DataField="department" HeaderText="Dept">
            <ItemStyle Width="100px" />
        </asp:BoundField>

        <asp:BoundField DataField="designation" HeaderText="Designation">
            <ItemStyle Width="120px" />
        </asp:BoundField>
        <asp:BoundField DataField="manager" HeaderText="manager">
    <ItemStyle Width="120px" />
</asp:BoundField>
        <asp:TemplateField HeaderText="Status">
            <ItemStyle Width="80px" />
            <ItemTemplate>
                <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("status") %>' CssClass="badge" />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:BoundField DataField="created_at" HeaderText="Created">
            <ItemStyle Width="100px" />
        </asp:BoundField>

        <asp:BoundField DataField="emergency_contact" HeaderText="Emergency">
            <ItemStyle Width="120px" />
        </asp:BoundField>

        <asp:TemplateField HeaderText="Profile Pic">
            <ItemStyle Width="90px" HorizontalAlign="Center" />
            <ItemTemplate>
                <asp:Image ID="imgProfile" runat="server"
                           ImageUrl='<%# ResolveUrl(Eval("profile_pic").ToString()) %>'
                           Width="60px" Height="60px"
                           Style="object-fit: cover; border-radius: 4px;" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>


    <br />
      </asp:Content>
