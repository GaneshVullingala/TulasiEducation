using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Globalization;

namespace TulasiEducation.Master
{
    public partial class SMarks : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        dbFunctions objdbfunctions = new dbFunctions();

        protected override void OnPreInit(EventArgs e)
        {
            if (Session["SecLevelID"] == null)
            {
                Server.Transfer("../logout.aspx");
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GLList();
            }
        }

        private void GLList()
        {
            DataTable dt = dbFunctions.GetDataTable("select * from tblInternalMarks a inner join tblteacherinfo b on a.TeacherID=b.TeacherID where studentid="+Session["Studentid"].ToString(), "tblmarks");
            if (dt.Rows.Count > 0)
            {
                grv_list.DataSource = dt;
                grv_list.DataBind();
            }
            else
            {
                grv_list.DataSource = null;
                grv_list.DataBind();
            }
        }

        protected void grv_list_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GLList();
            grv_list.PageIndex = e.NewPageIndex;
            grv_list.DataBind();
        }
    }
}