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
    public partial class ApplyLeave : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();

            Page.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;


            if (!IsPostBack)
            {
                FetchLeaveType();
            }
        }


        public void FetchLeaveType()
        {
            string q = "exec FetchLeave";
            SqlDataAdapter ada = new SqlDataAdapter(q, conn);
            DataSet ds = new DataSet();
            ada.Fill(ds);
            LeaveList.DataSource = ds;
            LeaveList.DataTextField = "leaveName";
            LeaveList.DataValueField = "leaveId";
            LeaveList.DataBind();

        }
        protected void LeaveRequestBtn_Click(object sender, EventArgs e)
        {
            string name = EmpName.Text;
            string LeaveID = LeaveList.SelectedValue;
            string LeaveName = LeaveList.Text;
            string SDate = StartDate.Text;
            string EDate = EndDate.Text;
            int TDuration=int.Parse(Duration.Text);
            string reason1=Reason.Text;
            string q = $"exec InsertEmpLeaveRequest  @full_name ='{name}'," +
                $"@startDate = '{SDate}'," +
                $"@leaveId = '{LeaveID}',"+
                $"@leaveName = '{LeaveName}'," +
                $"@endDate = '{EDate}'," +
                $"@Duration = {TDuration}," +
                $"@reason = '{reason1}'," +
                $"@stat = 'Pending'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Employee request send successfully')</script>");
        }

        protected void TrackId_Click(object sender, EventArgs e)
        {
            string name = EmpName.Text; // or from query string, session etc.
            string q = $"SELECT stat AS [Status],COUNT(*) AS [Count] FROM EmpLeaveRequest WHERE full_name ='{name}' group by stat";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            TrackView.DataSource = dt;
            TrackView.DataBind();
        }
    }
}