using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TravelGuideWebsite.Entity.Abstract;

namespace TravelGuideWebsite.Models
{
    public class BlogLike:CommonProperty
    {

        public DateTime CreationDate { get; set; }=DateTime.Now;

        public int UserId { get; set; }

        public User User { get; set; }

        public int BlogPostId { get; set; }

        public BlogPost BlogPost { get; set; }

        public bool IsDeleted { get; set; } = false;

    }
}