using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMSTeam3.Admin.Leave_Management
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

        protected void ApproveGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int leaveId = (int)(DataBinder.Eval(e.Row.DataItem, "LeaveId"));

                LinkButton btnApprove = new LinkButton();
                btnApprove.Text = "Approve";
                btnApprove.CommandName = "Approve";
                btnApprove.CommandArgument = leaveId.ToString();

                LinkButton btnReject = new LinkButton();
                btnReject.Text = "Reject";
                btnReject.CommandName = "Reject";
                btnReject.CommandArgument = leaveId.ToString();

                TableCell actionCell = new TableCell();
                actionCell.Controls.Add(btnApprove);
                actionCell.Controls.Add(new Literal { Text = "&nbsp;" });
                actionCell.Controls.Add(btnReject);

                e.Row.Cells.Add(actionCell);
            }
        }


        //protected void btnApproveSelected_Click(object sender, EventArgs e)
        //{
        //    UpdateStatus("Approved");
        //}

        //protected void btnRejectSelected_Click(object sender, EventArgs e)
        //{
        //    UpdateStatus("Rejected");
        //}

        //public void UpdateStatus(string stat)
        //{
        //    foreach(GridViewRow row in ApproveGrid.Rows)
        //    {
        //        CheckBox chk = row.FindControl("chkSelect") as CheckBox;

        //        if (chk.Checked == true)
        //        {

        //            var leaveRequestId = row.Cells[1].Text;

        //            string q = $"exec updateStat @stat='{stat}',@leaveRequestId={leaveRequestId}";
        //            SqlCommand cmd = new SqlCommand(q, conn);
        //            cmd.ExecuteNonQuery();
        //        }   

        //    }

        //}
        protected void ApproveGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Approve" || e.CommandName == "Reject")
            {
                int leaveId = Convert.ToInt32(e.CommandArgument);
                string status = e.CommandName == "Approve" ? "Approved" : "Rejected";

                string q = $"exec updateStat @stat='{status}', @leaveRequestId={leaveId}";
                SqlCommand cmd = new SqlCommand(q, conn);
                cmd.ExecuteNonQuery();

                Approve();
            }
        }

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
  
