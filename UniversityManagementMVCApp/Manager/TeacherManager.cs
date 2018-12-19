using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementMVCApp.Gateway;
using UniversityManagementMVCApp.Models;

namespace UniversityManagementMVCApp.Manager
{
    public class TeacherManager
    {
        TeacherGateway aTeacherGateway=new TeacherGateway();
        DepartmentGateway aDepartmentGateway=new DepartmentGateway();
        DesignationGateway aDesignationGateway=new DesignationGateway();


        public List<Designation> GetAllDesignation()
        {
            return aDesignationGateway.GetAllDesignation();
        }

        public List<Department> GetAllDepartment()
        {
            return aDepartmentGateway.GetAllDepartment();
        }

        public string SaveTeacher(Teacher aTeacher )
        {
            if (aTeacherGateway.IsEmailExist(aTeacher.Email))
            {
                return "Email exists";
            }
            if (aTeacherGateway.SaveTeacher(aTeacher) > 0)
            {
                return "Saved";
            }
            else
            {
                return "Not saved";
            }
        }

        public List<Teacher> GetAllTeacher()
        {
            return aTeacherGateway.GetAllTeacher();
        }
    }
}