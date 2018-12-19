using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementMVCApp.Manager;
using UniversityManagementMVCApp.Models;

namespace UniversityManagementMVCApp.Controllers
{
    public class TeacherController : Controller
    {
        //
        // GET: /Teacher/
       TeacherManager aTeacherManager=new TeacherManager();
        [HttpGet]
        public ActionResult Save()
        {
            List<Designation> aListDesignation = aTeacherManager.GetAllDesignation();
            ViewBag.Designation = aListDesignation;

            List<Department> aListDepartment = aTeacherManager.GetAllDepartment();
            ViewBag.Department = aListDepartment;
            return View();
        }
        [HttpPost]
        public ActionResult Save(Teacher aTeacher)
        {
            List<Designation> aListDesignation = aTeacherManager.GetAllDesignation();
            ViewBag.Designation = aListDesignation;

            List<Department> aListDepartment = aTeacherManager.GetAllDepartment();
            ViewBag.Department = aListDepartment;

            ViewBag.message = aTeacherManager.SaveTeacher(aTeacher);
            ViewBag.email = aTeacher.Email;
            return View();
        }
	}
}