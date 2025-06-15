using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMSTeam3.Admin
{
    public partial class Bulkupload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            
            if (FileUpload1.HasFile)
            {
                // Save uploaded file to server
                string filePath = Server.MapPath("~/Uploads/" + FileUpload1.FileName);

                // Create folder if not exists
                if (!Directory.Exists(Server.MapPath("~/Uploads")))
                    Directory.CreateDirectory(Server.MapPath("~/Uploads"));

                FileUpload1.SaveAs(filePath);

                // Read CSV and insert data
                using (StreamReader sr = new StreamReader(filePath))
                {
                    string line;
                    bool isHeader = true;

                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString);
                    conn.Open();

                    while ((line = sr.ReadLine()) != null)
                    {
                        if (isHeader)
                        {
                            isHeader = false; // skip column headers
                            continue;
                        }
                        string[] data = line.Split(',');

                        // Clean each field (trim spaces + quotes)
                        for (int i = 0; i < data.Length; i++)
                        {
                            data[i] = data[i].Trim().Trim('"');
                        }


                        if (data.Length == 8) // make sure all columns are present
                        {
                            string query = "INSERT INTO Employees (full_name, email, mobile_num, dob, doj, department, designation, status) " +
                                           "VALUES (@name, @email, @mobile, @dob, @doj, @dept, @desg, @status)";

                            SqlCommand cmd = new SqlCommand(query, conn);
                            cmd.Parameters.AddWithValue("@name", data[0]);
                            cmd.Parameters.AddWithValue("@email", data[1]);
                            cmd.Parameters.AddWithValue("@mobile", data[2]);
                            cmd.Parameters.AddWithValue("@dob", data[3]);
                            cmd.Parameters.AddWithValue("@doj", data[4]);
                            cmd.Parameters.AddWithValue("@dept", data[5]);
                            cmd.Parameters.AddWithValue("@desg", data[6]);
                            cmd.Parameters.AddWithValue("@status", data[7]);

                            cmd.ExecuteNonQuery();
                        }
                    }

                    conn.Close();
                    Label1.Text = "CSV uploaded and employees inserted successfully.";
                }
            }
            else
            {
                Label1.Text = "Please select a CSV file.";
            }
        }

    }
}
