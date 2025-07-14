using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Net.Mail;
using System.Net;
using System.Globalization;
using System.Data.SqlClient;

namespace TulasiEducation
{
    public partial class Register : System.Web.UI.Page
    {
        dbFunctions objdbfunc = new dbFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // Prevent dropdown reset on postback
            {
                category();
                qualifcation();
                course();
                state();
            }
        }
        private void category()
        {
            DataTable dt = dbFunctions.GetDataTable("select * from tbllookupCategory", "tblcategory");
            DataRow[] rows = dt.Select("id = 1");
            if (rows.Length > 0)
            {
                dt.Rows.Remove(rows[0]);
            }
            ddlcategory.DataSource = dt;
            ddlcategory.DataTextField = "Category";
            ddlcategory.DataValueField = "id";
            ddlcategory.DataBind();
            ddlcategory.Items.Insert(0, new ListItem("-- Please Select --", "0"));
        }

        private void qualifcation()
        {
            DataTable dt = dbFunctions.GetDataTable("select * from tbllookupQualification", "tblqualification");
            ddlqualification.DataSource = dt;
            ddlqualification.DataTextField = "Qualification";
            ddlqualification.DataValueField = "Qualificationid";
            ddlqualification.DataBind();
            ddlqualification.Items.Insert(0, new ListItem("-- Please Select --", "0"));
        }
        private void course()
        {
            DataTable dt = dbFunctions.GetDataTable("select * from tbllookupcourses", "tblcourse");
            ddlcourse.DataSource = dt;
            ddlcourse.DataTextField = "course";
            ddlcourse.DataValueField = "CourseId";
            ddlcourse.DataBind();
            ddlcourse.Items.Insert(0, new ListItem("-- Please Select --", "0"));
        }

        private void state()
        {
            DataTable dt = dbFunctions.GetDataTable("select * from tbllookupstates", "tblcourse");
            ddlstate.DataSource = dt;
            ddlstate.DataTextField = "State";
            ddlstate.DataValueField = "Stateid";
            ddlstate.DataBind();
            ddlstate.Items.Insert(0, new ListItem("-- Please Select --", "0"));
        }
        protected void ddlExample_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlqualification_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnresgister_Click(object sender, EventArgs e)
        {
            string secvalue = ddlcategory.SelectedItem.Text;
            string qualvalue = ddlqualification.SelectedValue;
            string name = txtfirstname.Text;
            string phone = txtphone.Text;
            string username = "";
            string firstPart = name.Length >= 3 ? name.Substring(0, 3) : name;
            string lastPart = phone.Length >= 5 ? phone.Substring(phone.Length - 5) : phone;
            username = firstPart + lastPart;
            string password = GenerateRandomPassword(6);

            DataTable dt = new DataTable();
            dt = objdbfunc.Fun_Registration(Convert.ToInt32(ddlcategory.SelectedItem.Value), username, password, DateTime.Now.ToString(), txtfirstname.Text, txtlastname.Text, txtphone.Text, txtemail.Text, ddlgender.SelectedItem.Text, Convert.ToInt32(ddlqualification.SelectedValue), Convert.ToInt32(ddlcourse.SelectedValue), Convert.ToInt32(ddlstate.SelectedValue.ToString()), txttown.Text, txtaddress.Text,null,0, "Save");
            //SendEmail(txtemail.Text, "Test mail", "test body");
            Response.Redirect("index.aspx");
        }
        public static string GenerateRandomPassword(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            Random random = new Random();
            return new string(Enumerable.Repeat(chars, length)
                .Select(s => s[random.Next(s.Length)]).ToArray());
        }

        protected void ddlcategory_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        public static void SendEmail(string toEmail, string subject, string body)
        {
            string smtpServer = "smtp.gmail.com";
            int smtpPort = 587; // Use 465 for SSL if needed
            bool enableSsl = true;

            // Fetch credentials from environment variables
            string fromEmail = "ganeshgani1369@gmail.com";
            string fromPassword = "qtsm fdyu fmmm njoz";

            try
            {
                using (MailMessage message = new MailMessage(fromEmail, toEmail, subject, body))
                {
                    message.IsBodyHtml = true; // Set to true if sending HTML content

                    using (SmtpClient client = new SmtpClient(smtpServer, smtpPort))
                    {
                        client.EnableSsl = enableSsl;
                        client.DeliveryMethod = SmtpDeliveryMethod.Network;
                        client.UseDefaultCredentials = false;
                        client.Credentials = new NetworkCredential(fromEmail, fromPassword);

                       
                        client.Send(message);
                        Console.WriteLine("Email sent successfully!");
                    }
                }
            }
            catch (SmtpException smtpEx)
            {
                Console.WriteLine($"SMTP Error: {smtpEx.Message}");
            }
            catch (FormatException formatEx)
            {
                Console.WriteLine($"Invalid Email Format: {formatEx.Message}");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Unexpected Error: {ex.Message}");
            }
        }
    }
}