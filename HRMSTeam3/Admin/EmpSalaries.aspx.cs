using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMSTeam3.Admin
{
    public partial class EmpSalaries : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();

            if (!IsPostBack)
            {
                BindDepartment();
            }
           
        }
        public void BindDesignation(int deptId)
        {

            //int deptId = int.Parse(DropDownList2.SelectedValue); 

            string query = $"SELECT DesigID, DesigName FROM Designation WHERE DeptID = {deptId}";
            SqlCommand cmd = new SqlCommand(query, conn);

            SqlDataReader reader = cmd.ExecuteReader();
            DropDownList2.DataSource = reader;
            DropDownList2.DataTextField = "DesigName";
            DropDownList2.DataValueField = "DesigID";
            DropDownList2.DataBind();
            reader.Close();

            DropDownList2.Items.Insert(0, new ListItem("-- Select Designation --", ""));

            /*string query = "SELECT DesigID, DesigName FROM Designation WHERE DeptID = @DeptID";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@DeptID", deptId);

            SqlDataReader reader = cmd.ExecuteReader();
            DropDownList2.DataSource = reader;
            DropDownList2.DataTextField = "DesigName";
            DropDownList2.DataValueField = "DesigID";
            DropDownList2.DataBind();
            reader.Close();

            DropDownList2.Items.Insert(0, new ListItem("-- Select Designation --", ""));*/


        }
        public void BindDepartment()
        {
            string query = "SELECT DeptID, DeptName FROM Department WHERE Status = 'Active'";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader reader = cmd.ExecuteReader();
            DropDownList1.DataSource = reader;
            DropDownList1.DataTextField = "DeptName";
            DropDownList1.DataValueField = "DeptID";
            DropDownList1.DataBind();
            reader.Close();

            DropDownList1.Items.Insert(0, new ListItem("-- Select Department --", ""));
        }
        public void BindEmployees(int desigId)
        {
            //int desigId = int.Parse(DropDownList3.SelectedValue);
            /*string query = @"SELECT e.employee_id, e.full_name 
                     FROM Employees e
                     WHERE e.DesigID = @DesigID AND e.status = 'Active'";

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@DesigID", desigId);

            SqlDataReader reader = cmd.ExecuteReader();
            DropDownList3.DataSource = reader;
            DropDownList3.DataTextField = "full_name";
            DropDownList3.DataValueField = "employee_id";
            DropDownList3.DataBind();
            reader.Close();

            DropDownList3.Items.Insert(0, new ListItem("-- Select Employee --", ""));*/

            string query = $"SELECT employee_id, full_name FROM Employees  WHERE DesigID = {desigId}";
            SqlCommand cmd = new SqlCommand(query, conn);

            SqlDataReader reader = cmd.ExecuteReader();
            DropDownList3.DataSource = reader;
            DropDownList3.DataTextField = "full_name";
            DropDownList3.DataValueField = "employee_id";
            DropDownList3.DataBind();
            reader.Close();

            DropDownList3.Items.Insert(0, new ListItem("-- Select Employee --", ""));
        }
        

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedIndex > 0)
            {

                int deptId = int.Parse(DropDownList1.SelectedValue);
                BindDesignation(deptId);

            }
            else
            {
                DropDownList2.Items.Clear();
                DropDownList2.Items.Insert(0, new ListItem("-- Select Designation --", ""));
            }
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList2.SelectedIndex > 0)
            {
                int desigId = int.Parse(DropDownList2.SelectedValue);
                BindEmployees(desigId);

                //LoadEarningsAndDeductions();
            }
            else
            {
                DropDownList3.Items.Clear();
                DropDownList3.Items.Insert(0, new ListItem("-- Select Employee --", ""));
            }
        }
        private void LoadEarningsAndDeductions()
        {
            //PlaceHolder1.Controls.Clear();
            //PlaceHolder3.Controls.Clear();

            int deptId, desigId;
            decimal totalSalary;

            try
            {
                deptId = int.Parse(DropDownList1.SelectedValue);
                desigId = int.Parse(DropDownList2.SelectedValue);
                totalSalary = decimal.Parse(TextBox1.Text.Trim());
            }
            catch
            {
                return;
            }

            decimal totalEarnings = 0;
            decimal totalDeductions = 0;

            try
            {
                string q = $"Exec GetSalary  @DeptID = {deptId},@DesigID ={desigId}, @TotalSalary={totalSalary}";
                SqlCommand cmd = new SqlCommand(q, conn);
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    string name = reader["Name"].ToString();
                    string type = reader["Type"].ToString();
                    decimal amount = Convert.ToDecimal(reader["Amount"]);
                    decimal percent = Convert.ToDecimal(reader["Percentage"]);

                    Label lbl = new Label
                    {
                        Text = $"{name} ({percent}%): ₹{amount:N2}<br/>"
                    };

                    if (type == "Earning")
                    {
                        totalEarnings += amount;
                        PlaceHolder1.Controls.Add(lbl);
                    }
                    else
                    {
                        totalDeductions += amount;
                        PlaceHolder3.Controls.Add(lbl);
                    }
                }
                reader.Close();

                decimal netSalary = totalSalary - totalDeductions;

                Label2.Text = $"Net Salary: ₹{netSalary:N2}";

                // Optionally store totals in hidden fields or ViewState if needed later
                ViewState["TotalEarnings"] = totalEarnings;
                ViewState["TotalDeductions"] = totalDeductions;
                ViewState["NetSalary"] = netSalary;
            }
            catch (Exception ex)
            {
                //Response.Write("<script>alert('Error: " + ex.Message + "')</script>");
                string errorMessage = HttpUtility.JavaScriptStringEncode(ex.Message);
                Response.Write($"<script>alert('{errorMessage}');</script>");


            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (DropDownList3.Items.Count == 0 || string.IsNullOrEmpty(DropDownList3.SelectedValue))
            {
                Response.Write("<script>alert('Please select an employee.')</script>");

                return;
            }

            int employeeId = int.Parse(DropDownList3.SelectedValue);
            int deptId = int.Parse(DropDownList1.SelectedValue);
            int desigId = int.Parse(DropDownList2.SelectedValue);
            decimal totalSalary;

            if (!decimal.TryParse(TextBox1.Text.Trim(), out totalSalary))
            {
                Response.Write("<script>alert('Enter a valid Total Salary.')</script>");
                return;
            }

            decimal totalDeductions = 0;

            try
            {
                string q = $"Exec GetSalary  @DeptID = {deptId},@DesigID ={desigId}, @TotalSalary={totalSalary}";
                SqlCommand cmd = new SqlCommand(q, conn);

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    if (reader["Type"].ToString() == "Deduction")
                    {
                        decimal amount = Convert.ToDecimal(reader["Amount"]);
                        totalDeductions = totalDeductions + amount;
                    }
                }
                reader.Close();
            }
            catch (Exception ex)
            {
                //Response.Write("<script>alert('Error calculating deductions: " + ex.Message + "')</script>");
                string errorMessage = HttpUtility.JavaScriptStringEncode("Error calculating deductions: " + ex.Message);
                Response.Write($"<script>alert('{errorMessage}');</script>");
                return;
            }

            decimal netSalary = totalSalary - totalDeductions;

            string insertQuery = $"Exec InsertEmpSalary   @EmployeeId = {employeeId}, @DeptID = {deptId},  @DesigID = {desigId}, @TotalSalary = {totalSalary},@NetSalary={netSalary}";
            SqlCommand insertCmd = new SqlCommand(insertQuery, conn);

            try
            {
                insertCmd.ExecuteNonQuery();
                Response.Write("<script>alert('Employee Salary saved successfully!')</script>");
                DropDownList1.ClearSelection();
                DropDownList1.Items[0].Selected = true;

                DropDownList2.Items.Clear();
                DropDownList2.Items.Insert(0, new ListItem("-- Select Designation --", ""));

                DropDownList3.Items.Clear();
                DropDownList3.Items.Insert(0, new ListItem("-- Select Employee --", ""));

                TextBox1.Text = "";

                PlaceHolder1.Controls.Clear();
                PlaceHolder3.Controls.Clear();

                Label2.Text = "";
            }
            catch (Exception ex)
            {
                //Response.Write("<script>alert('Error inserting record: " + ex.Message + "')</script>");
                string errorMessage = HttpUtility.JavaScriptStringEncode("Error inserting record: " + ex.Message);
                Response.Write($"<script>alert('{errorMessage}');</script>");
            }
        }


        protected void TextBox1_TextChanged(object sender, EventArgs e)
            {
                LoadEarningsAndDeductions();
            }

        
    }
}