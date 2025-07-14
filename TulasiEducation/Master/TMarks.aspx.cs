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
    public partial class TMarks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadClass();
                LoadGrid();
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
        protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            string classid = ddlClass.SelectedValue.ToString();
            string query = "SELECT StudentID, FullName FROM Qrystudentinfo WHERE Qualificationid ="+ classid.ToString();
            SqlParameter[] p = { new SqlParameter("@ClassID", ddlClass.SelectedValue) };
            ddlStudent.DataSource = dbFunctions.GetDataTable(query, "tempclass");
            ddlStudent.DataTextField = "FullName";
            ddlStudent.DataValueField = "StudentID";
            ddlStudent.DataBind();
            ddlStudent.Items.Insert(0, new ListItem("--Select--", ""));
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int teacherId = Convert.ToInt32(Session["GenID"]);
            int classId = Convert.ToInt32(ddlClass.SelectedValue);
            int studentId = Convert.ToInt32(ddlStudent.SelectedValue);
            string examType = ddlExamType.SelectedValue;
            int totalMarks = Convert.ToInt32(txtTotal.Text.Trim());
            int obtainedMarks = Convert.ToInt32(txtObtained.Text.Trim());
            string subject = ddlsubject.SelectedValue.ToString();
            DateTime createdOn = DateTime.Now;

            string query = @"INSERT INTO tblInternalMarks 
                     (TeacherID, StudentID, ClassID, ExamType, TotalMarks, ObtainedMarks, CreatedDate, Subject)
                     VALUES 
                     (@TeacherID, @StudentID, @ClassID, @ExamType, @TotalMarks, @ObtainedMarks, @CreatedDate, @Subject)";

            SqlParameter[] p = {
        new SqlParameter("@TeacherID", teacherId),
        new SqlParameter("@StudentID", studentId),
        new SqlParameter("@ClassID", classId),
        new SqlParameter("@ExamType", examType),
        new SqlParameter("@TotalMarks", totalMarks),
        new SqlParameter("@ObtainedMarks", obtainedMarks),
        new SqlParameter("@CreatedDate", createdOn),
        new SqlParameter("@Subject", subject)
    };

            dbFunctions.ExecuteQuery(query, p);

            // Clear form
            ddlClass.SelectedIndex = 0;
            ddlStudent.Items.Clear();
            ddlExamType.SelectedIndex = 0;
            txtTotal.Text = "";
            txtObtained.Text = "";
            Response.Redirect("TMarks.aspx");
            LoadGrid();
        }

        private void LoadGrid()
        {
            int teacherId = Convert.ToInt32(Session["GenID"]);
            string query = @"SELECT m.MarksID, q.Qualification AS Class, s.Firstname + ' ' + s.Lastname AS Student, 
                            m.ExamType, m.TotalMarks, m.ObtainedMarks, m.CreatedDate, m.subject
                     FROM tblInternalMarks m
                     INNER JOIN tbllookupqualification q ON m.ClassID = q.QualificationID
                     INNER JOIN tblstudentinfo s ON m.StudentID = s.StudentID WHERE m.TeacherID = "+Session["Genid"].ToString()+" ORDER BY m.CreatedDate DESC";

            SqlParameter[] p = { new SqlParameter("@TeacherID", teacherId) };
            DataTable dt = dbFunctions.GetDataTable(query, "tempdt");
            gvMarks.DataSource = dt;
            gvMarks.DataBind();
        }

    }
}