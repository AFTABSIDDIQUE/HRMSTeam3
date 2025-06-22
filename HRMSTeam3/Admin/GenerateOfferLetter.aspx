<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="GenerateOfferLetter.aspx.cs" Inherits="HRMSTeam3.Admin.GenerateOfferLetter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-1">
        <div class="form-section">
            <div class="card-header-custom mb-4">
                <h5 class="mb-0">Generate Offer Letter</h5>
            </div>

            <div class="row">
                <!-- Left Column -->
                <div class="col-md-6">
                    <div class="mb-3">
                        <label for="name" class="form-label">Employee Name</label>
                        <asp:TextBox ID="name" runat="server" CssClass="form-control" />
                    </div>

                    <div class="mb-3">
                        <label for="add" class="form-label">Address</label>
                        <asp:TextBox ID="add" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" />
                    </div>

                    <div class="mb-3">
                        <label for="sal" class="form-label">Salary</label>
                        <asp:TextBox ID="sal" runat="server" CssClass="form-control" />
                    </div>
                </div>

                <!-- Right Column -->
                <div class="col-md-6">
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <asp:TextBox ID="email" runat="server" TextMode="Email" CssClass="form-control" />
                    </div>

                    <div class="mb-3">
                        <label for="post" class="form-label">Position</label>
                        <asp:TextBox ID="post" runat="server" CssClass="form-control" />
                    </div>

                    <div class="mb-3">
                        <label for="date" class="form-label">Joining Date</label>
                        <asp:TextBox ID="date" runat="server" TextMode="Date" CssClass="form-control" />
                    </div>

                    <div class="mb-3">
                        <label for="loc" class="form-label">Location</label>
                        <asp:TextBox ID="loc" runat="server" CssClass="form-control" />
                    </div>
                </div>
            </div>

            <div class="text-end mt-3">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-custom" OnClick="Button2_Click" />
            </div>
        </div>
    </div>
</asp:Content>
