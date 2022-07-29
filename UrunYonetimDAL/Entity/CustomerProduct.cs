using Core.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UrunYonetimDAL.Entity
{
    public class CustomerProduct : Audit, IEntity, ISoftDelete
    {
        public int Id { get; set; }
        public int CustomerId { get; set; }
        public Customer CustomerFK { get; set; }
        public int ProductId { get; set; }
        public Product ProductFK { get; set; }
        public bool IsDeleted { get; set; }
    }
}
