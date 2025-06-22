using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMSTeam3.Admin.Calendar_Titles
{
    public partial class CalendarTitle : System.Web.UI.Page
    {
        SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
            
            if (!IsPostBack)
            {
                LoadHolidayData();
                AddPublicHolidays();
            }
        }

        //Fetch the holiday details from the title table
        private void LoadHolidayData()
        {
            SqlCommand cmd = new SqlCommand("exec FetchHolidayDetails", conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ViewState["HolidayData"] = dt; 
        }

        public void AddPublicHolidays()
        {
            string q1 = "exec LeaveCalenderProc";
            SqlCommand cmd = new SqlCommand(q1, conn);
            SqlDataReader rdr = cmd.ExecuteReader();

        }
        //Add color and title name on the calendar
        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {

            if (ViewState["HolidayData"] != null)
            {
                DataTable dt = (DataTable)ViewState["HolidayData"];

                foreach (DataRow row in dt.Rows)
                {
                    DateTime holidayDate = Convert.ToDateTime(row["date"]);
                    string title = row["title"].ToString();
                    string color = row["color"].ToString();

                    if (e.Day.Date == holidayDate.Date)
                    {
                        e.Cell.Controls.Add(new LiteralControl(
                            $"<br/><span style='color:{color}; font-weight:bold;'>{title}</span>"
                        ));
                    }
                }
            }
        }
    }
}
