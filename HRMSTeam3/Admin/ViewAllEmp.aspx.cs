using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMSTeam3.Admin
{
    public partial class ViewAllEmp : System.Web.UI.Page
    {
        SqlConnection conn;
        string selecteddesig;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();
            if (!IsPostBack)
            {
                dropdowndata();
                allemp();
                dropdowndatastatus();
            }
        }



        public void allemp()
        {
            string q = "exec fetchallemp";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(rdr);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        public void dropdowndata()
        {
            string query = "SELECT DISTINCT designation FROM Employees";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader rdr = cmd.ExecuteReader();

            DropDownList1.DataSource = rdr;
            DropDownList1.DataTextField = "designation";
            DropDownList1.DataValueField = "designation";
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("All", ""));
        }

        public void sortbydesig(string desig)
        {
            string q = $"exec sortbydesig '{desig}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(rdr);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selecteddesig = DropDownList1.SelectedValue;

            if (string.IsNullOrEmpty(selecteddesig))
            {

                allemp();

            }
            else
            {
                sortbydesig(selecteddesig);
            }
        }

        public void dropdowndatastatus()
        {
            string query = "SELECT DISTINCT status from employees";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader rdr = cmd.ExecuteReader();

            DropDownList2.DataSource = rdr;
            DropDownList2.DataTextField = "status";
            DropDownList2.DataValueField = "status";
            DropDownList2.DataBind();
            DropDownList2.Items.Insert(0, new ListItem("Status", ""));

        }
        public void sortbystatus(string status)
        {
            string q = $"exec sortbystatus '{status}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(rdr);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            string status = DropDownList2.SelectedValue;

            if (string.IsNullOrEmpty(status))
            {

                allemp();

            }
            else
            {
                sortbystatus(status);
            }
        }


        public void sortbyasc()
        {
            string q = $"exec sortemp_asc ";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(rdr);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        public void sortbydesc()
        {
            string q = $"exec sortemp_desc ";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(rdr);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sortby = DropDownList3.SelectedValue;
            if (sortby.Equals("Asc Sort"))
            {
                sortbyasc();
            }

            else if (sortby.Equals("Desc Sort"))
            {
                sortbydesc();
            }
            else if (sortby.Equals("Recent"))
            {
                sortbydesc();
            }
            else
            {

                allemp();

            }
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblStatus = (Label)e.Row.FindControl("lblStatus");
                if (lblStatus != null)
                {
                    string status = lblStatus.Text.ToLower();

                    if (status == "active")
                    {
                        lblStatus.CssClass += " bg-success text-white px-2 py-1 rounded-pill";
                    }
                    else if (status == "inactive")
                    {
                        lblStatus.CssClass += " bg-danger text-white px-2 py-1 rounded-pill";
                    }
                    else
                    {
                        lblStatus.CssClass += " bg-secondary text-white px-2 py-1 rounded-pill";
                    }
                }
            }

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            string search = TextBox1.Text;
            string q = $"exec searchemp '{search}'";
            SqlCommand cmd = new SqlCommand(q,conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(rdr);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            TextBox2.Text = "";
            TextBox3.Text = "";
        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {
            string startdate = TextBox2.Text;
            string enddate = TextBox3.Text;
            string q = $"exec searchbydate '{startdate}','{enddate}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(rdr);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            
        }
    }
}