using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TravelGuideWebsite.Entity;

namespace TravelGuideWebsite.Controllers
{
    public class CitiesController : Controller
    {
        DataContext db = new DataContext();
        // GET: Cities
        public ActionResult Index()
        {
            var cities = db.Cities.ToList();
            return View(cities);
        }
        public ActionResult Detail(int id)
        {
            var city = db.Cities.FirstOrDefault(c => c.Id == id);
            if (city == null)
            {
                return HttpNotFound();
            }

            var blogPosts = db.BlogPosts.Where(b => b.CityId == id).ToList();
            ViewBag.CityName = city.Name;

            return View(blogPosts);
        }
    }
}