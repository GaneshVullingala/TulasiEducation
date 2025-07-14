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
    public partial class Notification : System.Web.UI.Page
    {
        protected override void OnPreInit(EventArgs e)
        {
            if (Session["SecLevelID"] != null)
            {
                if (Session["SecLevelID"].ToString() == "1")//admin
                {
                    Page.MasterPageFile = "~/Master/HomeMaster.master";
                }
                else if (Session["SecLevelID"].ToString() == "2")//teacher
                {
                    Page.MasterPageFile = "~/Master/TeacherMaster.Master";
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
                if (Session["SecLevelID"].ToString() == "1")
                {
                    divinputs.Visible = true;
                }
                else
                {
                    divinputs.Visible = false;
                }
                LoadNotifications();
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string query = "INSERT INTO tblNotifications (QryType, Statement) VALUES (@QryType, @Statement)";
            SqlParameter[] p = {
        new SqlParameter("@QryType", ddlQryType.SelectedValue),
        new SqlParameter("@Statement", txtStatement.Text.Trim())
    };
            dbFunctions.ExecuteQuery(query, p);

            txtStatement.Text = "";
            ddlQryType.SelectedIndex = 0;
            Response.Redirect("Notification.aspx");
            LoadNotifications();
        }

        private void LoadNotifications()
        {
            string query = "SELECT * FROM tblNotifications ORDER BY CreatedOn DESC";
            DataTable dt = dbFunctions.GetDataTable(query, "notif");
            rptNotifications.DataSource = dt;
            rptNotifications.DataBind();
        }

        public string GetTimeAgo(object createdOn)
        {
            DateTime posted = Convert.ToDateTime(createdOn);
            TimeSpan ts = DateTime.Now - posted;

            if (ts.TotalMinutes < 1)
                return "Just now";
            else if (ts.TotalMinutes < 60)
                return $"{Math.Floor(ts.TotalMinutes)} minutes ago";
            else if (ts.TotalHours < 24)
                return $"{Math.Floor(ts.TotalHours)} hours ago";
            else
                return $"{Math.Floor(ts.TotalDays)} days ago";
        }
    }
}