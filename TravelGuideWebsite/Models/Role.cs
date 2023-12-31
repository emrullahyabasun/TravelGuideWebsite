using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TravelGuideWebsite.Entity.Abstract;

namespace TravelGuideWebsite.Models
{
    public class Role:CommonProperty
    {
        public string Name { get; set; }
        public List<User> Users { get; set; }
        public bool IsDeleted { get; set; } = false;


    }
}