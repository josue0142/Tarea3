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

        [HttpGet]
        public IActionResult Add()
        {
            using (DBStudentsContext db = new DBStudentsContext())
            {
                var careers = db.Career.ToList();
                ViewBag.careers = careers;

                return View();
            }
        }

        [HttpPost]
        public ActionResult Add(Student student)
        {
            /*Verifica que los datos del modelo recibidos por parametros son validos
             * (es decir, captura conversiones de tipos de datos, como fechas con formato no válido) 
             */
            if (!ModelState.IsValid)
            {
                return RedirectToAction("Add", new { message = "Ah ocurrido un error" });
            }

            try
            {
                using (DBStudentsContext db = new DBStudentsContext())
                {
                    student.Status = "1";

                    db.Student.Add(student); //Agregamos el alumno a la base de datos
                    db.SaveChanges(); //Guardamos los cambios en la base de datos

                    return RedirectToAction("Index");
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            try
            {
                using (DBStudentsContext db = new DBStudentsContext())
                {
                    Student student = db.Student.Find(id);
                    ViewBag.FirsName = student.FirstName;
                    ViewBag.LastName = student.LastName;
                    ViewBag.Status = student.Status;
                    ViewBag.Career = student.CareerFk;

                    Career career = db.Career.Find(student.CareerFk);
                    ViewBag.CareerName = career.Name;

                    var careers = db.Career.ToList();
                    ViewBag.careers = careers;

                    return View(student);
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Student student)
        {
            /*Verifica que los datos del modelo recibidos por parametros son validos
             * (es decir, captura conversiones de tipos de datos, como fechas con formato no válido) 
             */
            if (!ModelState.IsValid)
            {
                return RedirectToAction("Edit", new { message = "Ah ocurrido un error" });
            }

            using (DBStudentsContext db = new DBStudentsContext())
            {
                Student student2 = db.Student.Find(student.StudentId);
                student2.FirstName = student.FirstName;
                student2.LastName = student.LastName;
                student2.CareerFk = student.CareerFk;
                student2.Status = student.Status;

                db.SaveChanges(); //Guardamos los cambios en la base de datos

                return RedirectToAction("Index");
            }
        }
    }
}