using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Http;
using System.Web.Routing;
using System.Web.UI;

namespace Registration2
{
    public class WebApiApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };// Ignore SSL certificate validation (for local development only)
            GlobalConfiguration.Configure(WebApiConfig.Register);
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery", new ScriptResourceDefinition
            {
                Path = "https://code.jquery.com/jquery-3.6.0.min.js"
            });

        }
    }
}
