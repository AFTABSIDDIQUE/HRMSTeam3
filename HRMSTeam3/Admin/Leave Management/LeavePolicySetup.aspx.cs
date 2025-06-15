using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMSTeam3.Admin.Leave_Management
{
    public partial class LeavePolicySetup : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();
        }

        protected void AddLeaveBtn_Click(object sender, EventArgs e)
        {
                
                string LeaveTitle = LeaveTitleId.Text, entitlement = EntitlementsId.Text;
                string q = $"exec LeaveProc '{LeaveTitle}','{entitlement}'";
                SqlCommand cmd = new SqlCommand(q, conn);
                cmd.ExecuteNonQuery();
           
        }
    }
}