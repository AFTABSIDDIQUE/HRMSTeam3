using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMSTeam3.User
{
    public partial class ViewData : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();
            string user = Session["Users"].ToString();
            string q = $"exec viewpersonaldata '{user}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(rdr);

            GridView1.DataSource = dt;
            GridView1.DataBind();

        }
      protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblStatus = (Label)e.Row.FindControl("lblStatus");
                if (lblStatus != null)
                {
                    string status = lblStatus.Text.ToLower();

                    if (status == "active")
                    {
                        lblStatus.CssClass += " bg-success text-white px-2 py-1 rounded-pill";
                    }
                    else if (status == "inactive")
                    {
                        lblStatus.CssClass += " bg-danger text-white px-2 py-1 rounded-pill";
                    }
                    else
                    {
                        lblStatus.CssClass += " bg-secondary text-white px-2 py-1 rounded-pill";
                    }
                }
            }

        }
    } 
}