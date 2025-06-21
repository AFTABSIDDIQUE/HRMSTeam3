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

namespace HRMSTeam3.User.Leaves_Management_users
{
    public partial class LeaveBalance : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();

        }

        protected void LeaveBalanceBtn_Click(object sender, EventArgs e)
        {
            
            DisplayLeaveBalance();
        }
        public void DisplayLeaveBalance()
        {
            //Fetch the leave balance and usage according to the name entered in the textbox
            string ename = EmName.Text;
            string q = $"exec LeaveBalanceProc @full_name='{ename}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            ad.Fill(dt);
            LeaveBalanceView.DataSource = dt;
            LeaveBalanceView.DataBind();

            // Clear previous series
            Chart1.Series.Clear();
            Chart1.Legends.Clear();
            Chart1.ChartAreas[0].AxisX.Title = "";
            Chart1.ChartAreas[0].AxisY.Title = "";

            // Create pie chart series
            Chart1.Series.Add("LeaveData");
            Chart1.Series["LeaveData"].ChartType = SeriesChartType.Pie;
            Chart1.Series["LeaveData"].IsValueShownAsLabel = true;
            Chart1.Legends.Add(new Legend("Legend"));

            // Calculate total used and balanced leave days
            int totalUsed = 0;
            int totalBalance = 0;

            foreach (DataRow row in dt.Rows)
            {
                totalUsed += Convert.ToInt32(row["Used Leaves"]);
                totalBalance += Convert.ToInt32(row["Pending Leaves"]);
            }

            // Add points to pie chart
            Chart1.Series["LeaveData"].Points.AddXY("Used Leaves", totalUsed);
            Chart1.Series["LeaveData"].Points.AddXY("Balanced Leaves", totalBalance);

        }
    }
}