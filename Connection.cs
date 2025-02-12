using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace brensden
{
    public class Connection
    {
        public static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        }
    }
}