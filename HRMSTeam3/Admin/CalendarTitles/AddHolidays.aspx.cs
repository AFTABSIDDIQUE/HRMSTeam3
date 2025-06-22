using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMSTeam3.Admin.Calendar_Titles
{
    public partial class AddHolidays : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();
            
            if (!IsPostBack)
            {
                FetchEvent();
            }
        }
        //fetching event name from the event table and EventName page
        public void FetchEvent()
        {
            string q = " exec TitleProc @fun2 = 'funEvent'";
            SqlDataAdapter ada = new SqlDataAdapter(q, conn);
            DataSet ds = new DataSet();
            ada.Fill(ds);
            EventList.DataSource = ds;
            EventList.DataTextField = "eventName";
            EventList.DataValueField = "eventId";
            EventList.DataBind();

        }

        //Inserting the event title in the title table
        protected void titleBtn_Click(object sender, EventArgs e)
        {

            string Ttitle = title.Text, Tlist = EventList.SelectedValue, Tdate = dateId.Text;
            string q = $"exec TitleProc @tname='{Ttitle}',@date='{Tdate}',@eventId='{Tlist}',@color='{Tlist}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Holiday added successfullly')</script>");

        }

       
    }
}