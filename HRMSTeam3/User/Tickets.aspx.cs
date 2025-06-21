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
    public partial class Tickets : System.Web.UI.Page
    {
        SqlConnection conn;
        string name;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();
            name = Session["Users"].ToString();
            TextBox1.Text = name;
            string q = $"exec updatepersonaldata '{name}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {

                while (rdr.Read())
                {
                    TextBox3.Text = rdr["employee_id"].ToString();
                    TextBox3.Enabled = false;
                    TextBox1.Enabled = false;

                }
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            int eid= int.Parse( TextBox3.Text);
            string name=TextBox1.Text, tdept=DropDownList1.SelectedValue, tdes=TextBox2.Text;
            string fileExtension = Path.GetExtension(FileUpload1.FileName);
            string customFileName = name + "ticket" + fileExtension;
            string savePath = Server.MapPath("../ticket_attach/") + customFileName;
            FileUpload1.SaveAs(savePath);
            string file = "../ticket_attach/" + customFileName;

            string q = $"exec createticket '{eid}','{name}','{tdept}','{tdes}','{file}'";
            SqlCommand cmd = new SqlCommand(q,conn);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Ticket Is Raised');</script>");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("yourtickets.aspx");
        }
    }
}