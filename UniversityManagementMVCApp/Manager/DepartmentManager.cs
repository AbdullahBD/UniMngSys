using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementMVCApp.Gateway;
using UniversityManagementMVCApp.Models;

namespace UniversityManagementMVCApp.Manager
{
    public class DepartmentManager
    {
        DepartmentGateway aDepartmentGateway=new DepartmentGateway();

        public string SaveDepartment(Department aDepartment)
        {
            if (aDepartmentGateway.IsCodeExist(aDepartment.Code))
            {
                return "Code exists";
            }
            if ((aDepartmentGateway.IsNameExist(aDepartment.Name)))
            {
                return "Name exists";
            }

            if (aDepartmentGateway.SaveDepartment(aDepartment) > 0)
            {
                return "Saved";
            }
            else
            {
                return "Not saved";
            }
        }
        public List<Department> GetAllDepartment()
        {
            return aDepartmentGateway.GetAllDepartment();
        }
    }
}