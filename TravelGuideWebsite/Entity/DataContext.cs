using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using TravelGuideWebsite.Models;

namespace TravelGuideWebsite.Entity
{
    public class DataContext:DbContext
    {
        public DataContext() : base("DbConnection") { }

        public DbSet<BlogLike> BlogLikes { get; set; }
        public DbSet<BlogPost> BlogPosts { get; set; }
        
        public DbSet<BlogComment> BlogComments { get; set; }
        public DbSet<City> Cities { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<Role> Roles { get; set; }

    }
}