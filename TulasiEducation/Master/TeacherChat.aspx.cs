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
    public partial class TeacherChat : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
        int teacherID;
        protected override void OnPreInit(EventArgs e)
        {
            if (Session["SecLevelID"] == null)
            {
               Server.Transfer("../logout.aspx");
            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            teacherID = Convert.ToInt32(Session["TeacherID"]);

            if (!IsPostBack)
            {
                BindStudentChats();
            }
        }

        void BindStudentChats()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlDataAdapter da = new SqlDataAdapter(@"
                SELECT C.ChatID, S.Fullname AS StudentName,S.Qualification , C.QueryType, C.CreatedDate 
                FROM ChatMaster C 
                INNER JOIN Qrystudentinfo S ON C.StudentID = S.StudentID
                WHERE C.TeacherID = @TeacherID", con);
                da.SelectCommand.Parameters.AddWithValue("@TeacherID", Session["Teacherid"].ToString());
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    gvStudentChats.DataSource = dt;
                    gvStudentChats.DataBind();
                }
                else
                {
                    gvStudentChats.DataSource = null ;
                    gvStudentChats.DataBind();
                }
                
            }
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int chatID = Convert.ToInt32(btn.CommandArgument);
            ViewState["ChatID"] = chatID;
            DataTable dt = dbFunctions.GetDataTable("select * from ChatMaster where ChatID=" + chatID.ToString(), "tbldata");
            string studentid = dt.Rows[0]["studentid"].ToString();
            DataTable dt1 = dbFunctions.GetDataTable("select a.FullName, b.Qualification from Qrystudentinfo a inner join tbllookupqualification b on a.QualificationId = b.QualificationId where a.StudentID ="+ studentid.ToString(), "sdata");
            lblstudentname.Text = dt1.Rows[0]["FullName"].ToString();
            lblstudentclass.Text = dt1.Rows[0]["Qualification"].ToString();
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

                chatContainer.InnerHtml = "";
                foreach (DataRow row in dt.Rows)
                {
                    string role = row["SenderRole"].ToString();
                    string msg = row["MessageText"].ToString();
                    string file = row["FilePath"].ToString();
                    string floatStyle = role == "Teacher" ? "right" : "left";
                    string bgstylecolor = role == "Teacher" ? "#e3effd" : "#f5f5f5";
                    
                    if(role== "Teacher")
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

                    if (role == "Teacher")
                    {
                        chatContainer.InnerHtml += "</div>";
                    }
                }
            }
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
                VALUES (@ChatID, 'Teacher', @MessageText, @FilePath)", con);
                cmd.Parameters.AddWithValue("@ChatID", chatID);
                cmd.Parameters.AddWithValue("@MessageText", messageText);
                cmd.Parameters.AddWithValue("@FilePath", (object)filePath ?? DBNull.Value);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            txtMessage.Text = "";
            LoadChat();
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            pnlChatPopup.Visible = false;
            ViewState["ChatID"] = null;
            BindStudentChats();
        }
    }
}