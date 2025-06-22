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
    public partial class Deduction_type : System.Web.UI.Page
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
            string dtype = TextBox1.Text;

            string q = $"exec InsertDeductionType  @DeductionTypeName='{dtype}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Deduction type added')</script>");
            TextBox1.Text = "";
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string query = "EXEC ViewDeductionType";
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
            /*if (e.CommandName == "DeleteRow")
            {
                int deductionTypeId = Convert.ToInt32(e.CommandArgument);

                string query = "DELETE FROM DeductionType WHERE DeductionTypeID = @ID";
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@ID", deductionTypeId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }

               
                Button3_Click(null, null);
            }*/
        }

    }
}