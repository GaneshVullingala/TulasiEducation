using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;


namespace TulasiEducation.Master
{
    public partial class StudentChat : System.Web.UI.Page
    {
        dbFunctions objdbfunctions = new dbFunctions();
        string conStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
        int studentID;
        protected void Page_Load(object sender, EventArgs e)
        {
            studentID = Convert.ToInt32(Session["StudentID"]);
            if (!IsPostBack)
            {
                BindTeachers();
                BindChatsGrid();
            }
        }

        void BindTeachers()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlDataAdapter da = new SqlDataAdapter("select firstname + ' - '  + Subject as teacher,TeacherID  from Qryteacherinfo", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                ddlTeacher.DataSource = dt;
                ddlTeacher.DataTextField = "teacher";
                ddlTeacher.DataValueField = "TeacherID";
                ddlTeacher.DataBind();
            }
        }

        void BindChatsGrid()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlDataAdapter da = new SqlDataAdapter(@"
                SELECT C.ChatID, T.fullname AS fullname,T.Subject, C.QueryType, C.CreatedDate 
                FROM ChatMaster C 
                INNER JOIN Qryteacherinfo T ON C.TeacherID = T.TeacherID
                WHERE C.StudentID = @StudentID", con);
                da.SelectCommand.Parameters.AddWithValue("@StudentID", Session["Studentid"].ToString());
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvChats.DataSource = dt;
                gvChats.DataBind();
            }
        }

        protected void btnStart_Click(object sender, EventArgs e)
        {
            int teacherID = Convert.ToInt32(ddlTeacher.SelectedValue);
            string queryType = ddlQueryType.SelectedValue;

            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand(@"
                INSERT INTO ChatMaster(StudentID, TeacherID, QueryType) 
                VALUES (@StudentID, @TeacherID, @QueryType);
                SELECT SCOPE_IDENTITY();", con);
                cmd.Parameters.AddWithValue("@StudentID", studentID);
                cmd.Parameters.AddWithValue("@TeacherID", teacherID);
                cmd.Parameters.AddWithValue("@QueryType", queryType);
                con.Open();
                int chatID = Convert.ToInt32(cmd.ExecuteScalar());
                ViewState["ChatID"] = chatID;
            }

            pnlChatPopup.Visible = true;
            LoadChat();
        }
        protected void btnSend_Click(object sender, EventArgs e)
        {
            int chatID = Convert.ToInt32(ViewState["ChatID"]);
            string messageText = txtMessage.Text.Trim();
            string filePath = null;

            if (fuDocument.HasFile)
            {
                string fileName = Path.GetFileName(fuDocument.PostedFile.FileName);
                filePath = "ChatFiles" + fileName;
                fuDocument.SaveAs(Server.MapPath(filePath));
            }

            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand(@"
                INSERT INTO ChatMessages(ChatID, SenderRole, MessageText, FilePath) 
                VALUES (@ChatID, 'Student', @MessageText, @FilePath)", con);
                cmd.Parameters.AddWithValue("@ChatID", chatID);
                cmd.Parameters.AddWithValue("@MessageText", messageText);
                cmd.Parameters.AddWithValue("@FilePath", (object)filePath ?? DBNull.Value);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            txtMessage.Text = "";
            LoadChat();

        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int chatID = Convert.ToInt32(btn.CommandArgument);
            ViewState["ChatID"] = chatID;
            DataTable dt = dbFunctions.GetDataTable("select * from ChatMaster where ChatID=" + chatID.ToString(), "tbldata");
            string teacherid = dt.Rows[0]["teacherid"].ToString();
            DataTable dt1 = dbFunctions.GetDataTable("select fullname,subject from Qryteacherinfo where teacherid =" + teacherid.ToString(), "sdata");
            lblteachername.Text = dt1.Rows[0]["fullname"].ToString();
            lblsubject.Text = dt1.Rows[0]["subject"].ToString();
            pnlChatPopup.Visible = true;
            LoadChat();
        }

        void LoadChat()
        {
            int chatID = Convert.ToInt32(ViewState["ChatID"]);
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlDataAdapter da = new SqlDataAdapter(@"
                SELECT * FROM ChatMessages 
                WHERE ChatID = @ChatID ORDER BY SentDate", con);
                da.SelectCommand.Parameters.AddWithValue("@ChatID", chatID);
                DataTable dt = new DataTable();
                da.Fill(dt);

                // Render chat to div using HTML string or Repeater (for clean binding)
                chatContainer.InnerHtml = "";
                foreach (DataRow row in dt.Rows)
                {
                    string role = row["SenderRole"].ToString();
                    string msg = row["MessageText"].ToString();
                    string file = row["FilePath"].ToString();
                    string floatStyle = role == "Student" ? "right" : "left";
                    string bgstylecolor = role == "Student" ? "#e3effd" : "#f5f5f5";

                    if (role == "Student")
                    {
                        chatContainer.InnerHtml += "<div style='display: flex;justify-content: flex-end;'>";
                    }

                    chatContainer.InnerHtml += $"<div style='text-align:{floatStyle}; margin:10px; padding:8px; background: {bgstylecolor}; border-radius:10px;max-width: max-content'>"
                       + msg;

                    if (!string.IsNullOrEmpty(file))
                    {
                        string fileName = Path.GetFileName(file);
                        chatContainer.InnerHtml += $"<br/><a href='{file}' target='_blank'>{fileName}</a>";
                    }
                    chatContainer.InnerHtml += "</div>";

                    if (role == "Student")
                    {
                        chatContainer.InnerHtml += "</div>";
                    }

                }
            }
        }


        protected void btnClose_Click(object sender, EventArgs e)
        {
            pnlChatPopup.Visible = false;
            ViewState["ChatID"] = null;
            BindChatsGrid();
        }
    }
}