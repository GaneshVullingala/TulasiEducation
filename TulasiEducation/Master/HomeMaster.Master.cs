using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TulasiEducation.Master
{
    public partial class HomeMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void tbnlogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("../login.aspx");
        }
    }
}