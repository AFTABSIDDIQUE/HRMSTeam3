using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMSTeam3.Training
{
    public partial class UpdateTrainingList : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();
            fetchEmp();
            fetchTrainer();
            fetchTrainingType();

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
                    DropDownList3.Items.Add(role);
                }
            }

        }
        public void fetchTrainer()
        {
            string q = "select fname from trainerDetails";
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

        public void fetchTrainingType()
        {
            string q = "select trainingname from TrainingType";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                while (rdr.Read())
                {
                    string role = rdr["trainingname"].ToString();
                    DropDownList2.Items.Add(role);
                }
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int id = int.Parse(TextBox4.Text);
            string trainer = DropDownList1.SelectedValue, trainingType = DropDownList2.SelectedValue, employee = DropDownList3.SelectedValue, desc = txtDescription.Text, status = DropDownList4.SelectedValue, startDate = TextBox2.Text, endDate = TextBox3.Text;
            double trainingCost = double.Parse(TextBox1.Text);
            string q = $"exec manageTraining '{id}','{trainer}','{trainingType}','{employee}','{trainingCost}','{desc}','{status}','{startDate}','{endDate}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Training Assign Successfully...')</script>");
            clear();


        }
        public void clear()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            DropDownList1.ClearSelection();
            DropDownList2.ClearSelection();
            DropDownList3.ClearSelection();
            DropDownList4.ClearSelection();
        }

    }
}