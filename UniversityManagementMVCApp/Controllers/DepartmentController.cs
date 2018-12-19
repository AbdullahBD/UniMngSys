using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementMVCApp.Manager;
using UniversityManagementMVCApp.Models;

namespace UniversityManagementMVCApp.Controllers
{
    public class DepartmentController : Controller
    {
        //
        // GET: /Department/
        DepartmentManager aDepartmentManager=new DepartmentManager();
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(Department aDepartment)
        {
            ViewBag.message = aDepartmentManager.SaveDepartment(aDepartment);
            ViewBag.code = aDepartment.Code;
            ViewBag.name = aDepartment.Name;

            return View();
        }

        public ActionResult ShowDepartment()
        {
            List<Department> aDepartment = aDepartmentManager.GetAllDepartment();
            ViewBag.departments = aDepartment;
            return View();
        }
	}
}