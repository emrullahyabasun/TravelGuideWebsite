using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TravelGuideWebsite.Entity;
using TravelGuideWebsite.Models;

namespace TravelGuideWebsite.Controllers
{
    [Authorize(Roles ="User,Admin")]
    public class HomeController : Controller
    {
        DataContext db = new DataContext();

        [AllowAnonymous]
        public ActionResult Index()
        {


            User user = Session["User"] as User;
            if (user != null)
            {
                ViewBag.User = user;
            }
            else
            {
                ViewBag.User = null;
            }
            return View();
        }
        [AllowAnonymous]
        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }
        [AllowAnonymous]
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}