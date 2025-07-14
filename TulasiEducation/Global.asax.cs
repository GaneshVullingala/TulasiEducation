﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI;


namespace TulasiEducation
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            ScriptResourceDefinition jqueryDef = new ScriptResourceDefinition
            {
                Path = "~/Scripts/jquery-3.7.1.min.js", // adjust path based on your jQuery file
                DebugPath = "~/Scripts/jquery-3.7.1.js",
                CdnPath = "https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.7.1.min.js",
                CdnDebugPath = "https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.7.1.js",
                CdnSupportsSecureConnection = true,
                LoadSuccessExpression = "window.jQuery"
            };

            ScriptManager.ScriptResourceMapping.AddDefinition("jquery", null, jqueryDef);

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}