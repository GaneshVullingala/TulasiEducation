using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;


namespace TulasiEducation.Master
{
    public partial class SAttendence : System.Web.UI.Page
    {
        private Dictionary<DateTime, string> attendanceData;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAttendanceData(); // Load sample data
            }
        }
        private void LoadAttendanceData()
        {
            attendanceData = new Dictionary<DateTime, string>();

            string studentId = Session["StudentID"] != null ? Session["StudentID"].ToString() : "";

            if (!string.IsNullOrEmpty(studentId))
            {
                string connStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString(); // Replace this
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string query = @"SELECT AttendenceDate, Status 
                                 FROM tblAttendenceInfo 
                                 WHERE StudentID = @StudentID";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@StudentID", studentId);

                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        DateTime date = Convert.ToDateTime(reader["AttendenceDate"]);
                        string status = reader["Status"].ToString();

                        if (!attendanceData.ContainsKey(date))
                        {
                            attendanceData.Add(date, status);
                        }
                    }
                }

                ViewState["AttendanceData"] = attendanceData;
            }
        }

        protected void calAttendance_DayRender(object sender, DayRenderEventArgs e)
        {
            if (ViewState["AttendanceData"] != null)
            {
                attendanceData = (Dictionary<DateTime, string>)ViewState["AttendanceData"];

                if (attendanceData.ContainsKey(e.Day.Date))
                {
                    string status = attendanceData[e.Day.Date];
                    Label lbl = new Label();
                    lbl.Text = e.Day.DayNumberText;

                    if (status == "Present")
                    {
                        lbl.CssClass = "present-day";
                    }
                    else if (status == "Absent")
                    {
                        lbl.CssClass = "absent-day";
                    }

                    e.Cell.Controls.Clear();
                    e.Cell.Controls.Add(lbl);
                }
            }

            // Highlight Sundays
            if (e.Day.Date.DayOfWeek == DayOfWeek.Sunday)
            {
                e.Cell.BackColor = System.Drawing.Color.Yellow;
            }
        }
    }
}