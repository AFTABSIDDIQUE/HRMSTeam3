using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMSTeam3
{
    public partial class Create_User : System.Web.UI.Page
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
            string full_name = TextBox3.Text, email = TextBox4.Text, mobilenum = TextBox5.Text;
            string dob = TextBox6.Text, doj = TextBox7.Text, department = DropDownList1.SelectedValue, empstatus = DropDownList2.SelectedValue, designation = TextBox8.Text;
            string q = $"exec addemp '{full_name}','{email}','{mobilenum}','{dob}','{doj}','{department}','{designation}','{empstatus}'";
            SqlCommand cmd = new SqlCommand(q,conn);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Employee data Added succesfully');</script>");


        }
    }
}