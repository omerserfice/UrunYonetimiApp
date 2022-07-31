using Core.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UrunYonetimDAL.Entity
{
    public class Product : Audit,IEntity,ISoftDelete
    {
        public int Id { get; set; }
        public string ProductName { get; set; }
        public decimal Price { get; set; }
        public int Quantity { get; set; }
        public bool Status { get; set; }
        public ICollection<CustomerProduct> CustomerProducts { get; set; }
        public bool IsDeleted { get; set; }
    }
}
