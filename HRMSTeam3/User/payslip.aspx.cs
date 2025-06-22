using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace HRMSTeam3.User
{
    public partial class payslip : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*if (!IsPostBack)
            {
                if (Session["EmployeeId"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
            }*/
        }

        
            protected void Button2_Click(object sender, EventArgs e)
            {
                int employeeId = Convert.ToInt32(Session["EmployeeId"]);
                string month = DropDownList1.SelectedValue;
                string year = TextBox1.Text.Trim();

                if (string.IsNullOrWhiteSpace(year))
                {
                    Label2.Text = "Please enter a valid year.";
                    return;
                }

                string fileName = $"{month}_{year}_Emp{employeeId}.pdf";
                string filePath = Server.MapPath("../Payslips/" + fileName);

                DataTable dt = new DataTable();
                dt.Columns.Add("month");
                dt.Columns.Add("year");
                dt.Columns.Add("FileName");

                if (File.Exists(filePath))
                {
                    DataRow row = dt.NewRow();
                    row["month"] = month;
                    row["year"] = year;
                    row["FileName"] = fileName;
                    dt.Rows.Add(row);

                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    Label2.Text = "";
                }
                else
                {
                    GridView1.DataSource = null;
                    GridView1.DataBind();
                    Label2.Text = "No payslip found for selected month and year.";
                }
            

            }
        protected void btnDownload_Command(object sender, CommandEventArgs e)
        {
            string fileName = e.CommandArgument.ToString();
            string filePath = Server.MapPath("~/Payslips/" + fileName);

            if (File.Exists(filePath))
            {
                Response.ContentType = "application/pdf";
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
                Response.TransmitFile(filePath);
                Response.End();
            }
            else
            {
                Label2.Text = "File no longer exists.";
            }
        }

    }
}