using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace HRMSTeam3.User.Leaves_Management_users
{
    public partial class apply : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();

            Page.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;


            
        }

        protected void StartDate_TextChanged(object sender, EventArgs e)
        {
            UpdateDuration();
        }

        protected void EndDate_TextChanged(object sender, EventArgs e)
        {
            UpdateDuration();
        }


        //Fetch leave according  to the dept  in the dropdown list
        public void FetchLeaveType()
        {
            string dept = deptId.Text;
            string q = $"EXEC FetchLeave '{dept}'";
            SqlDataAdapter ada = new SqlDataAdapter(q, conn);
            DataSet ds = new DataSet();
            ada.Fill(ds);
            LeaveList.DataSource = ds;
            LeaveList.DataTextField = "leaveName";
            LeaveList.DataValueField = "leaveId";
            LeaveList.DataBind();


        }

        protected void EmpName_TextChanged1(object sender, EventArgs e)
        {

            string name = EmpName.Text.Trim();
            string DeptExists = $"select department from employee where full_name = '{name}'";
            SqlCommand checkDept = new SqlCommand(DeptExists, conn);


            object result = checkDept.ExecuteScalar();

            if (result != null && result != DBNull.Value)
            {
                deptId.Text = result.ToString();
                FetchLeaveType();
            }
            else
            {
                deptId.Text = "";
                Response.Write("<script>alert('Employee not found or department not set.')</script>");
            }
        }
        protected void LeaveRequestBtn_Click(object sender, EventArgs e)
        {

            string name = EmpName.Text.Trim();
            string LeaveID = LeaveList.SelectedValue;
            string LeaveName = LeaveList.SelectedItem.Text;
            string department = deptId.Text.Trim();
            string SDate = StartDate.Text;
            string EDate = EndDate.Text;
            int TDuration = int.Parse(Duration.Text);
            string reason1 = Reason.Text;

            //check if user exists in the employee table or not
            string empExists = $"select count(*) from employee where full_name = '{name}'";
            SqlCommand checkEmp=new SqlCommand(empExists,conn);
            int emp = (int)checkEmp.ExecuteScalar();

            if (emp== 0)
            {
                Response.Write("<script>alert('Employee name does not exist in the Employee table. Please check the name.')</script>");
            }

            

            // Check if leave request already exists for selected date range
            string q1 = $"SELECT COUNT(*) FROM EmpLeaveRequest WHERE full_name = '{name}' AND startDate = '{SDate}' AND endDate = '{EDate}'";
            SqlCommand checkCmd = new SqlCommand(q1, conn);
            int existingRequests = (int)checkCmd.ExecuteScalar();

            if (existingRequests > 0)
            {
                Response.Write("<script>alert('A leave request already exists for the selected date range.')</script>");
                return;
            }

            // Get maximum allowed leave days for this leave type
            string getLimit = $"SELECT leaveEntitlement FROM leaveTable WHERE leaveId = '{LeaveID}'";
            SqlCommand cmd1 = new SqlCommand(getLimit, conn);
            object maxobj = cmd1.ExecuteScalar();

            if (maxobj == null)
            {
                Response.Write("<script>alert('Leave type not found or limit not set.')</script>");
                return;
            }

            int maxAllowed = Convert.ToInt32(maxobj);

            // Get total leave already used for this leave type by employee
            string usage = $"SELECT ISNULL(SUM(Duration), 0) FROM EmpLeaveRequest WHERE full_name = '{name}' AND leaveId = '{LeaveID}'";
            SqlCommand usageCmd = new SqlCommand(usage, conn);
            int totalUsed = (int)usageCmd.ExecuteScalar();

            // Check if requested duration is greater than allowed leave days
            if (totalUsed + TDuration > maxAllowed)
            {
                int remaining = maxAllowed - totalUsed;
                Response.Write($"<script>alert('You have only {remaining} leave days remaining for {LeaveName}. Request exceeds the limit.')</script>");
                return;
            }

            // Validate that start and end dates are not in the past
            DateTime startDate, endDate;

            if (!DateTime.TryParse(StartDate.Text, out startDate) ||
                !DateTime.TryParse(EndDate.Text, out endDate))
            {
                Response.Write("<script>alert('Invalid date format.')</script>");
                return;
            }

            // Validate no past dates
            DateTime today = DateTime.Today;
            if (startDate < today || endDate < today)
            {
                Response.Write("<script>alert('You cannot apply for past dates. Please select today or a future date.')</script>");
                return;
            }

            // Calculate working days excluding weekends and public holidays
            int workingDays = CalculateWorkingDays(startDate, endDate);

            if (workingDays <= 0)
            {
                Response.Write("<script>alert('The selected leave period contains no working days. Please select valid leave dates.')</script>");
                return;
            }

            // Set duration text to show calculated working days
            Duration.Text = workingDays.ToString();
             TDuration = workingDays;


            // Insert into EmpLEaveRequest table
            string q = $"EXEC InsertEmpLeaveRequest @full_name = '{name}'," +
                       $"@startDate = '{SDate}'," +
                       $"@leaveId = '{LeaveID}'," +
                       $"@leaveName = '{LeaveName}'," +
                       $"@dept = '{department}'," +
                       $"@endDate = '{EDate}'," +
                       $"@Duration = {TDuration}," +
                       $"@reason = '{reason1}'," +
                       $"@stat = 'Pending'";

            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();

            Response.Write("<script>alert('Employee request sent successfully')</script>");
        }

        protected void TrackId_Click(object sender, EventArgs e)
        {
            string name = EmpName.Text;
            //when entered the name in the Employee name textbox and clicked on the track button it will check the pending,approved and rejected leave request and their numbers
            string q = $"SELECT stat AS [Status],COUNT(*) AS [Count] FROM EmpLeaveRequest WHERE full_name ='{name}' group by stat";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            TrackView.DataSource = dt;
            TrackView.DataBind();

        }

        //Autopostback for the dept textbox
        //protected void deptId_TextChanged(object sender, EventArgs e)
        //{
        //    FetchLeaveType();
        //}

        public int CalculateWorkingDays(DateTime startDate, DateTime endDate)
        {

            // Total days inclusive
            int totalDays = (endDate - startDate).Days + 1;

            // Get all public holidays in the range

            string q = "select HolidayDate FROM PublicHolidays WHERE HolidayDate BETWEEN @start AND @end";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.Parameters.AddWithValue("@start", startDate);
            cmd.Parameters.AddWithValue("@end", endDate);

            List<DateTime> publicHolidays = new List<DateTime>();
            SqlDataReader reader = cmd.ExecuteReader();
            {
                while (reader.Read())
                {
                    publicHolidays.Add(reader.GetDateTime(0).Date);
                }
            }

            int workingDays = 0;

            for (DateTime day = startDate.Date; day <= endDate.Date; day = day.AddDays(1))
            {
                // Check if weekend
                if (day.DayOfWeek == DayOfWeek.Saturday || day.DayOfWeek == DayOfWeek.Sunday)
                {
                    continue; 
                }

                // Check if public holiday
                if (publicHolidays.Contains(day))
                {
                    continue;
                }

                // It's a working day
                workingDays++;
            }

            return workingDays;
        }

        public void UpdateDuration()
        {
            DateTime startDate, endDate;

            if (DateTime.TryParse(StartDate.Text, out startDate) &&
                DateTime.TryParse(EndDate.Text, out endDate))
            {
                if (startDate > endDate)
                {
                    Duration.Text = "0";
                    Response.Write("<script>alert('Start date cannot be after end date.')</script>");
                    return;
                }

                int workingDays = CalculateWorkingDays(startDate, endDate);

                if (workingDays <= 0)
                {
                    Duration.Text = "0";
                    Response.Write("<script>alert('Selected range includes no working days.')</script>");
                }
                else
                {
                    Duration.Text = workingDays.ToString();
                }
            }
        }

        
    }
}
