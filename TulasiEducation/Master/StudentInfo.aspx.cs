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
    public partial class StudentInfo : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
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
            DataTable dt = new DataTable();
            dt = objdbfunctions.Fun_Registration(0, null, null, null, null, null, null, null, null, 0, 0, 0, null, null,null,0, "Search");
            if (dt.Rows.Count > 0)
            {
                grv_list.DataSource = dt;
                grv_list.DataBind();
            }
            else
            {
                dt.Rows.Add(dt.NewRow());
                grv_list.DataSource = dt;
                grv_list.DataBind();
                grv_list.Rows[0].Visible = false;
            }
        }

      
        
        protected void grv_list_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GLList();
            grv_list.PageIndex = e.NewPageIndex;
            grv_list.DataBind();
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            dt = objdbfunctions.Fun_Registration(0, null, null, null, null, null, txt_search.Text, null, null, 0, 0, 0, null, null,null,0, "Searchbyphone");
            if (dt.Rows.Count > 0)
            {
                grv_list.DataSource = dt;
                grv_list.DataBind();
            }
            else
            {
                
                grv_list.DataSource = null;
                grv_list.DataBind();
                //grv_list.Rows[0].Visible = false;
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "myalert", "alert('No results found');", true);
                Response.Redirect("Studentinfo.aspx");
                return;
                
            }
            txt_search.Text = "";
        }

    }
}