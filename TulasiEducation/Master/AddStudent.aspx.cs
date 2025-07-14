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

namespace TulasiEducation.Master
{
    public partial class AddStudent : System.Web.UI.Page
    {
        dbFunctions objdbfunc = new dbFunctions();

        protected override void OnPreInit(EventArgs e)
        {
            if (Session["SecLevelID"] != null)
            {
                if (Session["SecLevelID"].ToString() == "1")//admin
                {
                    Page.MasterPageFile = "~/Master/HomeMaster.master";
                }

                else//teacher
                {
                    Page.MasterPageFile = "~/Master/TeacherMaster.Master";
                }
            }
            else
            {
                Server.Transfer("../logout.aspx");
            }

        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // Prevent dropdown reset on postback
            {
                try
                {
                    qualifcation();
                    course();
                    state();

                    hdngenid.Value = Request.QueryString["Genid"].ToString();
                    DataTable dt = dbFunctions.GetDataTable("select * from Qrystudentinfo where genid="+hdngenid.Value.ToString(), "tblstudent");
                    txtfirstname.Text = dt.Rows[0]["Firstname"].ToString().Trim();
                    txtlastname.Text = dt.Rows[0]["Lastname"].ToString().Trim();
                    txtphone.Text = dt.Rows[0]["Phone"].ToString().Trim();
                    txtemail.Text = dt.Rows[0]["Email"].ToString().Trim();
                    ddlqualification.SelectedValue = dt.Rows[0]["Qualificationid"].ToString();
                    ddlgender.SelectedValue = dt.Rows[0]["Gender"].ToString();
                    ddlcourse.SelectedValue = dt.Rows[0]["Courseid"].ToString();
                    ddlstate.SelectedValue = dt.Rows[0]["Stateid"].ToString();
                    txttown.Text = dt.Rows[0]["Town"].ToString().Trim();
                    txtaddress.Text = dt.Rows[0]["Address"].ToString().Trim();
                    ddlstatus.SelectedValue = dt.Rows[0]["Status"].ToString();
                    btnresgister.Text = "Update";
                }
                catch
                {
                    hdngenid.Value = "";
                    qualifcation();
                    course();
                    state();
                }
               
            }
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
        protected void ddlgender_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlcategory_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnresgister_Click(object sender, EventArgs e)
        {
            int secvalue = 3;
            string qualvalue = ddlqualification.SelectedValue;
            string name = txtfirstname.Text;
            string phone = txtphone.Text;
            string username = "";
            string firstPart = name.Length >= 3 ? name.Substring(0, 3) : name;
            string lastPart = phone.Length >= 5 ? phone.Substring(phone.Length - 5) : phone;
            username = firstPart + lastPart;
            string password = GenerateRandomPassword(6);

            DataTable dt = new DataTable();
           //SendEmail(txtemail.Text, "Test mail", "test body");
            if (hdngenid.Value.Length > 0)
            {
                dt = objdbfunc.Fun_Registration(secvalue, null, null, DateTime.Now.ToString(), txtfirstname.Text, txtlastname.Text, txtphone.Text, txtemail.Text, ddlgender.SelectedItem.Text, Convert.ToInt32(ddlqualification.SelectedValue), Convert.ToInt32(ddlcourse.SelectedValue), Convert.ToInt32(ddlstate.SelectedValue.ToString()), txttown.Text, txtaddress.Text, ddlstatus.SelectedValue.ToString(), Convert.ToInt32(hdngenid.Value), "Update");
            }
            else
            {
                dt = objdbfunc.Fun_Registration(secvalue, username, password, DateTime.Now.ToString(), txtfirstname.Text, txtlastname.Text, txtphone.Text, txtemail.Text, ddlgender.SelectedItem.Text, Convert.ToInt32(ddlqualification.SelectedValue), Convert.ToInt32(ddlcourse.SelectedValue), Convert.ToInt32(ddlstate.SelectedValue.ToString()), txttown.Text, txtaddress.Text, ddlstatus.SelectedValue.ToString(),0, "Save");

            }
            ScriptManager.RegisterStartupScript(this, GetType(), "ShowMessage", "alert('Sudent Registration Completed Successfully');", true);
            Response.Redirect("Studentinfo.aspx");
            return;
            
        }

        public static string GenerateRandomPassword(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            Random random = new Random();
            return new string(Enumerable.Repeat(chars, length)
                .Select(s => s[random.Next(s.Length)]).ToArray());
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

        protected void txtphone_TextChanged(object sender, EventArgs e)
        {
            string strphone = txtphone.Text;
            DataTable dt = dbFunctions.GetDataTable("select * from tblcommunicationinfo where phone='" + strphone.ToString()+"'", "tempdt");
            if(dt.Rows.Count > 0)
            {
                txtphone.Text = "";
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowMessage", "alert('Phone number already exist');", true);
                return;
            }
        }

        protected void txtemail_TextChanged(object sender, EventArgs e)
        {
            string stremail = txtemail.Text;
            DataTable dt = dbFunctions.GetDataTable("select * from tblcommunicationinfo where email='" + stremail.ToString()+"'", "tempdt");
            if (dt.Rows.Count > 0)
            {
                txtemail.Text = "";
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowMessage", "alert('Email Id already exist');", true);
                return;
            }
        }

    }
}