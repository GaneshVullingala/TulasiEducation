using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Configuration;
using System.Drawing;
using System.Reflection;
using System.Collections.Generic;

namespace TulasiEducation
{
    public class dbFunctions
    {
        private SqlConnection m_sqlCon;
        private SqlDataAdapter da;
        private DataSet ds = new DataSet();
        public dbFunctions()
        {
            
            m_sqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());
        }
        public DataTable Fun_Registration(int SecLevelid, string Username, string Password, string Createddate, string FirstName, string lastname, string phone, string email,string Gender, int Qualififcationid, int Courseid, int Stateid, string Town, string Address,string status,int Genid, string inMode)
        {
            DataTable dt = new DataTable();
            da = new SqlDataAdapter("Exec Generalinfo_P  '" + inMode + "'," + SecLevelid + ", '" + Username + "', '" + Password + "', '"+ Createddate + "', '" + FirstName + "', '" + lastname + "', '" + phone + "', '" + email + "','"+Gender+"', " + Qualififcationid + ", " + Courseid + ", " + Stateid + ", '" + Town + "', '" + Address + "','" + status + "',"+Genid+"",  m_sqlCon);
            ds.Clear();
            da.Fill(ds, "funreg");
            dt = ds.Tables["funreg"];
            return dt;
        }

        public static object ExecuteScalar(string query, SqlParameter[] parameters = null)
        {
            object result = null;
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    if (parameters != null)
                        cmd.Parameters.AddRange(parameters);

                    con.Open();
                    result = cmd.ExecuteScalar();
                }
            }
            return result;
        }

        public DataTable Fun_Teacher(int SecLevelid, string Username, string Password, string Createddate, string FirstName, string lastname, string phone, string email, string Gender, string Subject,int Stateid, string Town, string Address,string Status,int Genid, string inMode)
        {
            DataTable dt = new DataTable();
            da = new SqlDataAdapter("Exec TeacherInfo_P  '" + inMode + "', " + SecLevelid + ", '" + Username + "', '" + Password + "', '" + Createddate + "', '" + FirstName + "', '" + lastname + "', '" + phone + "', '" + email + "','" + Gender + "', '" + Subject + "', " + Stateid + ", '" + Town + "', '" + Address + "','"+ Status + "',"+Genid+"", m_sqlCon);
            ds.Clear();
            da.Fill(ds, "funtreg");
            dt = ds.Tables["funtreg"];
            return dt;
        }


        public static DataTable GetDataTable(string SQLString, string TableName)
        {

            SqlDataAdapter m_oDa;
            DataTable ds;


            if (TableName.Length > 0)
                ds = new DataTable(TableName);
            else
                ds = new DataTable();

            // Create Instance of Connection and Command Object
            SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());

            m_oDa = new SqlDataAdapter(SQLString, myConnection);

            // Open the database connection and execute the command
            myConnection.Open();

            m_oDa.Fill(ds);

            myConnection.Close();

            // Return the Data Table
            return ds;
        }
        public static void ExecuteQuery(string query, SqlParameter[] parameters)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString()))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddRange(parameters);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public static string GetFieldValue(string SqlString, string FieldName)
        {
            SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());
            try
            {
                SqlDataAdapter m_oDa;
                DataSet ds = new DataSet();
                m_oDa = new SqlDataAdapter(SqlString, myConnection);
                myConnection.Open();
                m_oDa.Fill(ds, "SqlData");
                if (ds.Tables["SqlData"].Rows.Count > 0)
                {
                    return ds.Tables["SqlData"].Rows[0][FieldName].ToString();
                }
                else
                {
                    return "-1";
                }

            }
            catch
            {
                return "-1";
            }
            finally
            {
                if (myConnection.State == ConnectionState.Open)
                    myConnection.Close();
            }
        }

    }
}