using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using HRMSTeam3.User;
//using System.IO;

namespace HRMSTeam3.Admin
{
    public partial class GeneratePayslips : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();
            if (!IsPostBack)
            {
                
                FetchEmpID();
                
            }
        }
        public void FetchEmpID()
        {
            /*string query = "exec FetchEmp";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader rd = cmd.ExecuteReader();
            DropDownList1.DataSource = rd;
            DropDownList1.DataTextField = "full_name";
            DropDownList1.DataValueField = "employee_id";
            DropDownList1.DataBind();
            rd.Close();

            DropDownList1.Items.Insert(0, new ListItem("---Select EmpID--", ""));*/

            string query = "exec FetchEmp";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader rd = cmd.ExecuteReader();
            DropDownList1.DataSource = rd;
            DropDownList1.DataTextField = "employee_id";
            DropDownList1.DataValueField = "employee_id";
            DropDownList1.DataBind();
            rd.Close();

            //DropDownList1.Items.Insert(0, new ListItem("---Select EmpID--", ""));
        }

        /*protected void Button2_Click(object sender, EventArgs e)
        {

            int employeeId = int.Parse(DropDownList1.SelectedValue);
             string month = DropDownList2.SelectedValue;
             string year = TextBox1.Text.Trim();

             string payslipPath = $"{month}_{year}_Emp{employeeId}.pdf";

             string query = $"EXEC InsertPayslips @EmployeeId={employeeId}, @Month='{month}', @Year='{year}', @PayslipPath='{payslipPath}'";

             SqlCommand cmd = new SqlCommand(query, conn);
             cmd.ExecuteNonQuery();

             Response.Write("<script>alert('inserted')</script>");

            
        }*/
    
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox2.Text = "";

            if (!string.IsNullOrEmpty(DropDownList1.SelectedValue))
            {
                int empId = int.Parse(DropDownList1.SelectedValue);
                string query = $"SELECT full_name FROM Employees WHERE employee_id = {empId}";

                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    TextBox2.Text = reader["full_name"].ToString();
                }
                reader.Close();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int employeeId = int.Parse(DropDownList1.SelectedValue);
            string month = DropDownList2.SelectedValue;
            string year = TextBox1.Text.Trim();
            string fileName = $"{month}_{year}_Emp{employeeId}.pdf";
            string filePath = Server.MapPath($"~/Payslips/{fileName}");

            string checkQuery = $"Exec CheckPayslipExists @EmpId={employeeId}, @Month='{month}', @Year ='{year}'";
            SqlCommand checkCmd = new SqlCommand(checkQuery, conn);
            int count = (int)checkCmd.ExecuteScalar();
            if (count > 0)
            {
                Response.Write("<script>alert('Payslip already generated for this employee and month.');</script>");
                return;
            }

            if (!Directory.Exists(Server.MapPath("~/Payslips")))
                Directory.CreateDirectory(Server.MapPath("~/Payslips"));

            string query = $"Exec GetPayslipDetails {employeeId}";
            SqlCommand cmd = new SqlCommand(query, conn);
            
            
            SqlDataReader reader = cmd.ExecuteReader();

            // Declare variables
            string fullName = "", email = "", mobile = "", doj = "", dept = "", desig = "";
            decimal  total = 0, net = 0;
            List<Tuple<string, decimal>> earnings = new List<Tuple<string, decimal>>();
            //List<Tuple<string, decimal>> deductions = new List<Tuple<string, decimal>>();
            List<Tuple<string, decimal>> deductions = new List<Tuple<string, decimal>>();
            decimal totalDeductions = 0;


            // Employee & Salary Info
            if (reader.Read())
            {
                fullName = reader["full_name"].ToString();
                email = reader["email"].ToString();
                mobile = reader["mobile_num"].ToString();
                doj = Convert.ToDateTime(reader["doj"]).ToShortDateString();
                dept = reader["DeptName"].ToString();
                desig = reader["DesigName"].ToString();
                //basic = Convert.ToDecimal(reader["BasicSalary"]);
                total = Convert.ToDecimal(reader["TotalSalary"]);
                net = Convert.ToDecimal(reader["NetSalary"]);
            }

            //Earnings
            reader.NextResult();
            while (reader.Read())
            {
                string name = reader["EarningTypeName"].ToString();
                decimal percent = Convert.ToDecimal(reader["Percentage"]);
                decimal amount = (total * percent) / 100;
                earnings.Add(Tuple.Create(name, amount));
            }

            // Deductions
            reader.NextResult();
            while (reader.Read())
            {
                string name = reader["DeductionTypeName"].ToString();
                decimal percent = Convert.ToDecimal(reader["Percentage"]);
                decimal amount = (total * percent) / 100;
                totalDeductions += amount;
                deductions.Add(Tuple.Create(name, amount));
            }
            reader.Close();

            
            // PDF Generation
            Document doc = new Document(PageSize.A4, 36, 36, 36, 36);
            PdfWriter.GetInstance(doc, new FileStream(filePath, FileMode.Create));
            doc.Open();

            // Fonts
            var titleFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 18);
            var sectionFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12);
            var normalFont = FontFactory.GetFont(FontFactory.HELVETICA, 10);
            var redFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 11, BaseColor.RED);
            var headerFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 10, BaseColor.WHITE);

            // Title
            Paragraph title = new Paragraph("Salary Payslip", titleFont);
            title.Alignment = Element.ALIGN_CENTER;
            doc.Add(title);
            doc.Add(new Paragraph($"Month: {month} {year}", normalFont));
            doc.Add(Chunk.NEWLINE);

            // From & To – without table
            doc.Add(new Paragraph("From: Company ", normalFont));
            doc.Add(new Paragraph("Email: hr@gmail.com", normalFont));
            doc.Add(new Paragraph("Phone: 7209821198", normalFont));
            doc.Add(Chunk.NEWLINE);
            doc.Add(new Paragraph($"To: {fullName}", normalFont));
            doc.Add(new Paragraph($"Designation: {desig}", normalFont));
            doc.Add(new Paragraph($"Email: {email}", normalFont));
            doc.Add(new Paragraph($"Phone: {mobile}", normalFont));
            doc.Add(Chunk.NEWLINE);

            // Earnings and Deductions side-by-side
            PdfPTable sideBySideTable = new PdfPTable(2);
            sideBySideTable.WidthPercentage = 100;
            sideBySideTable.SetWidths(new float[] { 1, 1 });

            // Earnings Table
            PdfPTable earnTable = new PdfPTable(2);
            earnTable.WidthPercentage = 100;

            // Header Row for Earnings
            PdfPCell earnHeader1 = new PdfPCell(new Phrase("Earning Type", headerFont));
            PdfPCell earnHeader2 = new PdfPCell(new Phrase("Amount (₹)", headerFont));
            earnHeader1.BackgroundColor = BaseColor.BLACK;
            earnHeader2.BackgroundColor = BaseColor.BLACK;
            earnHeader1.HorizontalAlignment = Element.ALIGN_CENTER;
            earnHeader2.HorizontalAlignment = Element.ALIGN_CENTER;
            earnTable.AddCell(earnHeader1);
            earnTable.AddCell(earnHeader2);

            // Data Rows
            foreach (var earning in earnings)
            {
                earnTable.AddCell(new Phrase(earning.Item1, normalFont));
                earnTable.AddCell(new Phrase(earning.Item2.ToString("0.00"), normalFont));
            }

            // Deductions Table
            PdfPTable dedTable = new PdfPTable(2);
            dedTable.WidthPercentage = 100;

            // Header Row for Deductions
            PdfPCell dedHeader1 = new PdfPCell(new Phrase("Deduction Type", headerFont));
            PdfPCell dedHeader2 = new PdfPCell(new Phrase("Amount (₹)", headerFont));
            dedHeader1.BackgroundColor = BaseColor.BLACK;
            dedHeader2.BackgroundColor = BaseColor.BLACK;
            dedHeader1.HorizontalAlignment = Element.ALIGN_CENTER;
            dedHeader2.HorizontalAlignment = Element.ALIGN_CENTER;
            dedTable.AddCell(dedHeader1);
            dedTable.AddCell(dedHeader2);

            // Data Rows
            foreach (var deduction in deductions)
            {
                dedTable.AddCell(new Phrase(deduction.Item1, normalFont));
                dedTable.AddCell(new Phrase(deduction.Item2.ToString("0.00"), normalFont));
            }

            // Add both tables to side-by-side layout
            sideBySideTable.AddCell(new PdfPCell(earnTable) { Border = 0 });
            sideBySideTable.AddCell(new PdfPCell(dedTable) { Border = 0 });
            doc.Add(sideBySideTable);

            // Summary
            doc.Add(Chunk.NEWLINE);
            doc.Add(new Paragraph("Summary", sectionFont));
            doc.Add(new Paragraph($"Total Salary: ₹{total:N2}", normalFont));
            doc.Add(new Paragraph($"Total Deductions: ₹{totalDeductions:N2}", normalFont));
            doc.Add(new Paragraph($"Net Salary: ₹{net:N2}", redFont));

            doc.Close();



            string insertQuery = $"INSERT INTO Payslips (employee_id, month, year, payslipPath) VALUES ({employeeId}, '{month}', '{year}', '{filePath}')";
            SqlCommand insertCmd = new SqlCommand(insertQuery, conn);
            insertCmd.ExecuteNonQuery();

            string employeeEmail = "";
            string empQuery = $"SELECT email, full_name FROM Employees WHERE employee_id = {employeeId}";
            SqlCommand empCmd = new SqlCommand(empQuery, conn);

            
            SqlDataReader empReader = empCmd.ExecuteReader();
            
                    if (empReader.Read())
                    {
                        employeeEmail = empReader["email"].ToString();
                        fullName = empReader["full_name"].ToString();
                    }

            
            try
            {
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("sahnisha161@gmail.com");
                mail.To.Add(employeeEmail); 
                mail.Subject = $"Payslip for {month} {year}";
                mail.Body = $"Dear {fullName},\n\nPlease find attached your payslip for {month} {year}.\n\nRegards,\nHR Department";
                mail.IsBodyHtml = false;

                Attachment attachment = new Attachment(filePath);
                mail.Attachments.Add(attachment);

                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                smtp.Credentials = new NetworkCredential("sahnisha161@gmail.com", "wlzwiwnqcrcuohwl");
                smtp.EnableSsl = true;

                smtp.Send(mail);
                Response.Write("<script>alert('Payslip sent to employee successfully.');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('PDF generated but email failed: " + ex.Message + "');</script>");
            }


            // Download
            Response.ContentType = "application/pdf";
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
            Response.TransmitFile(filePath);
            Response.End();
        }

    }
}