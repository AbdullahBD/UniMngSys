using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityManagementMVCApp.Models;

namespace UniversityManagementMVCApp.Gateway
{
    public class DesignationGateway:CommonGateway
    {
        public List<Designation> GetAllDesignation()
        {
            Query = "SELECT * FROM Designation";
            Command = new SqlCommand(Query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Designation> aList = new List<Designation>();
            while (Reader.Read())
            {
                Designation aDesignation = new Designation()
                {
                    Id = Convert.ToInt32(Reader["Id"]),

                    DesignationName = Reader["DesignationName"].ToString()
                };
                aList.Add(aDesignation);
            }
            Reader.Close();
            Connection.Close();
            return aList;
        }
    }
}