using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using TravelGuideWebsite.Entity.Abstract;

namespace TravelGuideWebsite.Models
{
    public class User:CommonProperty
    {
        [Required]
        public string Name { get; set; }

        [Required]
        public string Surname { get; set; }

        [Required]
        [EmailAddress]
        public string Email { get; set; }

        [Required]
        public string Password { get; set; }

        public DateTime CreationDate { get; set; }=DateTime.Now;

        public string Image { get; set; }


        public bool IsDeleted { get; set; }=false;

        public bool IsStatus { get; set; }=true;

        public int RoleId { get; set; }

        public Role Role { get; set; }

        public List<BlogPost> BlogPosts { get; set; }

        public List<BlogLike> Likes { get; set; }

        public List<BlogComment> Comments { get; set; }



    }
}