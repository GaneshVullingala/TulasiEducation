using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TulasiEducation.Master
{
    public partial class TeacherMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            txtname.Text = dbFunctions.GetFieldValue("select fullname from Qryteacherinfo where genid=" + Session["genid"].ToString(), "fullname");
        }
    }
}