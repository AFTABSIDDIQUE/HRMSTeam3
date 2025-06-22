using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMSTeam3.Manager.Leave_Management
{
    public partial class LeaveDocumentation : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();

            if (!IsPostBack)
            {
                DisplayLeave();
                LoadDepartments();
                LoadLeaveTypes();
               
            }
        }


        //load all dept in dropdown
        public void LoadDepartments()
        {
            string query = "SELECT DISTINCT Department FROM leaveTable ORDER BY Department";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader dr = cmd.ExecuteReader();

            ddlDepartment.Items.Clear();
            ddlDepartment.Items.Add(new ListItem("-- All Departments --", ""));

            while (dr.Read())
            {
                ddlDepartment.Items.Add(new ListItem(dr["Department"].ToString(), dr["Department"].ToString()));
            }
            dr.Close();
        }

        //load all leaves in dropdown
        public void LoadLeaveTypes()
        {
            string query = "SELECT DISTINCT leaveName FROM leaveTable ORDER BY leaveName";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader dr = cmd.ExecuteReader();

            ddlLeaveType.Items.Clear();
            ddlLeaveType.Items.Add(new ListItem("-- All Leave Types --", ""));

            while (dr.Read())
            {
                ddlLeaveType.Items.Add(new ListItem(dr["leaveName"].ToString(), dr["leaveName"].ToString()));
            }
            dr.Close();
        }

        //display the leave and dept according to the filter conditions
        public void DisplayLeave()
        {
            string department = ddlDepartment.SelectedValue;
            string leaveType = ddlLeaveType.SelectedValue;

            StringBuilder query = new StringBuilder("SELECT * FROM leaveTable ");

            if (!string.IsNullOrEmpty(department))
            {
                query.Append(" AND Department = @Department");
            }

            if (!string.IsNullOrEmpty(leaveType))
            {
                query.Append(" AND leaveName = @LeaveName");
            }

            SqlCommand cmd = new SqlCommand(query.ToString(), conn);

            if (!string.IsNullOrEmpty(department))
            {
                cmd.Parameters.AddWithValue("@Department", department);
            }

            if (!string.IsNullOrEmpty(leaveType))
            {
                cmd.Parameters.AddWithValue("@LeaveName", leaveType);
            }

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            LeaveGrid.DataSource = dt;
            LeaveGrid.DataBind();
        }

        protected void FilterChanged(object sender, EventArgs e)
        {
            DisplayLeave();
        }

    }
}