using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TulasiEducation.Master
{
    public partial class StudentMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtname.Text = dbFunctions.GetFieldValue("select fullname from Qrystudentinfo where Genid=" + Session["Genid"].ToString(), "fullname");
        }
    }
}