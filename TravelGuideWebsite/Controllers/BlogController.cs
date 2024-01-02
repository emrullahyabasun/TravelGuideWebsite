using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TravelGuideWebsite.Entity;
using TravelGuideWebsite.Entity.Process;
using TravelGuideWebsite.Models;
using System.Data.Entity;

namespace TravelGuideWebsite.Controllers
{
    public class BlogController : Controller
    {

        DataContext db = new DataContext();


        BlogPostProcess blogPostProcess = new BlogPostProcess();

        BlogCommentProcess blogCommentProcess = new BlogCommentProcess();

        BlogLikeProcess blogLikeProcess = new BlogLikeProcess();
        // GET: Blog
        public ActionResult Index()
        {
            var blogPosts = db.BlogPosts
                      .Include(b => b.User)
                      .Include(b => b.City)
                      .Include(b => b.Likes)
                      .Where(b => !b.IsDeleted)
                      .ToList();



            return View(blogPosts);
        }







        [Authorize(Roles = "User,Admin")]
        public ActionResult MyPosts()
        {
            var userId = (Session["User"] as User).Id;
            var myPosts = db.BlogPosts
                            .Where(b => b.UserId == userId && !b.IsDeleted)
                            .ToList();

            return View(myPosts);
        }








        public ActionResult Detail(int id)
        {
            var blogPost = db.BlogPosts
                      .Include(b => b.User)
                      .Include(b => b.City)
                      .Include(b => b.Likes)
                      .FirstOrDefault(b => b.Id == id && !b.IsDeleted);

            if (blogPost == null)
            {
                return HttpNotFound();
            }


            var comments = blogCommentProcess.Get(id);
            ViewBag.Comments = comments;

            var userId = (Session["User"] as User)?.Id;
            ViewBag.HasLiked = blogPost.Likes.Any(l => l.UserId == userId && !l.IsDeleted);


            return View(blogPost);
        }

        [HttpGet]
        public ActionResult Create()
        {
            ViewBag.Cities = new SelectList(db.Cities, "Id", "Name");
            return View();
        }

        [HttpPost]
        [Authorize(Roles = "User,Admin")]
        [ValidateAntiForgeryToken]
        public ActionResult Create(BlogPost blogPost)
        {
            if (ModelState.IsValid)
            {
                blogPost.UserId = (Session["User"] as User).Id;
                var result = blogPostProcess.Add(blogPost);
                if (result.Contains("Eklendi"))
                {
                    return RedirectToAction("Index");
                }
                else
                {
                    ModelState.AddModelError("", result);
                }
            }
            ViewBag.Cities = new SelectList(db.Cities, "Id", "Name", blogPost.CityId);
            return View(blogPost);
        }

        //[HttpGet]
        //public ActionResult Edit(int id)
        //{
        //    var sessionUser = Session["User"] as User;
        //    var blogPost = blogPostProcess.Get(id);

        //    if (blogPost == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    else if (sessionUser == null || sessionUser.IsDeleted || !sessionUser.IsStatus)
        //    {

        //        return RedirectToAction("Login", "Security");
        //    }
        //    else if (blogPost.UserId != sessionUser.Id)
        //    {

        //        return new HttpStatusCodeResult(HttpStatusCode.Forbidden, "Bu işlem için yetkiniz yok.");
        //    }
        //    ViewBag.Cities = new SelectList(db.Cities, "Id", "Name", blogPost.CityId);
        //    return View(blogPost);
        //}

        //[HttpPost]
        //[Authorize(Roles = "User,Admin")]
        //[ValidateAntiForgeryToken]
        //public ActionResult Edit(int id, BlogPost blogPost)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        var sessionUser = Session["User"] as User;
        //        if (sessionUser == null || sessionUser.IsDeleted || !sessionUser.IsStatus)
        //        {

        //            return RedirectToAction("Login", "Security");
        //        }
        //        var result = blogPostProcess.Update(blogPost, id);
        //        if (blogPost.UserId != sessionUser.Id)
        //        {

        //            return new HttpStatusCodeResult(HttpStatusCode.Forbidden, "Bu işlem için yetkiniz yok.");
        //        }


        //        if (result)
        //        {
        //            return RedirectToAction("Index");
        //        }
        //        else
        //        {
        //            ModelState.AddModelError("", "Güncelleme başarısız.");
        //        }
        //    }
        //    ViewBag.Cities = new SelectList(db.Cities, "Id", "Name", blogPost.CityId);
        //    return View(blogPost);
        //}






        [HttpGet]
        public ActionResult Edit(int id)
        {
            var sessionUser = Session["User"] as User;
            if (sessionUser == null || sessionUser.IsDeleted || !sessionUser.IsStatus)
            {
                return RedirectToAction("Login", "Security");
            }

            var blogPost = db.BlogPosts.Include(b => b.User).FirstOrDefault(x => x.Id == id && !x.IsDeleted);
            if (blogPost == null)
            {
                return HttpNotFound();
            }
            else if (blogPost.UserId != sessionUser.Id)
            {
                return new HttpStatusCodeResult(HttpStatusCode.Forbidden, "Bu işlem için yetkiniz yok.");
            }

            ViewBag.Cities = new SelectList(db.Cities, "Id", "Name", blogPost.CityId);
            return View(blogPost);
        }

        [HttpPost]
        [Authorize(Roles = "User,Admin")]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, BlogPost blogPost)
        {
            var sessionUser = Session["User"] as User;
            if (sessionUser == null || sessionUser.IsDeleted || !sessionUser.IsStatus)
            {
                return RedirectToAction("Login", "Security");
            }

            if (ModelState.IsValid)
            {
                var existingPost = db.BlogPosts.FirstOrDefault(x => x.Id == id && !x.IsDeleted);
                if (existingPost == null)
                {
                    return HttpNotFound();
                }

                if (existingPost.UserId != sessionUser.Id)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.Forbidden, "Bu işlem için yetkiniz yok.");
                }

                
                existingPost.Title = blogPost.Title;
                existingPost.Content = blogPost.Content;
                existingPost.Image = blogPost.Image;
                existingPost.CityId = blogPost.CityId;

                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Cities = new SelectList(db.Cities, "Id", "Name", blogPost.CityId);
            return View(blogPost);
        }
















        [HttpPost]
        [Authorize(Roles = "User,Admin")]
        [ValidateAntiForgeryToken]
        public ActionResult AddComment(BlogComment comment, int blogPostId)
        {
            if (Session["User"] != null)
            {
                if (ModelState.IsValid)
                {
                    var currentUser = Session["User"] as TravelGuideWebsite.Models.User;
                    comment.UserId = currentUser.Id;
                    comment.BlogPostId = blogPostId;

                    var result = blogCommentProcess.Add(comment);
                    if (result == "Yorum eklendi")
                    {
                        return RedirectToAction("Detail", new { id = comment.BlogPostId });
                    }
                    else
                    {

                        ModelState.AddModelError(string.Empty, result);
                    }
                }
            }
            else
            {
                return RedirectToAction("Login", "Security");
            }


            return RedirectToAction("Detail", "Blog", new { id = blogPostId });
        }


        [HttpPost]
        [Authorize(Roles = "User,Admin")]
        [ValidateAntiForgeryToken]
        public ActionResult AddLike(int blogPostId)
        {
            if (Session["User"] != null)
            {
                var userId = (Session["User"] as User).Id;
                var result = blogLikeProcess.Add(blogPostId, userId);



                return RedirectToAction("Detail", new { id = blogPostId });
            }
            else
            {
                return RedirectToAction("Login", "Security");
            }
        }

    }
}