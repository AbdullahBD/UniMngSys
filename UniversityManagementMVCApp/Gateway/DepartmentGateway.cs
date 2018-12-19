using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityManagementMVCApp.Models;

namespace UniversityManagementMVCApp.Gateway
{
    public class DepartmentGateway: CommonGateway
    {
        public int SaveDepartment(Department aDepartment)
        {
            Query = "INSERT INTO Department VALUES('"+aDepartment.Code+"','"+aDepartment.Name+"')";

            Command=new SqlCommand(Query,Connection);

            Connection.Open();
            int rowAffected = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffected;
        }
        public bool IsCodeExist(string code)
        {
            Query = "SELECT * FROM Department WHERE Code = '" + code + "'";
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
            Query = "SELECT * FROM Department WHERE Name = '" + name + "'";
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
        public List<Department> GetAllDepartment()
        {
            Query = "SELECT * FROM Department ORDER BY Name ASC";
            Command = new SqlCommand(Query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Department> aList = new List<Department>();
            while (Reader.Read())
            {
                Department aDepartment = new Department()
                {
                    Id = Convert.ToInt32(Reader["Id"]),
                    Code = Reader["Code"].ToString(),
                    Name = Reader["Name"].ToString()
                };
                aList.Add(aDepartment);
            }
            Reader.Close();
            Connection.Close();
            return aList;
        }
    }
}