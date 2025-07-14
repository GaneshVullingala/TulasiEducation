using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Net.Mail;
using System.Net;
using System.Globalization;
using System.Data.SqlClient;

namespace TulasiEducation.Master
{
    public partial class TimeTable : System.Web.UI.Page
    {
        dbFunctions objdbfunctions = new dbFunctions();
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadClass();
                BindTimeTable();
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

        private void BindTimeTable()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Week");

            string[] days = { "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" };
            foreach (string day in days)
            {
                dt.Rows.Add(day);
            }

            gvTimeTable.DataSource = dt;
            gvTimeTable.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string startDate = txtStartDate.Text.Trim();
            string endDate = txtEndDate.Text.Trim();
            DateTime now = DateTime.Now;

            // Updated timeslots including "Lunch"
            string[] timeSlots = { "9-10", "10-11", "11-12", "12-13", "Lunch", "2-3", "3-4", "4-5", "5-6" };

            foreach (GridViewRow row in gvTimeTable.Rows)
            {
                string dayOfWeek = row.Cells[0].Text;

                for (int i = 0; i < timeSlots.Length; i++)
                {
                    string timeSlot = timeSlots[i];

                    if (timeSlot == "Lunch")
                    {
                        // Save lunch row with fixed data (no teacher)
                        string query = @"INSERT INTO tblFirstYearTimeTable 
                                 (Fromdate, Todate, DayOfWeek, TimeSlot, TeacherID, CreatedOn)
                                 VALUES 
                                 (@Fromdate, @Todate, @DayOfWeek, @TimeSlot, @TeacherID, @CreatedOn)";

                        SqlParameter[] lunchParams = new SqlParameter[]
                        {
                    new SqlParameter("@Fromdate", startDate),
                    new SqlParameter("@Todate", endDate),
                    new SqlParameter("@DayOfWeek", dayOfWeek),
                    new SqlParameter("@TimeSlot", "Lunch"),
                    new SqlParameter("@TeacherID", DBNull.Value), // or use new SqlParameter("@TeacherID", 0)
                    new SqlParameter("@CreatedOn", now)
                        };

                        dbFunctions.ExecuteQuery(query, lunchParams);
                    }
                    else
                    {
                        DropDownList ddl = (DropDownList)row.FindControl("ddlPeriod" + (i + 1));
                        if (ddl != null && !string.IsNullOrEmpty(ddl.SelectedValue))
                        {
                            string query = @"INSERT INTO tblFirstYearTimeTable 
                                     (Fromdate, Todate, DayOfWeek, TimeSlot, TeacherID, CreatedOn)
                                     VALUES 
                                     (@Fromdate, @Todate, @DayOfWeek, @TimeSlot, @TeacherID, @CreatedOn)";

                            SqlParameter[] p = new SqlParameter[]
                            {
                        new SqlParameter("@Fromdate", startDate),
                        new SqlParameter("@Todate", endDate),
                        new SqlParameter("@DayOfWeek", dayOfWeek),
                        new SqlParameter("@TimeSlot", timeSlot),
                        new SqlParameter("@TeacherID", Convert.ToInt32(ddl.SelectedValue)),
                        new SqlParameter("@CreatedOn", now)
                            };

                            dbFunctions.ExecuteQuery(query, p);
                        }
                    }
                }
            }
        }


        protected void gvTimeTable_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                for (int i = 1; i <= 8; i++)
                {
                    DropDownList ddl = (DropDownList)e.Row.FindControl("ddlPeriod" + i);
                    if (ddl != null)
                    {
                        DataTable dt = dbFunctions.GetDataTable("select firstname + ' - '  + Subject as teacher,TeacherID  from Qryteacherinfo", "tblteacher");
                        ddl.DataSource = dt;
                        ddl.DataTextField = "teacher";
                        ddl.DataValueField = "TeacherID";
                        ddl.DataBind();
                        ddl.Items.Insert(0, new ListItem("--Select--", ""));

                        // Assign time slot to attribute
                        ddl.Attributes["TimeSlot"] = GetTimeSlotByIndex(i); // ex: 1 = "9-10", 2 = "10-11", ...
                    }
                }
            }
        }

        private string GetTimeSlotByIndex(int index)
        {
            string[] slots = { "9-10", "10-11", "11-12", "12-13", "Lunch", "2-3", "3-4", "4-5", "5-6" };
            return slots[index - 1];
        }

    }
}