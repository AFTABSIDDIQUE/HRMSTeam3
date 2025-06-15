using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace HRMSTeam3
{
    public partial class Document_mgmt : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int eid = int.Parse(TextBox1.Text);
            string doctype = DropDownList1.SelectedValue;
            FileUpload1.SaveAs(Server.MapPath("Emp Documents/") + Path.GetFileName(FileUpload1.FileName));
            string file = "Emp Documents/" + Path.GetFileName(FileUpload1.FileName);
            string q = $"exec docupload '{eid}','{doctype}','{file}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Employee Document submitted succesfully');</script>");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewdocs.aspx");
        }
    }
}