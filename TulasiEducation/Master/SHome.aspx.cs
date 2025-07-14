using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TulasiEducation.Master
{
    public partial class SHome : System.Web.UI.Page
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
            Session["Studentid"] = dbFunctions.GetFieldValue("select studentid from tblstudentinfo where genid=" + Session["genid"].ToString(), "studentid");
            lblname.Text = dbFunctions.GetFieldValue("select fullname from Qrystudentinfo where genid="+Session["Genid"].ToString(), "fullname");
        }
    }
}