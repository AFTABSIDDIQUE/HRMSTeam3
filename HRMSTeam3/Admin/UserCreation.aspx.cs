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
    public partial class UserCreation : System.Web.UI.Page
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
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            DropDownList1.ClearSelection();
            DropDownList2.ClearSelection();
            DropDownList3.ClearSelection();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string fname=TextBox1.Text, lname=TextBox2.Text, dob=TextBox3.Text, addr=TextBox4.Text, email=TextBox5.Text, pass=TextBox6.Text, role=DropDownList1.Text, dept=DropDownList2.Text, desg=TextBox7.Text, doj=TextBox8.Text, stat = DropDownList3.SelectedValue, created = Session["Users"].ToString();
            string q = $"exec addUser '{fname}','{lname}','{dob}','{addr}','{email}','{pass}','{role}','{dept}','{desg}','{doj}','{stat}',NULL,'{created}',NULL,NULL";
            SqlCommand cmd = new SqlCommand(q, conn);
            int rows = cmd.ExecuteNonQuery();
            if (rows>0)
            {
                string qu = $"exec addUserLogin '{email}','{fname}','{pass}','{role}'";
                SqlCommand cmnd = new SqlCommand(qu, conn);
                cmnd.ExecuteNonQuery();
                Response.Write("<script>alert('User Created Successfully...')</script>");
                clear();
            }
            else
            {
                Response.Write("<script>alert('Use Another Email..')</script>");
            }
            
        }

        protected void TextBox5_TextChanged(object sender, EventArgs e)
        {
            string emailFetch = TextBox5.Text;
            string email = $"select email from userCreation where email='{@emailFetch}'";
            SqlCommand cmd = new SqlCommand(email, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                Label2.Text = "Email Already Exist";
            }
            else
            {
                Label2.Text = "";
            }
        }
    }
}