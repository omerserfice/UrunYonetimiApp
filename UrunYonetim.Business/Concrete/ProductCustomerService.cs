using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UrunYonetim.Business.Abstract;
using UrunYonetimDAL.Context;
using UrunYonetimDAL.DTO.CustomerProduct;
using UrunYonetimDAL.Entity;

namespace UrunYonetim.Business.Concrete
{
    public class ProductCustomerService : IProductCustomerService
    {
        private readonly urunContext _urunContext;

        public ProductCustomerService(urunContext urunContext)
        {
            _urunContext = urunContext;
        }

        public int AddProductCustomer(int productId, int customerId,int selectQuantity)
        {
            var newProductCustomer = new CustomerProduct
            {
                CustomerId = customerId,
                ProductId = productId,
                Quantity = selectQuantity,
                IsDeleted = false,
                CUserId = 1,
                CDate = DateTime.Now,
                MUserId = null,
                MDate = null
            };
            _urunContext.CustomerProducts.Add(newProductCustomer);
            return _urunContext.SaveChanges();
        }

      
    }
}
