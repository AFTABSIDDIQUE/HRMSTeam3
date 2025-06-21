using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMSTeam3.User
{
    public partial class UpdateInformation : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();
            string user = Session["Users"].ToString();
            string q = $"exec updatepersonaldata '{user}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {

                while (rdr.Read())
                {
                    TextBox10.Text = rdr["employee_id"].ToString();
                    TextBox3.Text = rdr["full_name"].ToString();
                    TextBox4.Text = rdr["email"].ToString();
                    TextBox5.Text = rdr["mobile_num"].ToString();
                    TextBox6.Text = rdr["dob"].ToString();
                    TextBox7.Text = rdr["doj"].ToString();
                    DropDownList1.SelectedValue = rdr["department"].ToString();
                    TextBox8.Text = rdr["designation"].ToString();
                    DropDownList3.SelectedValue = rdr["manager"].ToString();
                    DropDownList2.SelectedValue = rdr["status"].ToString();
                }
                TextBox10.Enabled = false;
                TextBox3.Enabled = false;
                TextBox6.Enabled = false;
                TextBox7.Enabled = false;
                TextBox8.Enabled = false;
                DropDownList1.Enabled = false;
                DropDownList3.Enabled = false;
                DropDownList2.Enabled = false;
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string username = Session["Users"].ToString();
            int eid = int.Parse(TextBox10.Text);
            string fileExtension = Path.GetExtension(FileUpload1.FileName);
            string customFileName = username + fileExtension;
            string savePath = Server.MapPath("../Profilepic/") + customFileName;
            FileUpload1.SaveAs(savePath);
            string file = "../Profilepic/" + customFileName;

            string full_name = TextBox3.Text, email = TextBox4.Text, mobilenum = TextBox5.Text, manager = DropDownList3.SelectedValue;
            string dob = TextBox6.Text, doj = TextBox7.Text, department = DropDownList1.SelectedValue, empstatus = DropDownList2.SelectedValue, designation = TextBox8.Text, emecontact = TextBox9.Text;
            string q = $"exec newpersonaldata '{eid}','{full_name}','{email}','{mobilenum}','{dob}','{doj}','{department}','{designation}','{manager}','{empstatus}','{emecontact}','{file}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Employee data Updated succesfully');</script>");
        }
    }
}