using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Tarea3.Models;

namespace Tarea3.Controllers
{
    public class StudentController : Controller
    {
        public IActionResult Index()
        {
            try
            {
                using (DBStudentsContext db = new DBStudentsContext())
                {
                    var students = db.Student.Include(Student => Student.CareerFkNavigation).ToList();

                    return View(students.ToList());
                }
            }
            catch (Exception)
            {
                throw;
            }

        }
    }
}