using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMSTeam3.Training
{
    public partial class UpdateTrainer : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();
            fetchRole();

        }
        public void fetchRole()
        {
            string q = "select DISTINCT roleId from userCreation";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                while (rdr.Read())
                {
                    string role = rdr["roleId"].ToString();
                    DropDownList1.Items.Add(role);
                }
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int id = int.Parse(TextBox5.Text);
            string fname = TextBox1.Text, lname = TextBox2.Text, phone = TextBox3.Text, timg, role = DropDownList1.SelectedValue, email = TextBox4.Text, desc = txtDescription.Text, status = DropDownList2.SelectedValue;
            FileUpload1.SaveAs(Server.MapPath("../trainerimg/") + Path.GetFileName(FileUpload1.FileName));
            timg = "../trainerimg/" + Path.GetFileName(FileUpload1.FileName);
            string q = $"exec AddTrainer '{id}','{fname}','{lname}','{phone}','{timg}','{role}','{email}','{desc}','{status}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            int rows = cmd.ExecuteNonQuery();
            if (rows > 0)
            {
                Response.Write("<script>alert('Trainer Added Successfully...')</script>");
                clear();
            }
            else
            {
                Response.Write("<script>alert('Error 404..')</script>");
            }


        }

        public void clear()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            DropDownList1.ClearSelection();
            DropDownList2.ClearSelection();
            txtDescription.Text = "";
        }
    }
}