<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="personaldocs.aspx.cs" Inherits="HRMSTeam3.User.personaldocs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <p>
    Your Documents</p>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-sm"
    GridLines="None" BorderStyle="Solid" BorderWidth="1px" BorderColor="#CCCCCC"
    CellPadding="4" CellSpacing="0" Width="100%"
    Font-Names="Segoe UI" Font-Size="11px"
    HeaderStyle-BackColor="#4CAF50" HeaderStyle-ForeColor="White" HeaderStyle-Font-Bold="True"
    RowStyle-BackColor="#FFFFFF" AlternatingRowStyle-BackColor="#F5F5F5">

    <Columns>
        <asp:BoundField DataField="employee_id" HeaderText="ID" ItemStyle-Width="50px" />
        <asp:BoundField DataField="full_name" HeaderText="Name" ItemStyle-Width="120px" />
        <asp:BoundField DataField="doc_type" HeaderText="Type" ItemStyle-Width="100px" />

        <asp:TemplateField HeaderText="Download" ItemStyle-Width="90px">
            <ItemTemplate>
                <asp:HyperLink ID="lnkDownload" runat="server"
                    Text="Download"
                    NavigateUrl='<%# ResolveUrl("~/Admin/" + Eval("file_path").ToString().Replace(" ", "%20")) %>'
                    Target="_blank"
                    Style="font-size:11px; padding:2px 6px; background-color:#007BFF; color:white; text-decoration:none; border-radius:3px;">
                </asp:HyperLink>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:BoundField DataField="uploaded_on" HeaderText="Date" ItemStyle-Width="110px" />
    </Columns>
</asp:GridView>


</asp:Content>
