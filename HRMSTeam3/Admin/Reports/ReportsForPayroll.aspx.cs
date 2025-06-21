using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace HRMSTeam3.Admin.Reports
{
    public partial class ReportsForPayroll : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();
            if (!IsPostBack)
            {
                BindDepartments();
            }
        }

        private void BindDepartments()
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            SqlConnection conn = new SqlConnection(cnf);
        
                SqlCommand cmd = new SqlCommand("SELECT DeptID, DeptName FROM Department", conn);
                conn.Open();
                ddlDepartment.DataSource = cmd.ExecuteReader();
                ddlDepartment.DataTextField = "DeptName";
                ddlDepartment.DataValueField = "DeptID";
                ddlDepartment.DataBind();
                ddlDepartment.Items.Insert(0, new ListItem("-- Select Department --", ""));
            
        }

        protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {
            int? deptId = string.IsNullOrEmpty(ddlDepartment.SelectedValue) ? (int?)null : Convert.ToInt32(ddlDepartment.SelectedValue);

            if (deptId.HasValue)
            {
                BindEarningChart(deptId);
            }
            else
            {
                Chart1.Series.Clear();
                Chart1.Titles.Clear();
            }
        }


        public void BindEarningChart(int? deptId)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(cnf))
            {
                using (SqlCommand cmd = new SqlCommand("GetEarningContribution", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@DeptID", (object)deptId ?? DBNull.Value);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    Chart1.Series.Clear();
                    Series series = new Series("Earnings")
                    {
                        ChartType = SeriesChartType.Pie
                    };

                    foreach (DataRow row in dt.Rows)
                    {
                        series.Points.AddXY(row["EarningTypeName"].ToString(), Convert.ToDecimal(row["TotalAmount"]));
                    }

                    series["PieLabelStyle"] = "Outside";
                    series["PieLineColor"] = "Black";
                    series.IsValueShownAsLabel = true;
                    series.Label = "#VALX: #PERCENT{P0}";
                    series.ToolTip = "#VALX: #PERCENT{P0}";

                    Chart1.Series.Add(series);

                    Chart1.Titles.Clear();
                    Chart1.Titles.Add($"Earning Contribution - {ddlDepartment.SelectedItem.Text}");
                }
            }
        }




    }
}
