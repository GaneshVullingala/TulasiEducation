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
    public partial class ClassActivity : System.Web.UI.Page
    {
        dbFunctions objdbfunctions = new dbFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindClassDropdown();
                LoadActivities();
            }
        }
        private void BindClassDropdown()
        {
            string query = "select * from tbllookupqualification"; // adjust based on your table
            ddlClass.DataSource = dbFunctions.GetDataTable(query,"ddlqua");
            ddlClass.DataTextField = "Qualification";
            ddlClass.DataValueField = "Qualificationid";
            ddlClass.DataBind();
            ddlClass.Items.Insert(0, new ListItem("Please Select", ""));
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int teacherId = Convert.ToInt32(Session["GenID"]);
            string date = txtDate.Text.Trim();
            string classId = ddlClass.SelectedValue;
            string description = txtDescription.Text.Trim();
            DateTime now = DateTime.Now;

            if (lblActivityId.Text != "")
            {
                // Update existing activity
                string query = @"UPDATE tblClassActivity SET 
                         ActivityDate = @ActivityDate, 
                         ClassID = @ClassID, 
                         Description = @Description
                         WHERE ActivityID = @ActivityID";

                SqlParameter[] p = {
            new SqlParameter("@ActivityDate", date),
            new SqlParameter("@ClassID", classId),
            new SqlParameter("@Description", description),
            new SqlParameter("@ActivityID", lblActivityId.Text)
        };

                dbFunctions.ExecuteQuery(query, p);
                lblActivityId.Text = "";
            }
            else
            {
                // Insert new activity
                string query = @"INSERT INTO tblClassActivity 
                         (TeacherID, ActivityDate, ClassID, Description, CreatedOn)
                         VALUES 
                         (@TeacherID, @ActivityDate, @ClassID, @Description, @CreatedOn)";

                SqlParameter[] p = {
            new SqlParameter("@TeacherID", teacherId),
            new SqlParameter("@ActivityDate", date),
            new SqlParameter("@ClassID", classId),
            new SqlParameter("@Description", description),
            new SqlParameter("@CreatedOn", now)
        };

                dbFunctions.ExecuteQuery(query, p);
            }

            ClearForm();
            LoadActivities();
            Response.Redirect(Request.RawUrl);
        }

        protected void gvActivities_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditActivity")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                string query = "SELECT * FROM tblClassActivity WHERE ActivityID ="+id;
                SqlParameter[] p = { new SqlParameter("@ActivityID", id) };
                DataTable dt = dbFunctions.GetDataTable(query, "tblactivity");

                if (dt.Rows.Count > 0)
                {
                    lblActivityId.Text = dt.Rows[0]["ActivityID"].ToString();
                    txtDate.Text = Convert.ToDateTime(dt.Rows[0]["ActivityDate"]).ToString("yyyy-MM-dd");
                    ddlClass.SelectedValue = dt.Rows[0]["ClassID"].ToString();
                    txtDescription.Text = dt.Rows[0]["Description"].ToString();
                }
            }
        }

        private void ClearForm()
        {
            txtDate.Text = "";
            txtDescription.Text = "";
            ddlClass.SelectedIndex = 0;
            lblActivityId.Text = "";
        }
        private void LoadActivities()
        {
            int teacherId = Convert.ToInt32(Session["GenID"]);
            string query = "SELECT * FROM tblClassActivity a inner join tbllookupqualification b on a.ClassID=b.QualificationId WHERE a.TeacherID = " + Session["Teacherid"].ToString()+" ORDER BY ActivityDate DESC";
            SqlParameter[] p = { new SqlParameter("@TeacherID", teacherId) };
            DataTable dt = dbFunctions.GetDataTable(query, "temptable");
            gvActivities.DataSource = dt;
            gvActivities.DataBind();
        }

        protected void gvActivities_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }
    }
}