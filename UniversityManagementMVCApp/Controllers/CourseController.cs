using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementMVCApp.Manager;
using UniversityManagementMVCApp.Models;

namespace UniversityManagementMVCApp.Controllers
{
    public class CourseController : Controller
    {
        //
        // GET: /Course/
        CourseManager aCourseManager=new CourseManager();
        [HttpGet]
        public ActionResult Save()
        {
            List<Department> aDepartmentList = aCourseManager.GetAllDepartment();
            ViewBag.Department = aDepartmentList;

            List<Semester> aSemesterList = aCourseManager.GetAllSemester();
            ViewBag.Semester = aSemesterList;
            return View();
        }
        [HttpPost]
        public ActionResult Save(Course aCourse )
        {
            List<Department> aDepartmentList = aCourseManager.GetAllDepartment();
            ViewBag.Department = aDepartmentList;

            List<Semester> aSemesterList = aCourseManager.GetAllSemester();
            ViewBag.Semester = aSemesterList;

            ViewBag.message = aCourseManager.SaveCourse(aCourse);
            ViewBag.code = aCourse.Code;
            ViewBag.name = aCourse.Name;
            return View();
        }

	}
}