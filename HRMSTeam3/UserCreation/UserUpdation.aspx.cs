using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMSTeam3.Admin
{
    public partial class UserUpdation : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();
        }
        public void clear()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Enabled = true;
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            TextBox9.Text = "";
            DropDownList1.ClearSelection();
            DropDownList2.ClearSelection();
            DropDownList3.ClearSelection();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int userId = int.Parse(TextBox9.Text);
            string fname = TextBox1.Text, lname = TextBox2.Text, dob = TextBox3.Text, addr = TextBox4.Text, email = TextBox5.Text, pass = TextBox6.Text, role = DropDownList1.Text, dept = DropDownList2.Text, desg = TextBox7.Text, doj = TextBox8.Text, stat = DropDownList3.SelectedValue, modified = Session["Users"].ToString();
            string q = $"exec updateUser '{userId}','{fname}','{lname}','{dob}','{addr}','{email}','{pass}','{role}','{dept}','{desg}','{doj}','{stat}',NULL,'{modified}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            int rows = cmd.ExecuteNonQuery();
            if (rows > 0)
            {
                Response.Write("<script>alert('User Updated Successfully...')</script>");
                clear();
            }
        }

        protected void TextBox9_TextChanged(object sender, EventArgs e)
        {
            int id = int.Parse(TextBox9.Text);
            string q = $"exec FetchUserToUpdate '{id}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                while (rdr.Read())
                {
                    TextBox1.Text = rdr["fname"].ToString();
                    TextBox2.Text = rdr["lname"].ToString();
                    TextBox3.Text = rdr["dob"].ToString();
                    TextBox4.Text = rdr["address"].ToString();
                    TextBox5.Text = rdr["email"].ToString();
                    TextBox6.Text = rdr["pass"].ToString();
                    TextBox7.Text = rdr["designation"].ToString();
                    TextBox8.Text = rdr["doj"].ToString();
                    TextBox5.Enabled = false;
                    
                }
            }
        }
    }
}