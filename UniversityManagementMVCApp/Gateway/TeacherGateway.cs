using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityManagementMVCApp.Models;

namespace UniversityManagementMVCApp.Gateway
{
    public class TeacherGateway:CommonGateway
    {
        
        public int SaveTeacher(Teacher aTeacher)
        {
            Query = "INSERT INTO Teacher VALUES('" + aTeacher.Name + "','" + aTeacher.Address + "','" + aTeacher.Email + "','" + aTeacher.ContactNo + "','" + aTeacher.DesignationId + "','" + aTeacher.DepartmentId + "','" + aTeacher.CreditTaken + "','"+aTeacher.CreditTaken+"')";
            Command = new SqlCommand(Query, Connection);

            Connection.Open();
            int rowAffected = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffected;
        }
        public List<Teacher> GetAllTeacher()
        {
            Query = "SELECT * FROM Teacher ORDER BY Name ASC";
            Command = new SqlCommand(Query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Teacher> aList = new List<Teacher>();
            while (Reader.Read())
            {
                Teacher aTeacher = new Teacher()
                {
                    Id = Convert.ToInt32(Reader["Id"]),                   
                    Name = Reader["Name"].ToString(),
                    CreditTaken = Convert.ToDouble(Reader["CreditTaken"]),
                    RemainingCredit = Convert.ToDouble(Reader["RemainingCredit"])
                    
                };
                aList.Add(aTeacher);
            }
            Reader.Close();
            Connection.Close();
            return aList;
        }
        public bool IsEmailExist(string email)
        {
            Query = "SELECT * FROM Teacher WHERE Email = '" + email + "'";

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
    }
}