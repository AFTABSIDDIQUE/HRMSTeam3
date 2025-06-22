using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMSTeam3.Admin.Calendar_Titles
{
    public partial class EventName : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();

        }

        
        protected void EventBtn_Click1(object sender, EventArgs e)
        {
            //Check if the admin is adding the same event
            string Eventname = eventId.Text;
            string q1 = $"SELECT COUNT(*) FROM event WHERE Eventname = '{Eventname}'";
            SqlCommand cmd1 = new SqlCommand(q1, conn);
            int count = (int)cmd1.ExecuteScalar();

            
            if (count > 0)
            {
                Response.Write("<script>alert('Event already exists.')</script>");
            }

            //if not same then insert the details in event table
            else
            {
                string stat = DropDownList1.SelectedValue, color = ColorId.Text;
                string q = $"exec EventProc @Eventname='{Eventname}',@stat='{stat}',@color='{color}'";
                SqlCommand cmd = new SqlCommand(q, conn);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Event added successfullly')</script>");
            }
        }
    }
}