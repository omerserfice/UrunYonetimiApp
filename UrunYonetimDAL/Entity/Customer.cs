using Core.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UrunYonetimDAL.Entity
{
    public class Customer : Audit, IEntity, ISoftDelete
    {
        public int Id { get; set; }
        public string CustomerName { get; set; }
        public string PhoneNumber { get; set; }
        public string Address { get; set; }
        public ICollection<CustomerProduct> CustomerProducts { get; set; }
        public bool IsDeleted { get; set; }
    }
}
