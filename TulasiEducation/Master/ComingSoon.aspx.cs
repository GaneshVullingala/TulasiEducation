using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TulasiEducation.Master
{
    public partial class ComingSoon : System.Web.UI.Page
    {
        protected override void OnPreInit(EventArgs e)
        {
            if (Session["SecLevelID"] != null)
            {
                if (Session["SecLevelID"].ToString() == "1")//admin
                {
                    Page.MasterPageFile = "~/Master/HomeMaster.master";
                }

                else if(Session["SecLevelID"].ToString() == "2")//teacher
                {
                    Page.MasterPageFile = "~/Master/TeacherMaster.Master";
                }
                else
                {
                    Page.MasterPageFile = "~/Master/StudentMaster.Master";
                }
            }
            else
            {
                Server.Transfer("../logout.aspx");
            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}