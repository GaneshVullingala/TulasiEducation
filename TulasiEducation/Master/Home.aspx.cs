using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TulasiEducation.Master
{
    public partial class Home : System.Web.UI.Page
    {
        protected override void OnPreInit(EventArgs e)
        {
            if (Session["SecLevelID"] != null)
            {

            }
            else
            {
                Server.Transfer("../login.aspx");
            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            string studentcount = dbFunctions.GetFieldValue("select count(*) as count from tblstudentinfo", "count");
            lblstudentscount.Text = studentcount.ToString();

            string teachercount = dbFunctions.GetFieldValue("select count(*) as tcount from tblteacherinfo", "tcount");
            lblteachercount.Text = teachercount.ToString();
        }
    }
}