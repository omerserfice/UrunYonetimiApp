using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UrunYonetimDAL.DTO.CustomerProduct;

namespace UrunYonetim.Business.Abstract
{
    public interface IProductCustomerService
    {
        public int AddProductCustomer(int productId,int customerId,int selectQuantity);
       
    }
}
