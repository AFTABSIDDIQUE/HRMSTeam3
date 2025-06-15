<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="viewdocs.aspx.cs" Inherits="HRMSTeam3.Admin.viewdocs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        Enter Employee Id:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="Button2" runat="server" Text="View" OnClick="Button2_Click" />
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Height="72px" Width="691px">
            <AlternatingRowStyle BackColor="White" />
        <Columns>
        <asp:BoundField DataField="doc_type" HeaderText="Document Type" />
        <asp:BoundField DataField="uploaded_on" HeaderText="Uploaded Date" />
        <asp:HyperLinkField 
            DataNavigateUrlFields="file_path"
            DataTextField="file_path"
            HeaderText="Download Link"
            Target="_blank"
            Text="Download" />
    </Columns>

            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />

        </asp:GridView>
    </p>
</asp:Content>


