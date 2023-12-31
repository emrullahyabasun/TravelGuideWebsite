using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TravelGuideWebsite.Entity.Abstract;

namespace TravelGuideWebsite.Models
{
    public class BlogComment:CommonProperty
    {
        public string Content { get; set; }

        public DateTime CreationDate { get; set; }=DateTime.Now;

        public bool IsDeleted { get; set; } = false;

        public bool IsStatus { get; set; } = false;

        public int UserId { get; set; }

        public User User { get; set; }

        public int BlogPostId { get; set; }

        public BlogPost BlogPost { get; set; }
    }
}