using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMSTeam3.Manager.Leave_Management
{
    public partial class LeaveApprovals : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();

            if (!IsPostBack)
            {
                Approve();

            }
        }

        //Fetch the details from EmpLeaveRequest table where status is pending
        public void Approve()
        {
            string q = "exec leaveApproveProc";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ApproveGrid.DataSource = dt;
            ApproveGrid.DataBind();

        }

        //This runs for gridview when new row is created
        protected void ApproveGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int requestId = (int)(DataBinder.Eval(e.Row.DataItem, "requestId"));

                LinkButton btnApprove = new LinkButton();
                btnApprove.Text = "Approve";
                btnApprove.CommandName = "Approve";
                btnApprove.CommandArgument = requestId.ToString();

                LinkButton btnReject = new LinkButton();
                btnReject.Text = "Reject";
                btnReject.CommandName = "Reject";
                btnReject.CommandArgument = requestId.ToString();

                TableCell actionCell = new TableCell();
                actionCell.Controls.Add(btnApprove);
                actionCell.Controls.Add(new Literal { Text = "&nbsp;" });
                actionCell.Controls.Add(btnReject);

                e.Row.Cells.Add(actionCell);
            }
        }


        //This runs when the link button is clicked on the gridview row by exec updateStat
        protected void ApproveGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Approve" || e.CommandName == "Reject")
            {
                int requestId = Convert.ToInt32(e.CommandArgument);
                string status = e.CommandName == "Approve" ? "Approved" : "Rejected";

                SqlCommand cmd = new SqlCommand("updateStat", conn);
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@requestId", requestId);
                    cmd.Parameters.AddWithValue("@stat", status);

                    cmd.ExecuteNonQuery();
                }

                Approve(); // Refresh the grid
            }
        }

        //This makes View leave status button visible and invisble by clicking on it
        protected void CheckStatId_Click(object sender, EventArgs e)
        {
            if (CheckStatLeave.Visible == false)
            {
                CheckStatLeave.Visible = true;
                CheckStat();  
            }
            else
            {
               
                CheckStatLeave.Visible = false;
                CheckStat();
            }
        }

        //This shows all approved and rejected leave request
        public void CheckStat()
        {
            string q = "exec CheckStat";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            CheckStatLeave.DataSource = dt;
            CheckStatLeave.DataBind();
        }
    }

}
  
