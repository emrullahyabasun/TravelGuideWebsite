using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using TravelGuideWebsite.Entity;

namespace TravelGuideWebsite.Controllers
{
    public class SecurityController : Controller
    {
        DataContext db = new DataContext();
        // GET: Security
        public ActionResult Login()
        {

            return View();
        }

        [HttpPost]
        public ActionResult Login(string Email, string Password)
        {
            var user = db.Users.FirstOrDefault(x => x.Email == Email && x.Password == Password);
            if (user != null)
            {
                FormsAuthentication.SetAuthCookie(Email, false);//false kalıcı cookie oluşturmaz. true kalıcı cookie oluşturur. 
                Session["User"] = user;
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ViewData["Message"] = "Geçersiz Email veya Parola";
                return View();
            }

        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            Session["User"] = null;
            return RedirectToAction("Index", "Home");
        }

       
    }
}
