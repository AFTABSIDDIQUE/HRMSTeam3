using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
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
            string ename = EmName.Text;
            string q = $"exec LeaveBalanceProc @full_name='{ename}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            ad.Fill(dt);
            LeaveBalanceView.DataSource = dt;
            LeaveBalanceView.DataBind();
        }
    }
}