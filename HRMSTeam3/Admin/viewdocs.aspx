<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="viewdocs.aspx.cs" Inherits="HRMSTeam3.Admin.viewdocs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <div class="form-section">
            <h4 class="mb-4">View Uploaded Documents</h4>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="TextBox1" class="form-label">Enter Employee ID</label>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-6 d-flex align-items-end">
                    <asp:Button ID="Button2" runat="server" Text="View" CssClass="btn btn-custom" OnClick="Button2_Click" />
                </div>
            </div>

            <div class="table-responsive">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered"
                    GridLines="None" Font-Size="14px" ShowHeaderWhenEmpty="True">
                    <Columns>
                        <asp:BoundField DataField="doc_type" HeaderText="Document Type" />
                        <asp:BoundField DataField="uploaded_on" HeaderText="Uploaded Date" />
                        <asp:TemplateField HeaderText="Download">
                            <ItemTemplate>
                                <asp:HyperLink ID="lnkDownload" runat="server"
                                    Text="Download"
                                    NavigateUrl='<%# ResolveUrl("~/Admin/" + Eval("file_path").ToString().Replace(" ", "%20")) %>'
                                    Target="_blank"
                                    CssClass="btn btn-sm btn-outline-primary" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="table-dark" />
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
