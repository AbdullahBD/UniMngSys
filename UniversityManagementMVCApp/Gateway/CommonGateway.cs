﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace UniversityManagementMVCApp.Gateway
{
    public class CommonGateway
    {
        private string connectionString =
            WebConfigurationManager.ConnectionStrings["UniversityCourseAndResult"].ConnectionString;

        public SqlConnection Connection { get; set; }
        public SqlCommand Command { get; set; }
        public SqlDataReader Reader { get; set; }
        public string Query { get; set; }

        public CommonGateway()
        {
            Connection=new SqlConnection(connectionString);
            Command=new SqlCommand();
        }
    }
}