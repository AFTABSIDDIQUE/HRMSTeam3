<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="GenerateRelievingLetter.aspx.cs" Inherits="HRMSTeam3.Admin.GenerateRelievingLetter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-1">
        <div class="form-section">
            <div class="card-header-custom mb-4">
                <h5 class="mb-0">Generate Relieving Letter</h5>
            </div>

            <div class="row">
                <!-- Left Column -->
                <div class="col-md-6">
                    <div class="mb-3">
                        <label for="cname" class="form-label">Employee Name</label>
                        <asp:TextBox ID="cname" runat="server" CssClass="form-control" />
                    </div>

                    <div class="mb-3">
                        <label for="post" class="form-label">Position</label>
                        <asp:DropDownList ID="post" runat="server" CssClass="form-select">
                        </asp:DropDownList>
                    </div>

                    <div class="mb-3">
                        <label for="Relieving" class="form-label">Relieving Date</label>
                        <asp:TextBox ID="Relieving" runat="server" TextMode="Date" CssClass="form-control" />
                    </div>
                </div>

                <!-- Right Column -->
                <div class="col-md-6">
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <asp:TextBox ID="email" runat="server" TextMode="Email" CssClass="form-control" />
                    </div>

                    <div class="mb-3">
                        <label for="date" class="form-label">Joining Date</label>
                        <asp:TextBox ID="date" runat="server" TextMode="Date" CssClass="form-control" />
                    </div>
                </div>
            </div>

            <div class="text-end mt-3">
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Submit" CssClass="btn btn-custom" />
            </div>
        </div>
    </div>
</asp:Content>
