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
    public partial class UpdateEmp : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();
        }
        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            int eid = int.Parse(TextBox2.Text);
            string q = $"exec fetchemp '{eid}'";
            SqlCommand cmd = new SqlCommand(q,conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows) {

                while (rdr.Read())
                {
                    TextBox3.Text = rdr["full_name"].ToString();
                    TextBox4.Text = rdr["email"].ToString();
                    TextBox5.Text = rdr["mobile_num"].ToString();
                    TextBox6.Text = rdr["dob"].ToString();
                    TextBox7.Text = rdr["doj"].ToString();
                    DropDownList1.SelectedValue = rdr["department"].ToString();
                    TextBox8.Text = rdr["designation"].ToString();
                    DropDownList2.SelectedValue = rdr["status"].ToString();
                }
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            int eid = int.Parse(TextBox2.Text);
            string full_name = TextBox3.Text, email = TextBox4.Text, mobilenum = TextBox5.Text;
            string dob = TextBox6.Text, doj = TextBox7.Text, department = DropDownList1.SelectedValue, empstatus = DropDownList2.SelectedValue, designation = TextBox8.Text;
            string q = $"exec updateEmp '{eid}','{full_name}','{email}','{mobilenum}','{dob}','{doj}','{department}','{designation}','{empstatus}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Employee data Updated succesfully');</script>");
        }
    }
}