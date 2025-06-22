using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMSTeam3.Manager.Leave_Management
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
                DisplayReport();
                
            }
        }

        //Fetching the details from leaveTable and EmpLeaveRequest where status is approved
        public void DisplayReport()
        {
            string q = "exec LeaveReportProc";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataAdapter ad=new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            ad.Fill(dt);
            GridView1.DataSource=dt;
            GridView1.DataBind();
        }
        
    }
}