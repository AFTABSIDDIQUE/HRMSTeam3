using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMSTeam3.Manager
{
    public partial class assingticket : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();
            if (!IsPostBack)
            {
                BindTickets();
            }
        }

        private void BindTickets()
        {
            string q = "select * from tickets";
            SqlDataAdapter da = new SqlDataAdapter(q, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }


        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Assign" || e.CommandName == "Close")
            {
                int rowIndex = int.Parse(e.CommandArgument.ToString());
                GridViewRow row = GridView1.Rows[rowIndex];
                int employeeId = int.Parse(row.Cells[0].Text);
                string user = Session["Users"].ToString();
                if (e.CommandName == "Assign")
                {
                    DropDownList ddl = (DropDownList)row.FindControl("ddlAssignTo");
                    string assignedTo = ddl.SelectedValue;

                    if (!string.IsNullOrEmpty(assignedTo))
                    {
                        string q = $"update tickets set assinged_to = '{assignedTo}' where employee_id = '{employeeId}'";
                        SqlCommand cmd = new SqlCommand(q, conn);
                        cmd.ExecuteNonQuery();
                    }
                }
                else if (e.CommandName == "Close")
                {
                    string q = $"update tickets set tik_status = 'Closed',closed_by='{user}' where employee_id = '{employeeId}'";
                    SqlCommand cmd = new SqlCommand(q, conn);
                    cmd.ExecuteNonQuery();
                }

                BindTickets();
            }
        }
    }
}