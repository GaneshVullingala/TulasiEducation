using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;

namespace TulasiEducation
{
    public partial class Login : System.Web.UI.Page
    {
        public string strUrlPath = "";
        //protected override void OnPreInit(EventArgs e)
        //{
        //    strUrlPath = ConfigurationManager.AppSettings["SSL"].ToString() + "://" + Request.Url.Authority.ToString();
        //    string sAppPath = Request.ApplicationPath.ToString();
        //    if (sAppPath != "" && sAppPath != "/")
        //        strUrlPath += sAppPath + "/";
        //    else
        //        strUrlPath += "/";
        //}

        protected void Page_Load(object sender, EventArgs e)
        {
            string name = "Ganesh";
            lblfullname.Text = name;
            
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            string strusername = txtusername.Text;
            string stpassword = txtpassword.Text;
            DataTable dt = dbFunctions.GetDataTable("select * from tblGeneralinfo where Username = '" + strusername + "'  and Password = '"+ stpassword + "'", "tbllogin");
            if(dt.Rows.Count > 0)
            {
                Session["Genid"] = dt.Rows[0]["Genid"].ToString();
                Session["UserName"] = dt.Rows[0]["UserName"].ToString();
                Session["SecLevelID"] = dt.Rows[0]["SecLevelID"].ToString();
                //if (dt.Rows[0]["SecLevelID"].ToString() != "1" || dt.Rows[0]["SecLevelID"].ToString() != "2")
                //{
                //    Session["Studentid"] = dt.Rows[0]["Studentid"].ToString();
                //}
                if (Session["SecLevelID"].ToString() == "1")//admin
                {
                    Response.Redirect("Master/Home.aspx");
                }
                if (Session["SecLevelID"].ToString() == "2")//teacher
                {
                    Response.Redirect("Master/THome.aspx");
                }
                else //student
                {
                    Response.Redirect("Master/SHome.aspx");
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowMessage", "alert('Please enter valid credentials');", true);
                return;
            }
        }
    }
}