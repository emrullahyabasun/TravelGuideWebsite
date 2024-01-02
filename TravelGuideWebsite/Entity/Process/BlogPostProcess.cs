using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TravelGuideWebsite.Entity.Interface;
using TravelGuideWebsite.Models;
using System.Data.Entity;

namespace TravelGuideWebsite.Entity.Process
{
    public class BlogPostProcess : ICrud<BlogPost>
    {
        DataContext db = new DataContext();
        public string Add(BlogPost entity)
        {
           string result = "";
            try
            {
                var post = db.BlogPosts.FirstOrDefault(x => x.Title == entity.Title);
                if (post == null &&
                !String.IsNullOrWhiteSpace(entity.Content))
                {
                    db.BlogPosts.Add(entity);
                    db.SaveChanges();
                    result = entity.Title + "Postu Eklendi";
                }
                else
                {
                    result = "Bu başlıkta bir Post zaten mevcut";
                }
                return result;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public bool Delete(int id)
        {
           var post = db.BlogPosts.Find(id);
            if (post != null)
            {
                post.IsDeleted = true;
                db.SaveChanges();
                return true;

            }
            else
            {
                return false;
            }
        }

        public BlogPost Get(int id)
        {
            var post = db.BlogPosts
                 .Include(p => p.User)
                 .FirstOrDefault(x => x.Id == id && !x.IsDeleted);
            return post;
        }

        public List<BlogPost> GetAll()
        {
            return db.BlogPosts.Where(x => !x.IsDeleted).ToList();
        }

        public bool Update(BlogPost entity, int id)
        {
            var post = db.BlogPosts.FirstOrDefault(x => x.Id == id && !x.IsDeleted);
            if (post != null)
            {
                post.Title = entity.Title;
                post.Content = entity.Content;
                post.Image = entity.Image;
                post.CityId = entity.CityId;
                post.UserId = entity.UserId;
                db.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}