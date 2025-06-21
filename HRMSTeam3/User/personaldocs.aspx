<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="personaldocs.aspx.cs" Inherits="HRMSTeam3.User.personaldocs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <div class="card shadow-sm">
            <div class="card-header text-white" style="background-color: #311E10;">
                <h5 class="mb-0">Your Documents</h5>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                        CssClass="table table-bordered table-hover table-sm text-center"
                        GridLines="None"
                        Font-Names="Segoe UI" Font-Size="12px"
                        HeaderStyle-CssClass="table-dark">
                        
                        <Columns>
                            <asp:BoundField DataField="employee_id" HeaderText="ID">
                                <ItemStyle Width="50px" />
                            </asp:BoundField>

                            <asp:BoundField DataField="full_name" HeaderText="Name">
                                <ItemStyle Width="120px" />
                            </asp:BoundField>

                            <asp:BoundField DataField="doc_type" HeaderText="Type">
                                <ItemStyle Width="100px" />
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="Download">
                                <ItemStyle Width="100px" />
                                <ItemTemplate>
                                    <asp:HyperLink ID="lnkDownload" runat="server"
                                        Text="Download"
                                        NavigateUrl='<%# ResolveUrl("~/Admin/" + Eval("file_path").ToString().Replace(" ", "%20")) %>'
                                        Target="_blank"
                                        CssClass="btn btn-sm btn-custom">
                                    </asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="uploaded_on" HeaderText="Uploaded On">
                                <ItemStyle Width="120px" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
