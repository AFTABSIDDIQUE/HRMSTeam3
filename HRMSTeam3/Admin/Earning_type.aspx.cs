using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMSTeam3.Admin
{
    public partial class Earning_type : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            string etype = TextBox1.Text;
            

            string q = $"exec InsertEarningType  @EarningTypeName='{etype}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();

            Panel1.Visible = true;
            alertMsg.Text = "Earning Type added successfully.";
            TextBox1.Text = "";
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string query = "EXEC ViewEarningType";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader rd = cmd.ExecuteReader();

            DataTable dt = new DataTable();
            dt.Load(rd);

            GridView1.DataSource = dt;
            GridView1.DataBind();
            GridView1.Visible = true;

            rd.Close();
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                // Your SQL DELETE logic here using the ID
                // After deletion:
                //LoadGrid(); // Refresh the data
            }
        }


    }
}