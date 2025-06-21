using HRMSTeam3.Admin;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMSTeam3.User
{
    public partial class Attendence : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();
            string username = Session["Users"].ToString();
            if (!IsPostBack)
            {
                imgProfile.ImageUrl = $"../Profilepic/{username}.jpeg";
                lblName.Text = username;
            }
        }

        protected void btnCheckIn_Click(object sender, EventArgs e)
        {
            
            string username = Session["Users"].ToString();
            fetchempid(username);
            int eid = int.Parse(Session["userid"].ToString());
            lblStatus.Text = "✅ You have checked in at " + DateTime.Now.ToString("hh:mm tt");
            if (DateTime.Now.ToString("dd") == (DateTime.Now.ToString("dd")))
            {
                btnCheckIn.Enabled = false;
            }
            else {
                btnCheckIn.Enabled = true;
            }
                string checkin = DateTime.Now.ToString("dd-MM-yyyy HH:mm tt");
            string q = $"exec checkinadd '{eid}','{username}','{checkin}'";
            SqlCommand cmd = new SqlCommand(q,conn);
            cmd.ExecuteNonQuery();
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            string username = Session["Users"].ToString();
            fetchempid(username);
            int eid = int.Parse(Session["userid"].ToString());
            lblStatus.Text = "✅ You have checked out at " + DateTime.Now.ToString("hh:mm tt");
            string checkout = DateTime.Now.ToString("dd-MM-yyyy HH:mm tt");
            string q1 = $"exec checkoutadd @id='{eid}',@checkout='{checkout}'";
            SqlCommand cmd = new SqlCommand(q1,conn);
            cmd.ExecuteNonQuery();
        }


        public void fetchempid(string user)
        {
            user = Session["Users"].ToString();
            string q = $"exec fetchidforattendance '{user}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows && rdr.Read())
            {
                int eid= int.Parse(rdr["employee_id"].ToString());
                Session["userid"] = eid;
            }
        }
    }
}
