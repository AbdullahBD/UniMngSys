using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityManagementMVCApp.Models;

namespace UniversityManagementMVCApp.Gateway
{
    public class SemesterGateway:CommonGateway
    {
        public List<Semester> GetAllSemester()
        {
            Query = "SELECT * FROM Semester ORDER BY SemesterName ASC";
            Command = new SqlCommand(Query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Semester> aList = new List<Semester>();
            while (Reader.Read())
            {
                Semester aSemester = new Semester()
                {
                    Id = Convert.ToInt32(Reader["Id"]),
                    SemesterName = Reader["SemesterName"].ToString()
                };
                aList.Add(aSemester);
            }
            Reader.Close();
            Connection.Close();
            return aList;
        }
    }
}