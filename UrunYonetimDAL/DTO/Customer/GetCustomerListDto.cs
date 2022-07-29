using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UrunYonetimDAL.DTO.Customer
{
    public class GetCustomerListDto
    {
        public int Id { get; set; }
        public string CustomerName { get; set; }
        public string PhoneNumber { get; set; }
        public string Address { get; set; }
        public List<ProductName> Products { get; set; }
        public class ProductName
        {
            public int Id { get; set; }
            public string PName { get; set; }
        }
    }
}
