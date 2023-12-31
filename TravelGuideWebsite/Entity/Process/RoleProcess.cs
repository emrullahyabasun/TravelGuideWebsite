using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using TravelGuideWebsite.Entity.Interface;
using TravelGuideWebsite.Models;

namespace TravelGuideWebsite.Entity.Process
{
    public class RoleProcess : ICrud<Role>
    {
        DataContext db = new DataContext();
        public string Add(Role entity)
        {
            string result = "";
            try
            {
                var role = db.Roles.FirstOrDefault(x => x.Name == entity.Name);
                if (role == null)
                {
                    db.Roles.Add(entity);
                    db.SaveChanges();
                    result = entity.Name + "Rolü Eklendi";
                }
                else
                {
                    result = "Bu Rol zaten mevcut";
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

            var role = db.Roles.Find(id);
            if (role != null)
            {
                role.IsDeleted = true;
                db.SaveChanges();
                return true;

            }
            else
            {
                return false;
            }

        }

        public Role Get(int id)
        {
            var role = db.Roles.FirstOrDefault(x => x.Id == id && !x.IsDeleted);
            return role;
        }

        public List<Role> GetAll()
        {
            return db.Roles.Where(x => !x.IsDeleted).ToList();
        }

        public bool Update(Role entity, int id)
        {
            var role = db.Roles.Where(x => x.Id == id && !x.IsDeleted).FirstOrDefault();
            if (role != null)
            {
                role.Name = entity.Name;

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