using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TravelGuideWebsite.Entity.Interface
{
    public interface ICrud<T>
    {
        string Add(T entity);
        T Get(int id);
        List<T> GetAll();
        bool Update(T entity, int id);
        bool Delete(int id);
    }
}
