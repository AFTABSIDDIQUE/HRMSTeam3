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
    public partial class AddAppraisal : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();

            if (!IsPostBack)
            {
                DepartmentData();
                fetchEmp();
            }
        }

        public void DepartmentData()
        {
            string query = "SELECT DISTINCT designation FROM userCreation";
            SqlCommand cmd = new SqlCommand(query, conn);
            //conn.Open();

            SqlDataReader reader = cmd.ExecuteReader();
            DropDownList2.DataSource = reader;
            DropDownList2.DataTextField = "designation";  // Display field
            DropDownList2.DataValueField = "designation";   // Value field
            DropDownList2.DataBind();

            string q = "SELECT DISTINCT deptId FROM userCreation";
            SqlCommand cmnd = new SqlCommand(q, conn);
            SqlDataReader read = cmnd.ExecuteReader();
            DropDownList3.DataSource = read;
            DropDownList3.DataTextField = "deptId";
            DropDownList3.DataValueField = "deptId";
            DropDownList3.DataBind();

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

        protected void Button2_Click(object sender, EventArgs e)
        {
            string empName=DropDownList1.SelectedValue, appDate=TextBox1.Text, desg= DropDownList2.SelectedValue, dept= DropDownList3.SelectedValue, custExp= DropDownList14.SelectedValue, mark= DropDownList15.SelectedValue, manag= DropDownList16.SelectedValue, admin= DropDownList17.SelectedValue, pSkills= DropDownList18.SelectedValue, QuaWork= DropDownList4.SelectedValue, Effic= DropDownList5.SelectedValue, inte= DropDownList7.SelectedValue, proff= DropDownList8.SelectedValue, teamW= DropDownList9.SelectedValue, crit= DropDownList10.SelectedValue, conf= DropDownList11.SelectedValue, atten= DropDownList12.SelectedValue, ability= DropDownList13.SelectedValue,stat= DropDownList6.SelectedValue;
            string q = $"exec InsertOrUpdateAppraisal '0','{empName}','{appDate}','{desg}','{dept}','{custExp}','{mark}','{manag}','{admin}','{pSkills}','{QuaWork}','{Effic}','{inte}','{proff}','{teamW}','{crit}','{conf}','{atten}','{ability}','{stat}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            int rows = cmd.ExecuteNonQuery();
            if (rows > 0)
            {
                Response.Write("<script>alert('Appraisal Added Successfully...')</script>");

            }
            else
            {
                Response.Write("<script>alert('Error 404..')</script>");
            }
        }
    }
}