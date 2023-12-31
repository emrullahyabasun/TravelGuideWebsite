using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TravelGuideWebsite.Entity.Abstract;

namespace TravelGuideWebsite.Models
{
    public class BlogPost:CommonProperty
    {
        public string Title { get; set; }

        public string Content { get; set; }

        public DateTime CreationDate { get; set; }=DateTime.Now;

        public string Image { get; set; }

        public bool IsDeleted { get; set; }=false;

        public bool IsStatus { get; set; }=true;

        public int UserId { get; set; }

        public User User { get; set; }

        public int CityId { get; set; }

        public City City { get; set; }

        public List<BlogLike> Likes { get; set; }

        public List<BlogComment> Comments { get; set; }

        

     
       

    }
}