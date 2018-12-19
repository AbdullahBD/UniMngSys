using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace UniversityManagementMVCApp.Controllers
{
    public class StudentController : Controller
    {
        //
        // GET: /RegisterStudent/
       
        public ActionResult Register()
        {
            return View();
        }
	}
}