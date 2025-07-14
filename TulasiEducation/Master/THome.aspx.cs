using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TulasiEducation.Master
{
    public partial class THome : System.Web.UI.Page
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
            Session["Teacherid"] = dbFunctions.GetFieldValue("select teacherid from tblteacherinfo where genid=" + Session["genid"].ToString(), "teacherid");
            txtname.Text = dbFunctions.GetFieldValue("select fullname from Qryteacherinfo where genid="+Session["genid"].ToString(), "fullname");
        }
    }
}