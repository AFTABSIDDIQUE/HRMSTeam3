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
    public partial class AddTrainingType : System.Web.UI.Page
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
            DropDownList1.ClearSelection();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string type=TextBox1.Text, descp=TextBox2.Text, stat=DropDownList1.Text;
            string q = $"exec AddTrainingType '0','{type}','{descp}','{stat}'";
            SqlCommand cmd = new SqlCommand(q,conn);
            int rows = cmd.ExecuteNonQuery();
            if (rows > 0)
            {
                Response.Write("<script>alert('Training Type Added Successfully...')</script>");
                clear();
            }
            else
            {
                Response.Write("<script>alert('Error 404..')</script>");
            }
        }
    }
}