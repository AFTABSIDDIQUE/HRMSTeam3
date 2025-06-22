using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMSTeam3.Admin
{
    public partial class EmpEarning_det : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();
            if (!IsPostBack)
            {
                BindEarningType();
                BindDepartment();
                


            }
        }
        public void BindEarningType()
        {
            string query = "SELECT EarningTypeID, EarningTypeName FROM EarningType";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader reader = cmd.ExecuteReader();
            DropDownList1.DataSource = reader;
            DropDownList1.DataTextField = "EarningTypeName";  
            DropDownList1.DataValueField = "EarningTypeID";
            DropDownList1.DataBind();
            reader.Close();
            DropDownList1.Items.Insert(0, new ListItem("-- Select Earning Type --", ""));
        }
        public void BindDepartment()
        {
            string query = "SELECT DeptID, DeptName FROM Department WHERE Status = 'Active'";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader reader = cmd.ExecuteReader();
            DropDownList2.DataSource = reader;
            DropDownList2.DataTextField = "DeptName"; 
            DropDownList2.DataValueField = "DeptID";
            DropDownList2.DataBind();
            reader.Close();

            DropDownList2.Items.Insert(0, new ListItem("-- Select Department --", ""));
        }
        public void BindDesignation(int deptId)
        {
            
            //int deptId = int.Parse(DropDownList2.SelectedValue); 

            string query = $"SELECT DesigID, DesigName FROM Designation WHERE DeptID = {deptId}";
            SqlCommand cmd = new SqlCommand(query, conn);

            SqlDataReader reader = cmd.ExecuteReader();
            DropDownList3.DataSource = reader;
            DropDownList3.DataTextField = "DesigName";
            DropDownList3.DataValueField = "DesigID";
            DropDownList3.DataBind();
            reader.Close();

            DropDownList3.Items.Insert(0, new ListItem("-- Select Designation --", ""));

            /*string query = "SELECT DesigID, DesigName FROM Designation WHERE DeptID = @DeptID";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@DeptID", deptId);

            SqlDataReader reader = cmd.ExecuteReader();
            DropDownList3.DataSource = reader;
            DropDownList3.DataTextField = "DesigName";
            DropDownList3.DataValueField = "DesigID";
            DropDownList3.DataBind();
            reader.Close();

            DropDownList3.Items.Insert(0, new ListItem("-- Select Designation --", ""));*/


        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int earningTypeId = int.Parse(DropDownList1.SelectedValue);
            int deptId = int.Parse(DropDownList2.SelectedValue);
            int desigId = int.Parse(DropDownList3.SelectedValue);
            decimal percentage = Convert.ToDecimal(TextBox1.Text);
            string checkQuery = $"Exec CheckEarningExists  @EarningTypeID = {earningTypeId}, @DeptID = {deptId}, @DesigID = {desigId}";
            SqlCommand checkCmd = new SqlCommand(checkQuery, conn);
            int count = (int)checkCmd.ExecuteScalar();

            if (count > 0)
            {
                Response.Write("<script>alert('This earning type already exists for the selected department and designation.');</script>");
                // Clear fields
                DropDownList1.SelectedIndex = 0; 
                DropDownList2.SelectedIndex = 0; 
                DropDownList3.Items.Clear();    
                DropDownList3.Items.Insert(0, new ListItem("-- Select Designation --", ""));
                TextBox1.Text = "";             

                
                return;
            }
            

            string query = "EXEC InsertEarnings " + earningTypeId + ", " + deptId + ", " + desigId + ", " + percentage;
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Employee Earning added')</script>");
            DropDownList1.SelectedIndex = 0;
            DropDownList2.SelectedIndex = 0;
            DropDownList3.Items.Clear();
            DropDownList3.Items.Insert(0, new ListItem("-- Select Designation --", ""));
            TextBox1.Text = "";
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList2.SelectedIndex > 0)
            {
                
                int deptId = int.Parse(DropDownList2.SelectedValue);
                BindDesignation(deptId);
                
            }
            else
            {
                DropDownList3.Items.Clear();
                DropDownList3.Items.Insert(0, new ListItem("-- Select Designation --", ""));
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string query = "EXEC GetEarnings";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader rd = cmd.ExecuteReader();

            DataTable dt = new DataTable();
            dt.Load(rd);

            GridView1.DataSource = dt;
            GridView1.DataBind();
            GridView1.Visible = true;

            rd.Close();
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridView1.Rows[index];

            string earningType = GridView1.DataKeys[index]["EarningType"].ToString();
            string department = GridView1.DataKeys[index]["Department"].ToString();
            string designation = GridView1.DataKeys[index]["Designation"].ToString();

            if (e.CommandName == "EditRow")
            {
                string percentage = row.Cells[3].Text;

                // Set modal fields
                ddlEditEarningType.SelectedValue = earningType;
                ddlEditDepartment.SelectedValue = department;
                ddlEditDesignation.SelectedValue = designation;
                txtEditPercentage.Text = percentage;

                
                ViewState["EditEarningType"] = earningType;
                ViewState["EditDepartment"] = department;
                ViewState["EditDesignation"] = designation;

                
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowEditModal", "$('#editModal').modal('show');", true);
            }
            else if (e.CommandName == "DeleteRow")
            {
                string deleteQuery = $"EXEC DeleteEarning @EarningType='{earningType}', @DeptName='{department}', @DesigName='{designation}'";
                SqlCommand cmd = new SqlCommand(deleteQuery, conn);
                cmd.ExecuteNonQuery();

                // Refresh the GridView
                Button3_Click(null, null);

                // show a toast
                ScriptManager.RegisterStartupScript(this, this.GetType(), "deleteSuccess", "showToast('Record deleted successfully.');", true);
            }
        }


        protected void btnUpdateEarning_Click(object sender, EventArgs e)
        {
            string earningType = ViewState["EditEarningType"].ToString();
            string department = ViewState["EditDepartment"].ToString();
            string designation = ViewState["EditDesignation"].ToString();
            string newPercentage = txtEditPercentage.Text;

            string query = $"EXEC UpdateEarning @EarningType='{earningType}', @DeptName='{department}', @DesigName='{designation}', @Percentage={newPercentage}";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.ExecuteNonQuery();

            // Reload Grid
            Button3_Click(null, null);

            // Show success toast
            ScriptManager.RegisterStartupScript(this, this.GetType(), "SuccessAlert", "alert('Earning updated successfully!');", true);
        }


    }
}