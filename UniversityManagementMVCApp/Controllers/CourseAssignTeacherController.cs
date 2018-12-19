using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementMVCApp.Manager;
using UniversityManagementMVCApp.Models;

namespace UniversityManagementMVCApp.Controllers
{
    public class CourseAssignTeacherController : Controller
    {
        //
        // GET: /CourseAssignTeacher/
        CourseAssignTeacherManager aCourseAssignTeacher=new CourseAssignTeacherManager();
        public ActionResult Assign()
        {
            List<Department> aDepartmentList = aCourseAssignTeacher.GetAllDepartment();
            ViewBag.department = aDepartmentList;

            List<Teacher> aTeachersList = aCourseAssignTeacher.GetAllTeachers();
            ViewBag.teacher = aTeachersList;

            List<Course> aCourseList = aCourseAssignTeacher.GetAllCourses();
            ViewBag.course = aCourseList;
            return View();
        }
	}
}