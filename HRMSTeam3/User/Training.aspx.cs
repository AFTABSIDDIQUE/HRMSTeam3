using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMSTeam3.User
{
    public partial class Training : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();
            if (!IsPostBack)
            {
                BindDataList();
            }
        }

        public void BindDataList()
        {
            string name = Session["Users"].ToString();
                string query = $"SELECT * FROM trainingAssining where employeeName='{name}'"; // You can filter or join as needed
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                DataList1.DataSource = dt;
                DataList1.DataBind();
        }

        protected void btnEnroll_Click(object sender, EventArgs e)
        {
            Button btnEnroll = (Button)sender;
            btnEnroll.Text = "Enrolled";
            btnEnroll.BackColor = System.Drawing.Color.Green;
            btnEnroll.ForeColor = System.Drawing.Color.White; // Optional: to improve text visibility
        }
    }
}