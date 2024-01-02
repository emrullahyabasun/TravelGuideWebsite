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
        public string Add(int blogPostId, int userId)
        {

            var existingLike = db.BlogLikes.FirstOrDefault(x => x.BlogPostId == blogPostId && x.UserId == userId);
            if (existingLike == null)
            {
                
                db.BlogLikes.Add(new BlogLike { BlogPostId = blogPostId, UserId = userId });
                db.SaveChanges();
                return "Beğenildi";
            }
            else
            {
                
                existingLike.IsDeleted = !existingLike.IsDeleted;
                db.SaveChanges();
                return existingLike.IsDeleted ? "Beğeni kaldırıldı" : "Beğenildi";
            }
        }

        public int LikeCount(int blogPostId)
        {
            return db.BlogLikes.Count(x => x.BlogPostId == blogPostId && !x.IsDeleted);
        }

        
    }
}