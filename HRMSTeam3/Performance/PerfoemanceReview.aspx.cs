using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMSTeam3.Performance
{
    public partial class PerfoemanceReview : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();

            if (!IsPostBack)
            {
                fetchEmp();
                clear();
            }

        }

        public void clear()
        {
            DropDownList1.ClearSelection();
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
        }

        public void fetchData()
        {
            int id = int.Parse(TextBox1.Text.ToString());
            string q = $"select * from userCreation where userId='{id}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                while (rdr.Read())
                {
                    DropDownList1.SelectedValue = rdr["fname"].ToString();
                    TextBox2.Text = rdr["deptId"].ToString();
                    TextBox3.Text = rdr["designation"].ToString();
                    TextBox4.Text = rdr["doj"].ToString() ;

                }
            }
        }
        public void fetchEmp()
        {
            string q = "select fname from userCreation where roleId='User'";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                while (rdr.Read())
                {
                    string role = rdr["fname"].ToString();
                    DropDownList1.Items.Add(role);
                }
            }

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            fetchData();
        }
    }
}