using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using TravelGuideWebsite.Entity.Interface;
using TravelGuideWebsite.Models;

namespace TravelGuideWebsite.Entity.Process
{
    public class UserProcess : ICrud<User>
    {
        DataContext db = new DataContext();
        public string Add(User entity)
        {
            string result = "";
            var user = db.Users.FirstOrDefault(x => x.Email == entity.Email);
            if (user == null &&
                !String.IsNullOrWhiteSpace(entity.Name) &&
                !String.IsNullOrWhiteSpace(entity.Surname) &&
                !String.IsNullOrWhiteSpace(entity.Email) &&
                !String.IsNullOrWhiteSpace(entity.Password))
            {
                db.Users.Add(entity);
                db.SaveChanges();
                result = entity.Email + "Kayıt Başarılı";

            }
            else
            {
                result = entity.Email + "Bu Email Adresi Zaten Kayıtlı";
            }
            return result;
        }

        public bool Delete(int id)
        {
            var user = db.Users.FirstOrDefault(x => x.Id == id && !x.IsDeleted);
            if (user != null)
            {
                user.IsDeleted = true;
                db.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }

        }

        public User Get(int id)
        {
            var user = db.Users.FirstOrDefault(x => x.Id == id && !x.IsDeleted);
            return user;
        }

        public List<User> GetAll()
        {
            return db.Users.Where(x => !x.IsDeleted).Include(u=>u.Role) .ToList();
        }

        public bool Update(User entity, int id)
        {
            var user = db.Users.FirstOrDefault(x => x.Id == id && !x.IsDeleted);
            if (user != null)
            {
                user.Name = entity.Name;
                user.Surname = entity.Surname;
                user.Email = entity.Email;
                user.Password = entity.Password;
                user.RoleId = entity.RoleId;

                db.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }

        }
        public string PasswordChange(int id, string oldPassword, string newPassword, string newPasswordRepeat)
        {
            string result = "";
            var user = db.Users.FirstOrDefault(x => x.Id == id && !x.IsDeleted);
            if (user != null)
            {
                if (user.Password == oldPassword)
                {
                    if (user.Password != newPassword)
                    {
                        if (newPassword == newPasswordRepeat)
                        {
                            user.Password = newPassword;
                            db.SaveChanges();
                            result = "Şifre Değiştirildi";
                        }
                        else
                        {
                            result = "Yeni Şifreler Uyuşmuyor";
                        }
                    }
                    else
                    {
                        result = "Yeni Şifre Eski Şifre İle Aynı Olamaz";
                    }

                }
                else
                {
                    result = "Şifre Yanlış";
                }
            }
            else
            {
                result = "Kullanıcı Bulunamadı";
            }
            return result;
        }
    }
}