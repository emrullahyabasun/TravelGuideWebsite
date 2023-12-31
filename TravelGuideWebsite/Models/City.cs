using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TravelGuideWebsite.Entity.Abstract;

namespace TravelGuideWebsite.Models
{
    public class City:CommonProperty
    {
         public string Name { get; set; }

        public string Description { get; set; }

        public string Image { get; set; }

        public List<BlogPost> Posts { get; set; }

       
      
    }
}