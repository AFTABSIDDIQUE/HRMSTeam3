<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="PerfoemanceReview.aspx.cs" Inherits="HRMSTeam3.Performance.PerfoemanceReview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="form-section">
            <h3 class="mb-4">Performance Review</h3>

            <h5 class="mb-3">Employee Basic Information</h5>
            <div class="row mb-3">
                <div class="col-md-4">
                    <label class="form-label">Name</label>
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-select" />
                </div>
                <div class="col-md-4">
                    <label class="form-label">Emp ID</label>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged" />
                </div>
                <div class="col-md-4">
                    <label class="form-label">Department</label>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" />
                </div>
            </div>

            <div class="row mb-4">
                <div class="col-md-4">
                    <label class="form-label">Designation</label>
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-4">
                    <label class="form-label">Date of Join</label>
                    <asp:TextBox ID="TextBox4" runat="server" TextMode="Date" CssClass="form-control" />
                </div>
                <div class="col-md-4">
                    <label class="form-label">Previous Year of Experience</label>
                    <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" />
                </div>
            </div>

            <hr />

            <!-- Personal Excellence Section -->
            <p>
                <a class="btn btn-outline-dark mb-2" data-bs-toggle="collapse" href="#personalExcellence" role="button" aria-expanded="false" aria-controls="personalExcellence">
                    Personal Excellence
                </a>
            </p>
            <div class="collapse" id="personalExcellence">
                <table class="table table-bordered">
                    <thead class="table-light">
                        <tr>
                            <th>Key Result</th>
                            <th>Pints Scored</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Attendance</td>
                            <td><asp:TextBox ID="TextBox6" Placeholder="%" runat="server" CssClass="form-control" /></td>
                        </tr>
                        <tr>
                            <td>Attitude & Behaviour</td>
                            <td><asp:TextBox ID="TextBox7" Placeholder="%" runat="server" CssClass="form-control" /></td>
                        </tr>
                        <tr>
                            <td>Policy & Procedures</td>
                            <td><asp:TextBox ID="TextBox8" Placeholder="%" runat="server" CssClass="form-control" /></td>
                        </tr>
                        <tr>
                            <td>Initiatives</td>
                            <td><asp:TextBox ID="TextBox9" Placeholder="%" runat="server" CssClass="form-control" /></td>
                        </tr>
                        <tr>
                            <td>Continuous Skill Improvement</td>
                            <td><asp:TextBox ID="TextBox10" Placeholder="%" runat="server" CssClass="form-control" /></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Professional Excellence Section -->
            <p>
                <a class="btn btn-outline-dark mb-2" data-bs-toggle="collapse" href="#professionalExcellence" role="button" aria-expanded="false" aria-controls="professionalExcellence">
                    Professional Excellence
                </a>
            </p>
            <div class="collapse" id="professionalExcellence">
                <table class="table table-bordered">
                    <thead class="table-light">
                        <tr>
                            <th>Indicator</th>
                            <th>Rating</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Production</td>
                            <td><asp:TextBox ID="TextBox11" Placeholder="%" runat="server" CssClass="form-control" /></td>
                        </tr>
                        <tr>
                            <td>Process Improvement</td>
                            <td><asp:TextBox ID="TextBox12" Placeholder="%" runat="server" CssClass="form-control" /></td>
                        </tr>
                        <tr>
                            <td>Team Management</td>
                            <td><asp:TextBox ID="TextBox13" Placeholder="%" runat="server" CssClass="form-control" /></td>
                        </tr>
                        <tr>
                            <td>Knowledge Sharing</td>
                            <td><asp:TextBox ID="TextBox14" Placeholder="%" runat="server" CssClass="form-control" /></td>
                        </tr>
                        <tr>
                            <td>Reporting And Communication</td>
                            <td><asp:TextBox ID="TextBox15" Placeholder="%" runat="server" CssClass="form-control" /></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="text-end mt-4">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit Review" CssClass="btn btn-custom" />
            </div>
        </div>
    </div>
</asp:Content>
