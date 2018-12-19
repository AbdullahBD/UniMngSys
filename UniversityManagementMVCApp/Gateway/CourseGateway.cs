using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityManagementMVCApp.Models;

namespace UniversityManagementMVCApp.Gateway
{
    public class CourseGateway:CommonGateway
    {

        public int SaveCourse(Course aCourse)
        {
            Query = "INSERT INTO Course VALUES('" + aCourse.Code + "','" + aCourse.Name + "','"+aCourse.Credit+"','"+aCourse.Description+"','"+aCourse.DepartmentId+"','"+aCourse.SemesterId+"')";
            Command = new SqlCommand(Query, Connection);

            Connection.Open();
            int rowAffected = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffected;
        }
        public bool IsCodeExist(string code)
        {
            Query = "SELECT * FROM Course WHERE Code = '" + code + "'";

            Command = new SqlCommand(Query, Connection);

            Connection.Open();

            Reader = Command.ExecuteReader();

            bool hasRow = false;

            if (Reader.HasRows)
            {
                hasRow = true;
            }

            Reader.Close();
            Connection.Close();

            return hasRow;
        }
        public bool IsNameExist(string name)
        {
            Query = "SELECT * FROM Course WHERE Name = '" + name + "'";

            Command = new SqlCommand(Query, Connection);

            Connection.Open();

            Reader = Command.ExecuteReader();

            bool hasRow = false;

            if (Reader.HasRows)
            {
                hasRow = true;
            }

            Reader.Close();
            Connection.Close();

            return hasRow;
        }
        public List<Course> GetAllCourse()
        {
            Query = "SELECT * FROM Course ORDER BY Code ASC";
            Command = new SqlCommand(Query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Course> aList = new List<Course>();
            while (Reader.Read())
            {
                Course aCourse = new Course()
                {
                    Id = Convert.ToInt32(Reader["Id"]),
                    Code = Reader["Code"].ToString(),
                    Name = Reader["Name"].ToString(),

                    Credit = Convert.ToDouble(Reader["Credit"])
                };
                aList.Add(aCourse);
            }
            Reader.Close();
            Connection.Close();
            return aList;
        }
    }
}