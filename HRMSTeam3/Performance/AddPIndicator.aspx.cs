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
    public partial class AddPIndicator : System.Web.UI.Page
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
            }
        }

        public void DepartmentData()
        {
            string query = "SELECT DISTINCT designation FROM userCreation";
            SqlCommand cmd = new SqlCommand(query, conn);
            //conn.Open();

            SqlDataReader reader = cmd.ExecuteReader();
            DropDownList10.DataSource = reader;
            DropDownList10.DataTextField = "designation";  // Display field
            DropDownList10.DataValueField = "designation";   // Value field
            DropDownList10.DataBind();

            string q = "SELECT DISTINCT deptId FROM userCreation";
            SqlCommand cmnd = new SqlCommand(q, conn);
            SqlDataReader read = cmnd.ExecuteReader();
            DropDownList11.DataSource = read;
            DropDownList11.DataTextField = "deptId";
            DropDownList11.DataValueField = "deptId";
            DropDownList11.DataBind();

        }



        protected void DropDownList10_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList11_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string q = "exec AddPIndicator ";
            SqlCommand cmd = new SqlCommand(q,conn);
            cmd.ExecuteNonQuery();

        }
    }
}