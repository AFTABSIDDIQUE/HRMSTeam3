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
    public partial class Emp_deduction : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();
            if (!IsPostBack)
            {
                BindDeductionType();
                BindDepartment();

            }

        }
        public void BindDeductionType()
        {
            string query = "SELECT DeductionTypeID, DeductionTypeName FROM DeductionType";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader reader = cmd.ExecuteReader();
            DropDownList1.DataSource = reader;
            DropDownList1.DataTextField = "DeductionTypeName";
            DropDownList1.DataValueField = "DeductionTypeID";
            DropDownList1.DataBind();
            reader.Close();
            DropDownList1.Items.Insert(0, new ListItem("-- Select Deduction Type --", ""));
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

            /*int deptId = int.Parse(DropDownList2.SelectedValue); 

            string query = $"SELECT DesigID, DesigName FROM Designation WHERE DeptID = {deptId}";
            SqlCommand cmd = new SqlCommand(query, conn);

            SqlDataReader reader = cmd.ExecuteReader();
            DropDownList3.DataSource = reader;
            DropDownList3.DataTextField = "DesigName";
            DropDownList3.DataValueField = "DesigID";
            DropDownList3.DataBind();
            reader.Close();

            DropDownList3.Items.Insert(0, new ListItem("-- Select Designation --", ""));*/

            string query = "SELECT DesigID, DesigName FROM Designation WHERE DeptID = @DeptID";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@DeptID", deptId);

            SqlDataReader reader = cmd.ExecuteReader();
            DropDownList3.DataSource = reader;
            DropDownList3.DataTextField = "DesigName";
            DropDownList3.DataValueField = "DesigID";
            DropDownList3.DataBind();
            reader.Close();

            DropDownList3.Items.Insert(0, new ListItem("-- Select Designation --", ""));


        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int deductionTypeId = int.Parse(DropDownList1.SelectedValue);
            int deptId = int.Parse(DropDownList2.SelectedValue);
            int desigId = int.Parse(DropDownList3.SelectedValue);
            decimal percentage = Convert.ToDecimal(TextBox1.Text);
            string checkQuery = $"Exec CheckDeductionExists  @DeductionTypeID = {deductionTypeId}, @DeptID = {deptId}, @DesigID = {desigId}";
            SqlCommand checkCmd = new SqlCommand(checkQuery, conn);
            int count = (int)checkCmd.ExecuteScalar();

            if (count > 0)
            {
                Response.Write("<script>alert('This deduction type already exists for the selected department and designation.');</script>");
                // Clear fields
                DropDownList1.SelectedIndex = 0;
                DropDownList2.SelectedIndex = 0;
                DropDownList3.Items.Clear();
                DropDownList3.Items.Insert(0, new ListItem("-- Select Designation --", ""));
                TextBox1.Text = "";


                return;
            }

            string query = "EXEC InsertDeduction " + deductionTypeId + ", " + deptId + ", " + desigId + ", " + percentage;
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Employee deduction added')</script>");
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
            string query = "EXEC GetDeduction";
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
            /*int index = Convert.ToInt32(e.CommandArgument);

            GridViewRow row = GridView1.Rows[index];
            string deductionType = GridView1.DataKeys[index].Values["DeductionType"].ToString();
            string department = GridView1.DataKeys[index].Values["Department"].ToString();
            string designation = GridView1.DataKeys[index].Values["Designation"].ToString();

            if (e.CommandName == "EditRow")
            {
                // Load data into fields for editing
                // Store identifiers in ViewState if needed
            }
            else if (e.CommandName == "DeleteRow")
            {
                // Call delete logic using keys
                DeleteDeduction(deductionType, department, designation);
                Button3_Click(null, null); // Refresh GridView
            }*/
        }

        private void DeleteDeduction(string deductionType, string department, string designation)
        {
            /*string query = @"DELETE FROM EmployeeDeductions 
                     WHERE DeductionType = @type AND Department = @dept AND Designation = @desig";

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@type", deductionType);
                cmd.Parameters.AddWithValue("@dept", department);
                cmd.Parameters.AddWithValue("@desig", designation);
                con.Open();
                cmd.ExecuteNonQuery();
            }*/
        }

    }
}