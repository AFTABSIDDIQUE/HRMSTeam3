<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateTrainingList.aspx.cs" Inherits="HRMSTeam3.Training.UpdateTrainingList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
     <div class="form-section">
         <h3 class="mb-4">Update Training List</h3>

         <div class="mb-3">
             <label>Training ID</label>
             <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" />
         </div>
         <div class="mb-3">
             <label>Trainer</label>
             <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-select" />
         </div>

         <div class="mb-3">
             <label>Training Type</label>
             <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-select" />
         </div>

         <div class="mb-3">
             <label>Employee</label>
             <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-select" />
         </div>

         <div class="mb-3">
             <label>Training Cost</label>
             <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" />
         </div>

         <div class="mb-3">
             <label>Description</label>
             <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control" />
         </div>

         <div class="mb-3">
             <label>Status</label>
             <asp:DropDownList ID="DropDownList4" runat="server" CssClass="form-select">
                 <asp:ListItem>Active</asp:ListItem>
                 <asp:ListItem>InActive</asp:ListItem>
             </asp:DropDownList>
         </div>

         <div class="row mb-3">
             <div class="col-md-6">
                 <label>Start Date</label>
                 <asp:TextBox ID="TextBox2" runat="server" TextMode="Date" CssClass="form-control" />
             </div>
             <div class="col-md-6">
                 <label>End Date</label>
                 <asp:TextBox ID="TextBox3" runat="server" TextMode="Date" CssClass="form-control" />
             </div>
         </div>

         <div class="text-end">
             <asp:Button ID="Button2" runat="server" Text="Update" OnClick="Button2_Click" CssClass="btn btn-custom" />
         </div>
     </div>
 </div>
</asp:Content>
