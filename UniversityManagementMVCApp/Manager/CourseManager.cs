using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementMVCApp.Gateway;
using UniversityManagementMVCApp.Models;

namespace UniversityManagementMVCApp.Manager
{
    
    public class CourseManager
    {
        CourseGateway aCourseGateway=new CourseGateway();
        DepartmentGateway aDepartmentGateway=new DepartmentGateway();
        SemesterGateway aSemesterGateway=new SemesterGateway();

        public List<Department> GetAllDepartment()
        {
            return aDepartmentGateway.GetAllDepartment();
        }
        public List<Semester> GetAllSemester()
        {
            return aSemesterGateway.GetAllSemester();
        }

        public string SaveCourse(Course aCourse)
        {
            if (aCourseGateway.IsCodeExist(aCourse.Code))
            {
                return "Code exists";
            }
            if ((aCourseGateway.IsNameExist(aCourse.Name)))
            {
                return "Name exists";
            }
            
            if (aCourseGateway.SaveCourse(aCourse) > 0)
            {
                return "Saved";
            }
            else
            {
                return "Not saved";
            }
            
            
        }
    }
}