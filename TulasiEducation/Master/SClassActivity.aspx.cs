using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace TulasiEducation.Master
{
    public partial class SClassActivity : System.Web.UI.Page
    {
        protected override void OnPreInit(EventArgs e)
        {
            if (Session["SecLevelID"] != null)
            {
                if (Session["SecLevelID"].ToString() == "1")//admin
                {
                    Page.MasterPageFile = "~/Master/HomeMaster.master";
                }
                else//student
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
            if (!IsPostBack)
            {
                LoadClass();
                DataTable dt = dbFunctions.GetDataTable("select a.ActivityDate as 'Class Date',b.FirstName+' '+b.LastName as 'Teacher Name',c.Qualification as 'Class', a.Description as 'Concepts' from tblClassActivity a inner join tblteacherinfo b on a.TeacherID=b.TeacherID inner join tbllookupqualification c on a.ClassId = c.QualificationId", "tblactivity");
                LoadGrid(dt);
            }
        }
        private void LoadClass()
        {
            string query = "SELECT QualificationID, Qualification FROM tbllookupqualification";
            ddlClass.DataSource = dbFunctions.GetDataTable(query, "ddlclass");
            ddlClass.DataTextField = "Qualification";
            ddlClass.DataValueField = "QualificationID";
            ddlClass.DataBind();
            ddlClass.Items.Insert(0, new ListItem("--Select--", ""));
        }
        private void LoadGrid(DataTable dt)
        {
            gvMarks.DataSource = dt;
            gvMarks.DataBind();
        }

        protected void btnseearch_Click(object sender, EventArgs e)
        {
            string input = txtdate.Text.Trim();
            //DataTable dt = dbFunctions.GetDataTable("select * from tblClassActivity where ClassID="+ddlClass.SelectedValue.ToString()+" and CAST(ActivityDate AS DATE)='"+input+"'", "tempdt");
            DataTable dt = dbFunctions.GetDataTable("select a.ActivityDate as 'Class Date',b.FirstName+' '+b.LastName as 'Teacher Name',c.Qualification as 'Class', a.Description as 'Concepts' from tblClassActivity a inner join tblteacherinfo b on a.TeacherID=b.TeacherID inner join tbllookupqualification c on a.ClassId = c.QualificationId where a.ClassID =" + ddlClass.SelectedValue.ToString() + " and CAST(a.ActivityDate AS DATE)='" + input + "'", "tempdt");
            LoadGrid(dt);
        }

        protected void btnrefresh_Click(object sender, EventArgs e)
        {
            ddlClass.SelectedValue = "";
            txtdate.Text = "";
            Response.Redirect("SclassActivity.aspx");
        }
    }
}