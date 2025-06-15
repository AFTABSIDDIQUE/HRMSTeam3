using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMSTeam3.Admin.Leave_Management
{
    public partial class LeaveDocumentation : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();

            if (!IsPostBack)
            {
                DisplayLeave();
                LabelInfo();
            }
        }

        public void DisplayLeave()
        {
            string q = "exec leaveDisplay";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            LeaveGrid.DataSource = dt;
            LeaveGrid.DataBind();
        }

        public void LabelInfo()
        {
            string q = "exec leaveDisplay";
            SqlCommand cmd = new SqlCommand(q, conn);
            StringBuilder msg = new StringBuilder();
            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                string name = rdr["LeaveName"].ToString();
                string entitlement = rdr["leaveEntitlement"].ToString();
                msg.Append($"<b>{name}</b><br/>");
                msg.Append($"All employees are entitled to {entitlement} days of {name}.<br/>");
            }

            Label2.Text=msg.ToString();
        }
    }
}