using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace HRMSTeam3.Admin.Reports
{
    public partial class LeaveReports : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();
            if (!IsPostBack)
            {
                LoadDepartmentFilter();
                if (ddlDepartment.Items.Count > 0)
                {
                    ddlDepartment.SelectedIndex = 0;
                    LoadAllData();
                }

            }

            

        }
        public void LoadAllData()
        {
            //LoadSummaryData();
            BindLeaveChart();
            BindLeaveBalanceChart();
            BindLeaveTypeChart();
            BindBarChart();
        }
        public void LoadDepartmentFilter()
        {
            string query = "SELECT DISTINCT Department FROM leaveTable ORDER BY Department";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader reader = cmd.ExecuteReader();

            

            while (reader.Read())
            {
                ddlDepartment.Items.Add(reader["Department"].ToString());
            }

        }
        public void BindLeaveChart()
        {
            DataTable dt = new DataTable();
            string department = ddlDepartment.SelectedValue;
            string query = $"exec chart1 '{department}'";
            

            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            da.Fill(dt);
            Chart1.Visible = dt.Rows.Count > 0;


            Chart1.Series.Clear();
            if (Chart1.Legends.Count == 0)
            {
                Chart1.Legends.Add(new Legend("Legend"));
            }



            foreach (DataRow row in dt.Rows)
            {
                string leaveType = row["Leave Name"].ToString();
                string month = row["MonthName"].ToString();
                int usedLeaves = Convert.ToInt32(row["Used Leaves"]);

                Series series = Chart1.Series.FindByName(leaveType);
                if (series == null)
                {
                    series = new Series(leaveType)
                    {
                        ChartType = SeriesChartType.StackedColumn,
                        ToolTip = "#VALX: #VAL Leaves"
                    };
                    Chart1.Series.Add(series);
                }

                series.Points.AddXY(month, usedLeaves);
            }


            Chart1.ChartAreas[0].AxisX.Title = "Month";
            Chart1.ChartAreas[0].AxisY.Title = "Used Leaves";
            Chart1.Titles.Clear();
            Chart1.Titles.Add("Total Leaves Taken (Monthly, Current Year)");
        }


        public void BindLeaveBalanceChart()
        {
            DataTable dt = new DataTable();
            string department = ddlDepartment.SelectedValue;
            string query = $"exec chart2 '{department}'";

            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            da.Fill(dt);
            Chart2.Visible = dt.Rows.Count > 0;


            Chart2.Series.Clear();

            // Add Used Leaves series
            Series usedSeries = new Series("Used Leaves")
            {
                ChartType = SeriesChartType.StackedBar,
                ToolTip = "#VALX: #VAL Used Leaves"
            };

            // Add Remaining Leaves series
            Series remainingSeries = new Series("Remaining Leaves")
            {
                ChartType = SeriesChartType.StackedBar,
                ToolTip = "#VALX: #VAL Balanced Leaves"
            };

            // Create labels as Employee
            foreach (DataRow row in dt.Rows)
            {
                string label = $"{row["Employee Name"]} - {row["Leave Type"]}";
                int used = Convert.ToInt32(row["Used Leaves"]);
                int remaining = Convert.ToInt32(row["Remaining Balance"]);

                usedSeries.Points.AddXY(label, used);
                remainingSeries.Points.AddXY(label, remaining);
            }

            Chart2.Series.Add(usedSeries);
            Chart2.Series.Add(remainingSeries);

            // Set chart titles
            Chart2.Titles.Clear();
            Chart2.Titles.Add("Leave Balance Overview - By Employee");

            Chart2.ChartAreas[0].AxisX.Title = "Leave Balance (Days)";
            Chart2.ChartAreas[0].AxisY.Title = "Employee - Leave Type";

        }

        public void BindLeaveTypeChart()
        {
            DataTable dt = new DataTable();

            string department = ddlDepartment.SelectedValue;
            string query = $"exec chart3 '{department}'";

            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            da.Fill(dt);
            Chart3.Visible = dt.Rows.Count > 0;


            // Build pie chart
            Chart3.Series.Clear();
            Series series = new Series("Available Leaves")
            {
                ChartType = SeriesChartType.Pie,
                ToolTip = "#VALX: #VAL Leaves"
            };

            foreach (DataRow row in dt.Rows)
            {
                string leaveType = row["Leave Type"].ToString();
                int totalAvailable = Convert.ToInt32(row["Total Available"]);

                series.Points.AddXY(leaveType, totalAvailable);
            }

            Chart3.Series.Add(series);
            Chart3.Titles.Clear();
            Chart3.Titles.Add("Total Available Leaves by Type ");
                              
        }
        public void BindBarChart()
        {
            DataTable dt = new DataTable();

            string department = ddlDepartment.SelectedValue;
            string query = $"exec chart4 '{department}'";

            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            da.Fill(dt);
            Chart4.Visible = dt.Rows.Count > 0;

            Chart4.Series.Clear();

            foreach (DataRow row in dt.Rows)
            {
                string leaveType = row["Leave Type"].ToString();
                string status = row["Status"].ToString();
                int count = Convert.ToInt32(row["Request Count"]);

                // Check if the series already exists
                Series series = Chart4.Series.FindByName(leaveType);
                if (series == null)
                {
                    series = new Series(leaveType)
                    {
                        ChartType = SeriesChartType.Bar,
                        ToolTip = "#VALX: #VAL Requests"
                    };
                    Chart4.Series.Add(series);
                }

                // Add data point
                series.Points.AddXY(status, count);
            }

            Chart4.Titles.Clear();
            Chart4.Titles.Add("Leave Requests by Status and Type");
            Chart4.ChartAreas[0].AxisX.Title = "Status";
            Chart4.ChartAreas[0].AxisY.Title = "Number of Requests";
        }


        protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {


            LoadAllData();
        }
    }
}


