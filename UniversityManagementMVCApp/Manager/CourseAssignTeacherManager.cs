using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementMVCApp.Gateway;
using UniversityManagementMVCApp.Models;

namespace UniversityManagementMVCApp.Manager
{
    public class CourseAssignTeacherManager
    {
        DepartmentGateway aDepartmentGateway=new DepartmentGateway();
        TeacherGateway aTeacherGateway=new TeacherGateway();
        CourseGateway aCourseGateway=new CourseGateway();
        public List<Department> GetAllDepartment()
        {
            return aDepartmentGateway.GetAllDepartment();
        }

        public List<Teacher> GetAllTeachers()
        {
            return aTeacherGateway.GetAllTeacher();
        }

        public List<Course> GetAllCourses()
        {
            return aCourseGateway.GetAllCourse();
        }
    }
}