using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;

namespace HRMSTeam3.Admin.Reports
{
    
    public partial class ReportsForEmployee : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();
            if (!IsPostBack)
            {
                BindDeptDropdown();
                UpdateTotalLabel();
                BindFilteredChart();
                BindStatusChart();
            }
        }

        private void BindDeptDropdown()
        {
           
                SqlCommand cmd = new SqlCommand("SELECT DISTINCT department FROM Employees", conn);
               
                ddlDept.DataSource = cmd.ExecuteReader();
                ddlDept.DataTextField = "department";
                ddlDept.DataValueField = "department";
                ddlDept.DataBind();
                ddlDept.Items.Insert(0, new System.Web.UI.WebControls.ListItem("All", ""));
            
        }

       


        private void UpdateTotalLabel()
        {
            
                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Employees", conn);
                
                int total = (int)cmd.ExecuteScalar();
                lblTotal.Text = $"Total Employees: {total}";
            
        }

        private void BindFilteredChart()
        {
            string dept = ddlDept.SelectedValue;
            string status = ddlStatus.SelectedValue;

            
                string query = @"SELECT department, COUNT(*) AS EmpCount 
                                 FROM Employees 
                                 WHERE (@dept = '' OR department = @dept) AND 
                                       (@status = '' OR status = @status) 
                                 GROUP BY department";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@dept", dept);
                cmd.Parameters.AddWithValue("@status", status);


            SqlDataReader dr = cmd.ExecuteReader();
            
                    ChartFiltered.Series["FilteredSeries"].Points.Clear();

            while (dr.Read())
            {
                int pointIndex = ChartFiltered.Series["FilteredSeries"].Points.AddXY(
                    dr["department"].ToString(), Convert.ToInt32(dr["EmpCount"])
                );

                ChartFiltered.Series["FilteredSeries"].Points[pointIndex].ToolTip =
                    $"{dr["department"]}: {dr["EmpCount"]} employees";
            }
    
        }

        public void BindStatusChart()
        {
            string dept = ddlDept.SelectedValue;
            string status = ddlStatus.SelectedValue;
            string query = @"
            SELECT status, COUNT(*) AS EmpCount
            FROM Employees where (@dept = '' OR department = @dept) AND 
                                           (@status = '' OR status = @status)
            GROUP BY status";

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@dept", dept);
            cmd.Parameters.AddWithValue("@status", status);
            SqlDataReader dr = cmd.ExecuteReader();

            Chart1.Series["Series1"].Points.Clear();

            while (dr.Read())
            {
                string stat = dr["status"].ToString();
                int count = Convert.ToInt32(dr["EmpCount"]);

                int pointIndex = Chart1.Series["Series1"].Points.AddXY(stat, count);
                Chart1.Series["Series1"].Points[pointIndex].ToolTip = $"{stat}: {count} employees";

                if (stat == "Active")
                    Chart1.Series["Series1"].Points[pointIndex].Color = System.Drawing.Color.Green;
                else if (stat == "Inactive")
                    Chart1.Series["Series1"].Points[pointIndex].Color = System.Drawing.Color.Red;
            }

            dr.Close();
        }



        protected void FilterChanged(object sender, EventArgs e)
        {
            BindFilteredChart();
            BindStatusChart();
        }

    }
}
