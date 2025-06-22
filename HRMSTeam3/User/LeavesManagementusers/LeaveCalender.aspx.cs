using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMSTeam3.User.Leaves_Management_users
{
    public partial class LeaveCalender : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            string q = $"exec LeaveCalenderProc";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                string date, text;
                while (rdr.Read())
                {
                    date = rdr["HolidayDate"].ToString(); 
                    text = rdr["Description"].ToString();


                    string[] edate = date.Split('-');
                    int year = int.Parse(edate[0]);
                    int month = int.Parse(edate[1]);
                    int day = int.Parse(edate[2]);
                    if (DateTime.TryParse(rdr["HolidayDate"].ToString(), out DateTime HolidayDate))
                    {
                        if (e.Day.Date == HolidayDate.Date)
                        {
                            string Description = rdr["Description"].ToString();
                            
                            e.Cell.Controls.Clear();
                            e.Cell.Text = $"<div style='color:blue; font-weight:bold;'>{HolidayDate.Day} - {Description}</div>";
                        }
                    }
                }
            }
            

        }
    }
}