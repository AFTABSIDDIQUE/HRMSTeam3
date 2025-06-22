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

namespace HRMSTeam3.Admin
{
    public partial class GenerateRelievingLetter : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {

            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();


            fetchPosition();

        }
        protected void fetchPosition()
        {
            string q = $"exec  fetchPosition";

            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rd = cmd.ExecuteReader();
            post.DataSource = rd;
            post.DataTextField = "Position";
            post.DataValueField = "OfferId";
            post.DataBind();
            rd.Close();

        }


        protected void Button2_Click(object sender, EventArgs e)
        {
            string CandidateName, Email, Position, JoiningDate, DateOfRelieving;
            int OfferId;

            OfferId = int.Parse(post.SelectedValue);
            CandidateName = cname.Text;
            Email = email.Text;
            Position = post.SelectedItem.Text;
            JoiningDate = date.Text;
            DateOfRelieving = Relieving.Text;


            string q = $"exec insertRelievingLetter'{OfferId}','{CandidateName}','{Email}','{Position}','{JoiningDate}','{DateOfRelieving}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
            string fileName = Server.MapPath("../Documents//" + CandidateName + ".pdf");

            Document doc = new Document();
            PdfWriter.GetInstance(doc, new FileStream(fileName, FileMode.Create));
            doc.Open();

            // Fonts
            Font headingFont = FontFactory.GetFont("Arial", 14, Font.BOLD);
            Font subFont = FontFactory.GetFont("Arial", 10);
            Font bodyFont = FontFactory.GetFont("Arial", 11);
            Font boldFont = FontFactory.GetFont("Arial", 11, Font.BOLD);

            // Header
            doc.Add(new Paragraph("MASSTECH.", headingFont));
            doc.Add(new Paragraph("708, Fenkin 9 Wagle Estate", subFont));
            doc.Add(new Paragraph("Thane (W), Mumbai - 400604", subFont));
            doc.Add(new Paragraph(" Website: www.masstechbusiness.com", subFont));
            doc.Add(new Paragraph("\n"));

            // Date
            doc.Add(new Paragraph("Date: " + DateTime.Now.ToString("dd MMMM yyyy"), bodyFont));
            doc.Add(new Paragraph("\n"));

            // Recipient Info
            doc.Add(new Paragraph("To,", bodyFont));
            doc.Add(new Paragraph(CandidateName, boldFont));
            doc.Add(new Paragraph("\n"));

            // Subject
            doc.Add(new Paragraph("Subject: Relieving Letter", FontFactory.GetFont("Arial", 12, Font.BOLD | Font.UNDERLINE)));
            doc.Add(new Paragraph("\n"));

            // Body Paragraphs
            doc.Add(new Paragraph($"Dear {CandidateName},\n\n", bodyFont));

            string bodyPara =
            $"This is to certify that {CandidateName} was employed with Masstech Limited " +
            $"as a {Position}, from {DateTime.Parse(JoiningDate):dd MMMM, yyyy} to {DateTime.Parse(DateOfRelieving):dd MMMM, yyyy}. " +
            $"We confirm that they have served their notice period in full and have been officially relieved from their duties on {DateTime.Parse(DateOfRelieving):dd MMMM, yyyy}. " +
            "Their accounts and final settlement, if any, will be processed by our Accounts Department in accordance with company policy. " +
            "We thank them for their contributions and wish them every success in their future endeavors.";

            doc.Add(new Paragraph(bodyPara, bodyFont));
            doc.Add(new Paragraph("\n"));

            // Signature
            doc.Add(new Paragraph("Sincerely,\nHR Department", bodyFont));

            doc.Close();

            // Return the PDF for download
            Response.ContentType = "application/pdf";
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + CandidateName + "_Relieving.pdf");
            Response.WriteFile(fileName);
            Response.End();

        }

    }
}