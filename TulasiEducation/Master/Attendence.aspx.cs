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
    public partial class Attendence : System.Web.UI.Page
    {
        dbFunctions objdbfunctions = new dbFunctions();

        protected override void OnPreInit(EventArgs e)
        {
            if (Session["SecLevelID"] != null)
            {
                if (Session["SecLevelID"].ToString() == "1")//admin
                {
                    Page.MasterPageFile = "~/Master/HomeMaster.master";
                }

                else//teacher
                {
                    Page.MasterPageFile = "~/Master/TeacherMaster.Master";
                }
            }
            else
            {
                Server.Transfer("../login.aspx");
            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindClassDropdown();
                rptAttendanceChunks.ItemDataBound += rptAttendanceChunks_ItemDataBound;
                DataTable dtStudents = dbFunctions.GetDataTable("SELECT StudentId, fullname FROM Qrystudentinfo", "tblstudent");
                DataTable dt = dtStudents; // your actual data from DB

                List<DataTable> chunks = new List<DataTable>();
                for (int i = 0; i < dt.Rows.Count; i += 10)
                {
                    DataTable chunk = dt.Clone();
                    for (int j = i; j < i + 10 && j < dt.Rows.Count; j++)
                        chunk.ImportRow(dt.Rows[j]);
                    chunks.Add(chunk);
                }

                rptAttendanceChunks.DataSource = chunks;
                rptAttendanceChunks.DataBind();
            }
            
        }
        private void BindClassDropdown()
        {
            string query = "select * from tbllookupqualification"; // adjust based on your table
            ddlclass.DataSource = dbFunctions.GetDataTable(query, "ddlqua");
            ddlclass.DataTextField = "Qualification";
            ddlclass.DataValueField = "Qualificationid";
            ddlclass.DataBind();
            ddlclass.Items.Insert(0, new ListItem("Please Select", ""));

        }

        protected void rptAttendanceChunks_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            GridView gv = (GridView)e.Item.FindControl("gvChunk");
            DataTable dt = (DataTable)e.Item.DataItem;
            gv.DataSource = dt;
            gv.DataBind();
        }
    }

    private void BindAttendanceGrid()
        {
            DataTable dtStudents = dbFunctions.GetDataTable("SELECT StudentId, firstname FROM tblStudentInfo","tblstudent");

            // Split into chunks of 10
            List<DataTable> chunks = new List<DataTable>();
            for (int i = 0; i < dtStudents.Rows.Count; i += 10)
            {
                DataTable chunk = dtStudents.Clone();
                for (int j = i; j < i + 10 && j < dtStudents.Rows.Count; j++)
                    chunk.ImportRow(dtStudents.Rows[j]);
                chunks.Add(chunk);
            }

            rptAttendanceChunks.DataSource = chunks;
            rptAttendanceChunks.DataBind();
        }



        protected void btnSave_Click(object sender, EventArgs e)
        {
            string teacher = Session["GenID"]?.ToString();
            DateTime attendDate = Convert.ToDateTime(txtdate.Text.Trim());
            DateTime now = DateTime.Now;

            foreach (RepeaterItem item in rptAttendanceChunks.Items)
            {
                GridView gv = (GridView)item.FindControl("gvChunk");

                foreach (GridViewRow row in gv.Rows)
                {
                    string studentId = ((HiddenField)row.FindControl("hdnStudentId")).Value;
                    bool isPresent = ((CheckBox)row.FindControl("chkPresent")).Checked;
                    bool isAbsent = ((CheckBox)row.FindControl("chkAbsent")).Checked;
                    string genid = dbFunctions.GetFieldValue("select genid from tblstudentinfo where studentid="+studentId, "genid");
                    string status = isPresent ? "Present" : isAbsent ? "Absent" : "NA";

                    if (status != "NA")
                    {
                        SqlParameter[] p = new SqlParameter[]
                        {
                    new SqlParameter("@Genid", genid),
                    new SqlParameter("@StudentId", studentId),
                    new SqlParameter("@AttendenceDate", attendDate),
                    new SqlParameter("@Teacher", teacher),
                    new SqlParameter("@Createdon", now),
                    new SqlParameter("@Status", status)
                        };

                        string query = @"INSERT INTO tblAttendenceInfo 
                                 (Genid, StudentId, AttendenceDate, Teacher, Createdon, Status) 
                                 VALUES 
                                 (@Genid, @StudentId, @AttendenceDate, @Teacher, @Createdon, @Status)";
                        dbFunctions.ExecuteQuery(query, p);
                    }
                }
            }

            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Attendance saved successfully');", true);
            Response.Redirect("Attendence.aspx");
        }

        protected void btnview_Click(object sender, EventArgs e)
        {

        }

        protected void ddlclass_SelectedIndexChanged(object sender, EventArgs e)
        {
            rptAttendanceChunks.ItemDataBound += rptAttendanceChunks_ItemDataBound;
            DataTable dtStudents = dbFunctions.GetDataTable("SELECT StudentId, firstname + ' ' + lastname as fullname FROM tblstudentinfo where Qualificationid=" + ddlclass.SelectedValue.ToString(), "tblstudent");
            DataTable dt = dtStudents; // your actual data from DB

            List<DataTable> chunks = new List<DataTable>();
            for (int i = 0; i < dt.Rows.Count; i += 10)
            {
                DataTable chunk = dt.Clone();
                for (int j = i; j < i + 10 && j < dt.Rows.Count; j++)
                    chunk.ImportRow(dt.Rows[j]);
                chunks.Add(chunk);
            }

            rptAttendanceChunks.DataSource = chunks;
            rptAttendanceChunks.DataBind();
        }
    }
}