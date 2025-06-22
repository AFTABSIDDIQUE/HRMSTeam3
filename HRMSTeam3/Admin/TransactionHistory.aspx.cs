using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


namespace HRMSTeam3.Admin
{
    public partial class TransactionHistory : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();
            if (!IsPostBack)
            {
                BindDropdowns();
                LoadGrid(); 
            }
        }
        private void BindDropdowns()
        {
            // Department
            string deptQuery = "SELECT DISTINCT DeptName FROM Department ORDER BY DeptName";
            SqlCommand cmdDept = new SqlCommand(deptQuery, conn);
            SqlDataReader drDept = cmdDept.ExecuteReader();
            ddlFilterDepartment.DataSource = drDept;
            ddlFilterDepartment.DataTextField = "DeptName";
            ddlFilterDepartment.DataValueField = "DeptName";
            ddlFilterDepartment.DataBind();
            drDept.Close();
            ddlFilterDepartment.Items.Insert(0, new ListItem("-- All Departments --", ""));

            // Month
            ddlFilterMonth.Items.Clear();
            ddlFilterMonth.Items.Add(new ListItem("-- All Months --", ""));
            ddlFilterMonth.Items.AddRange(new ListItem[]
            {
        new ListItem("January", "January"),
        new ListItem("February", "February"),
        new ListItem("March", "March"),
        new ListItem("April", "April"),
        new ListItem("May", "May"),
        new ListItem("June", "June"),
        new ListItem("July", "July"),
        new ListItem("August", "August"),
        new ListItem("September", "September"),
        new ListItem("October", "October"),
        new ListItem("November", "November"),
        new ListItem("December", "December")
            });

            
            ddlFilterYear.Items.Clear();
            ddlFilterYear.Items.Add(new ListItem("-- All Years --", ""));
            for (int year = 2020; year <= DateTime.Now.Year; year++)
            {
                ddlFilterYear.Items.Add(new ListItem(year.ToString(), year.ToString()));
            }
        }
        private void LoadGrid()
        {
            string dept = ddlFilterDepartment.SelectedValue;
            string month = ddlFilterMonth.SelectedValue;
            string year = ddlFilterYear.SelectedValue;

            string query = "EXEC GetEmployeePayslips"; 
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);

            
            DataView dv = dt.DefaultView;

            string filter = "";
            if (!string.IsNullOrEmpty(dept)) filter += $"DeptName = '{dept}'";
            if (!string.IsNullOrEmpty(month)) filter += (filter != "" ? " AND " : "") + $"month = '{month}'";
            if (!string.IsNullOrEmpty(year)) filter += (filter != "" ? " AND " : "") + $"year = '{year}'";

            if (!string.IsNullOrEmpty(filter))
                dv.RowFilter = filter;

            ViewState["TransactionData"] = dv.ToTable();

            GridView1.DataSource = dv;
            GridView1.DataBind();
            GridView1.Visible = true;
        }
        protected void FilterChanged(object sender, EventArgs e)
        {
            LoadGrid();
        }




        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
            {
                if (e.CommandName == "ViewPayslip" || e.CommandName == "DownloadPayslip")
                {
                    string[] args = e.CommandArgument.ToString().Split('|');
                    int employeeId = int.Parse(args[0]);
                    string[] dateParts = args[1].Split('_');
                    string month = dateParts[0];
                    string year = dateParts[1];

                    string fileName = $"{month}_{year}_Emp{employeeId}.pdf";
                    string filePath = Server.MapPath($"~/Payslips/{fileName}");

                    if (File.Exists(filePath))
                    {
                        Response.ContentType = "application/pdf";
                        Response.AppendHeader("Content-Disposition",
                            (e.CommandName == "DownloadPayslip" ? "attachment" : "inline") + "; filename=" + fileName);
                        Response.TransmitFile(filePath);
                        Response.End();
                    }
                    else
                    {
                        Response.Write("<script>alert('Payslip not found.');</script>");
                    }
                }
            

        }
       


        protected void Button2_Click(object sender, EventArgs e)
        {
            string query = $"Exec GetEmployeePayslips";
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();
            ddlFilterDepartment.SelectedIndex = 0;
            ddlFilterMonth.SelectedIndex = 0;
            ddlFilterYear.SelectedIndex = 0;
            LoadGrid();
        }
    }
}