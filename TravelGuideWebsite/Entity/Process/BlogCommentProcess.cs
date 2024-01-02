using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TravelGuideWebsite.Models;
using System.Data.Entity;

namespace TravelGuideWebsite.Entity.Process
{
    public class BlogCommentProcess
    {
        DataContext db = new DataContext();
        public string Add(BlogComment entity)
        {
            var comment = db.BlogComments.FirstOrDefault(x => x.BlogPostId == entity.BlogPostId && x.UserId == entity.UserId);
            if (comment == null && !String.IsNullOrWhiteSpace(entity.Content))
            {
                db.BlogComments.Add(entity);
                db.SaveChanges();
                return "Yorum eklendi";
            }
            else
            {
                return "Bu bloga daha önce yorum yaptınız";
            }
        }

        public List<BlogComment> Get(int id)
        {
            var comment = db.BlogComments.Where(x => x.BlogPostId == id && !x.IsDeleted).Include(x => x.User).ToList();
            return comment;
        }

        public string Delete(int id)
        {
            var comment = db.BlogComments.FirstOrDefault(x => x.Id == id);
            if (comment != null)
            {
                comment.IsDeleted = true;
                db.SaveChanges();
                return "Yorum silindi";
            }
            else
            {
                return "Yorum bulunamadı";
            }
        }

        public string Update(BlogComment entity)
        {
            var comment = db.BlogComments.FirstOrDefault(x => x.Id == entity.Id);
            if (comment != null)
            {
                comment.Content = entity.Content;
                db.SaveChanges();
                return "Yorum güncellendi";
            }
            else
            {
                return "Yorum bulunamadı";
            }
        }



    }
}