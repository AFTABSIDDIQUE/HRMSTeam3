using iTextSharp.text;
using iTextSharp.text.pdf;
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


namespace HRMSTeam3.Admin
{
    public partial class GenerateOfferLetter : System.Web.UI.Page
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
            string CandidateName, Email, Address, Position, JoiningDate, Location;
            double Salary;

            CandidateName = name.Text;
            Email = email.Text;
            Address = add.Text;
            Position = post.Text;
            Salary = double.Parse(sal.Text);
            JoiningDate = date.Text;
            Location = loc.Text;

            string q = $"exec insertOfferLetter'{CandidateName}','{Email}','{Address}','{Position}','{Salary}','{JoiningDate}','{Location}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();


            string fileName = Server.MapPath("../Documents/" + name + ".pdf");

            
            Document doc = new Document();
            PdfWriter.GetInstance(doc, new FileStream(fileName, FileMode.Create));
            doc.Open();

            // Fonts
            Font headingFont = FontFactory.GetFont("Helvetica", 14, Font.BOLD);
            Font subFont = FontFactory.GetFont("Helvetica", 10);
            Font bodyFont = FontFactory.GetFont("Helvetica", 11);
            Font boldFont = FontFactory.GetFont("Helvetica", 11, Font.BOLD);

            // Header
            doc.Add(new Paragraph("MASSTECH ", headingFont));
            doc.Add(new Paragraph("708, Fenkin 9, Wagle Estate", subFont));
            doc.Add(new Paragraph("Thane , Mumbai - 400604", subFont));
            doc.Add(new Paragraph("Phone: ‪+91-1234567891‬ | Website: www.masstechbusiness.com", subFont));
            doc.Add(new Paragraph("\n"));

            // Date
            doc.Add(new Paragraph("Date: " + DateTime.Now.ToString("dd MMMM yyyy"), bodyFont));
            doc.Add(new Paragraph("\n"));

            // Recipient info
            doc.Add(new Paragraph("To,", bodyFont));
            doc.Add(new Paragraph(CandidateName, boldFont));
            doc.Add(new Paragraph(Address, bodyFont));
            doc.Add(new Paragraph("\n"));

            // Subject
            doc.Add(new Paragraph("Subject: Offer of Employment", FontFactory.GetFont("Arial", 12, Font.BOLD | Font.UNDERLINE)));
            doc.Add(new Paragraph("\n"));

            // Body
            doc.Add(new Paragraph($"Dear {CandidateName},", bodyFont));
            doc.Add(new Paragraph("\n"));

            string para1 = $"We are delighted to offer you the position of {Position} at Masstech Business Solutions Pvt. Ltd., {Location}.";
            string para2 = $"Your employment will commence on {JoiningDate}, and your annual compensation will be ₹{Salary:N2}, subject to deductions as per applicable laws.";
            string para3 = "This offer is contingent upon successful completion of the onboarding process and submission of required documents.";
            string para4 = "We are confident that your expertise will contribute to the continued success of our organization.";
            string para5 = "Please sign and return a copy of this letter to confirm your acceptance.";

            doc.Add(new Paragraph(para1 + "\n", bodyFont));
            doc.Add(new Paragraph(para2 + "\n", bodyFont));
            doc.Add(new Paragraph(para3 + "\n", bodyFont));
            doc.Add(new Paragraph(para4 + "\n", bodyFont));
            doc.Add(new Paragraph(para5 + "\n\n", bodyFont));

            // Closing
            doc.Add(new Paragraph("Sincerely,", bodyFont));
            doc.Add(new Paragraph("HR Department", bodyFont));
            doc.Add(new Paragraph("Masstech Business Solutions Pvt. Ltd."));

            doc.Close();

            // Download PDF
            Response.ContentType = "application/pdf";
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + CandidateName + "_OfferLetter.pdf");
            Response.WriteFile(fileName);
            Response.End();





        }

    }
}