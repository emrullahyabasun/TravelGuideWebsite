using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TravelGuideWebsite.Entity;
using TravelGuideWebsite.Entity.Process;
using TravelGuideWebsite.Models;

namespace TravelGuideWebsite.Controllers
{
    public class RolesController : Controller
    {

        RoleProcess roleProcess = new RoleProcess();

        // GET: Roles
        public ActionResult Index()
        {
            return View(roleProcess.GetAll().ToList());
        }

        // GET: Roles/Details/5
        public ActionResult Details(int id = 0)
        {
            if (id == 0)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            var role = roleProcess.Get(id);

            if (role == null)
            {
                return HttpNotFound();
            }
            return View(role);
        }

        // GET: Roles/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Roles/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Role role)
        {
            string result = roleProcess.Add(role);

            ViewData["Message"] = result;
            return View();
        }

        //GET: Roles/Edit/5
        public ActionResult Edit(int id = 0)
        {
            if (id == 0)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var role = roleProcess.Get(id);
            if (role == null)
            {
                return HttpNotFound();
            }
            return View(role);
        }

        // POST: Roles/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Role role)
        {
            bool result = roleProcess.Update(role, role.Id);
            ViewData["Message"] = result ? "Rol Güncellendi" : "Rol Güncellenemedi";
            return View(role);
        }

        // GET: Roles/Delete/5
        public ActionResult Delete(int id = 0)
        {
          if(id==0)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var role = roleProcess.Get(id);
            if (role == null)
            {
                return HttpNotFound();
            }
            return View(role);
        }

        //    // POST: Roles/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            bool result = roleProcess.Delete(id);
            ViewData["Message"] = result ? "Rol Silindi" : "Rol Silinemedi";
            if(result)
            {
                return RedirectToAction("Index");
            }
            else
            {
                return RedirectToAction("Delete", id);
            }
            
        }

      
    }
}
