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
    public partial class LoginDB : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string em = TextBox1.Text, pass = TextBox2.Text;
            string q = $"exec LoginProc '{em}','{pass}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                Session["Users"] = em;

                while (rdr.Read())
                {
                    if ((rdr["email"].Equals(em) || rdr["Username"].Equals(em)) && rdr["password"].Equals(pass)) 
                    {
                        if (rdr["role"].Equals("Admin"))
                        {
                            Response.Redirect("/Admin/AdminHome.aspx");
                        }
                        else if (rdr["role"].Equals("User"))
                        {
                            Response.Redirect("/User/UserHome.aspx");
                        }
                        else if(rdr["role"].Equals("HR"))
                        {
                            Response.Redirect("/HR/HRHome.aspx");
                        }
                        else if (rdr["role"].Equals("Manager"))
                        {
                            Response.Redirect("/Manager/ManagerHome.aspx");
                        }
                        else
                        {
                            Response.Write("404 User Not found");
                        }
                        
                    }

                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Credential')</script>");
            }

        }
    }
}