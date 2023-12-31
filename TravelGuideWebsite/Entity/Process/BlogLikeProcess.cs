using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TravelGuideWebsite.Entity.Interface;
using TravelGuideWebsite.Models;

namespace TravelGuideWebsite.Entity.Process
{
    public class BlogLikeProcess
    {

        DataContext db = new DataContext();
        public string Add(BlogLike entity)
        {

            var like = db.BlogLikes.FirstOrDefault(x => x.BlogPostId == entity.BlogPostId && x.UserId == entity.UserId);
            if (like == null)
            {
                db.BlogLikes.Add(entity);

            }
            else
            {
                db.BlogLikes.Remove(like);

            }
            db.SaveChanges();
            return "Like işlemi başarılı";
        }

        public int LikeCount(int id)
        {
            var like = db.BlogLikes.Where(x => x.BlogPostId == id).Count();
            return like;
        }

        public bool IsLiked(int id, int userId)
        {
            var like = db.BlogLikes.FirstOrDefault(x => x.BlogPostId == id && x.UserId == userId);
            if (like == null)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
    }
}