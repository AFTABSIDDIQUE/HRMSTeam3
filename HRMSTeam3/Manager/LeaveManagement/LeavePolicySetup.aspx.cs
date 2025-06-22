using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMSTeam3.Manager.Leave_Management
{
    public partial class LeavePolicySetup : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();
            Page.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

        }

        protected void AddLeaveBtn_Click(object sender, EventArgs e)
        {
            string LeaveTitle1 = LeaveTitleId.Text;
            string dept = department.Text;
            //Check for the leave name according to the dept if exists
            string q1 = $"SELECT COUNT(*) FROM leaveTable WHERE leaveName = '{LeaveTitle1}' AND department='{dept}'";
            SqlCommand cmd1 = new SqlCommand(q1, conn);
            int count = (int)cmd1.ExecuteScalar();

            if (count > 0)
            {

                Response.Write("<script>alert('This Leave Type already exists')</script>");
            }
            else
            {
                //Add the leave type,numbers and dept in leaveTable
                string LeaveTitle = LeaveTitleId.Text, entitlement = EntitlementsId.Text,dept1=department.Text;
                string q = $"exec LeaveProc '{dept1}','{LeaveTitle}','{entitlement}'";
                SqlCommand cmd = new SqlCommand(q, conn);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Leave Added Successfully')</script>");
            }
        }
    }
}