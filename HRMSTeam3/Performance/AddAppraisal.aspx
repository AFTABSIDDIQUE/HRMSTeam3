<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddAppraisal.aspx.cs" Inherits="HRMSTeam3.Admin.AddAppraisal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="form-section">
            <h3 class="mb-4">Add Appraisal</h3>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Employee</label>
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-select" />
                </div>
                <div class="col-md-6">
                    <label class="form-label">Appraisal Date</label>
                    <asp:TextBox ID="TextBox1" runat="server" TextMode="Date" CssClass="form-control" />
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Designation</label>
                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-select" />
                </div>
                <div class="col-md-6">
                    <label class="form-label">Department</label>
                    <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-select" />
                </div>
            </div>

            <div class="mb-4">
                <label class="form-label">Technical </label>
                <asp:Table ID="Table1" runat="server" CssClass="table table-bordered mt-3">
                    <asp:TableHeaderRow TableSection="TableHeader">
                        <asp:TableHeaderCell>Indicator</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Rating</asp:TableHeaderCell>
                    </asp:TableHeaderRow>

                    <asp:TableRow>
                        <asp:TableCell>Customer Experience</asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlCustomerExperience" runat="server" CssClass="form-select">
                                <asp:ListItem Text="1 - Poor" Value="1" />
                                <asp:ListItem Text="2 - Fair" Value="2" />
                                <asp:ListItem Text="3 - Good" Value="3" />
                                <asp:ListItem Text="4 - Very Good" Value="4" />
                                <asp:ListItem Text="5 - Excellent" Value="5" />
                            </asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow>
                        <asp:TableCell>Marketing</asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlTechnicalKnowledge" runat="server" CssClass="form-select">
                                <asp:ListItem Text="1 - Poor" Value="1" />
                                <asp:ListItem Text="2 - Fair" Value="2" />
                                <asp:ListItem Text="3 - Good" Value="3" />
                                <asp:ListItem Text="4 - Very Good" Value="4" />
                                <asp:ListItem Text="5 - Excellent" Value="5" />
                            </asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow>
                        <asp:TableCell>Management</asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlCommunication" runat="server" CssClass="form-select">
                                <asp:ListItem Text="1 - Poor" Value="1" />
                                <asp:ListItem Text="2 - Fair" Value="2" />
                                <asp:ListItem Text="3 - Good" Value="3" />
                                <asp:ListItem Text="4 - Very Good" Value="4" />
                                <asp:ListItem Text="5 - Excellent" Value="5" />
                            </asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow>
                        <asp:TableCell>Administration</asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlTeamwork" runat="server" CssClass="form-select">
                                <asp:ListItem Text="1 - Poor" Value="1" />
                                <asp:ListItem Text="2 - Fair" Value="2" />
                                <asp:ListItem Text="3 - Good" Value="3" />
                                <asp:ListItem Text="4 - Very Good" Value="4" />
                                <asp:ListItem Text="5 - Excellent" Value="5" />
                            </asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow>
                        <asp:TableCell>Presentation Skills</asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlProblemSolving" runat="server" CssClass="form-select">
                                <asp:ListItem Text="1 - Poor" Value="1" />
                                <asp:ListItem Text="2 - Fair" Value="2" />
                                <asp:ListItem Text="3 - Good" Value="3" />
                                <asp:ListItem Text="4 - Very Good" Value="4" />
                                <asp:ListItem Text="5 - Excellent" Value="5" />
                            </asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow>
                        <asp:TableCell>Quality of Work</asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="DropDownList4" runat="server" CssClass="form-select">
                                <asp:ListItem Text="1 - Poor" Value="1" />
                                <asp:ListItem Text="2 - Fair" Value="2" />
                                <asp:ListItem Text="3 - Good" Value="3" />
                                <asp:ListItem Text="4 - Very Good" Value="4" />
                                <asp:ListItem Text="5 - Excellent" Value="5" />
                            </asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow>
                        <asp:TableCell>Efficiency</asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="DropDownList5" runat="server" CssClass="form-select">
                                <asp:ListItem Text="1 - Poor" Value="1" />
                                <asp:ListItem Text="2 - Fair" Value="2" />
                                <asp:ListItem Text="3 - Good" Value="3" />
                                <asp:ListItem Text="4 - Very Good" Value="4" />
                                <asp:ListItem Text="5 - Excellent" Value="5" />
                            </asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
            <div class="mb-4">
                     <label class="form-label">Organization </label>
                    <asp:Table ID="Table2" runat="server" CssClass="table table-bordered mt-3">
                        <asp:TableHeaderRow TableSection="TableHeader">
                            <asp:TableHeaderCell>Indicator</asp:TableHeaderCell>
                            <asp:TableHeaderCell>Rating</asp:TableHeaderCell>
                        </asp:TableHeaderRow>

                        <asp:TableRow>
                            <asp:TableCell>Integrity</asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList ID="DropDownList7" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="1 - Poor" Value="1" />
                                    <asp:ListItem Text="2 - Fair" Value="2" />
                                    <asp:ListItem Text="3 - Good" Value="3" />
                                    <asp:ListItem Text="4 - Very Good" Value="4" />
                                    <asp:ListItem Text="5 - Excellent" Value="5" />
                                </asp:DropDownList>
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableCell>Professionalism</asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList ID="DropDownList8" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="1 - Poor" Value="1" />
                                    <asp:ListItem Text="2 - Fair" Value="2" />
                                    <asp:ListItem Text="3 - Good" Value="3" />
                                    <asp:ListItem Text="4 - Very Good" Value="4" />
                                    <asp:ListItem Text="5 - Excellent" Value="5" />
                                </asp:DropDownList>
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableCell>TeamWork</asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList ID="DropDownList9" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="1 - Poor" Value="1" />
                                    <asp:ListItem Text="2 - Fair" Value="2" />
                                    <asp:ListItem Text="3 - Good" Value="3" />
                                    <asp:ListItem Text="4 - Very Good" Value="4" />
                                    <asp:ListItem Text="5 - Excellent" Value="5" />
                                </asp:DropDownList>
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableCell>Critical Thinking</asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList ID="DropDownList10" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="1 - Poor" Value="1" />
                                    <asp:ListItem Text="2 - Fair" Value="2" />
                                    <asp:ListItem Text="3 - Good" Value="3" />
                                    <asp:ListItem Text="4 - Very Good" Value="4" />
                                    <asp:ListItem Text="5 - Excellent" Value="5" />
                                </asp:DropDownList>
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableCell>Conflict Management</asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList ID="DropDownList11" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="1 - Poor" Value="1" />
                                    <asp:ListItem Text="2 - Fair" Value="2" />
                                    <asp:ListItem Text="3 - Good" Value="3" />
                                    <asp:ListItem Text="4 - Very Good" Value="4" />
                                    <asp:ListItem Text="5 - Excellent" Value="5" />
                                </asp:DropDownList>
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableCell>Attendance</asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList ID="DropDownList12" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="1 - Poor" Value="1" />
                                    <asp:ListItem Text="2 - Fair" Value="2" />
                                    <asp:ListItem Text="3 - Good" Value="3" />
                                    <asp:ListItem Text="4 - Very Good" Value="4" />
                                    <asp:ListItem Text="5 - Excellent" Value="5" />
                                </asp:DropDownList>
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableCell>AbilityToMeetDeadline</asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList ID="DropDownList13" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="1 - Poor" Value="1" />
                                    <asp:ListItem Text="2 - Fair" Value="2" />
                                    <asp:ListItem Text="3 - Good" Value="3" />
                                    <asp:ListItem Text="4 - Very Good" Value="4" />
                                    <asp:ListItem Text="5 - Excellent" Value="5" />
                                </asp:DropDownList>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </div>

            <div class="mb-3">
                <label class="form-label">Status</label>
                <asp:DropDownList ID="DropDownList6" runat="server" CssClass="form-select">
                    <asp:ListItem>Active</asp:ListItem>
                    <asp:ListItem>InActive</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="text-end">
                <asp:Button ID="Button2" runat="server" Text="Add Appraisal" CssClass="btn btn-custom" OnClick="Button2_Click" />
            </div>
        </div>
    </div>
</asp:Content>
