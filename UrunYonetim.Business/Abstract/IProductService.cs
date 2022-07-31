using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UrunYonetimDAL.DTO.Product;

namespace UrunYonetim.Business.Abstract
{
    public interface IProductService
    {
        public List<GetProductListDto> GetProductList();
        public GetProductDto GetProductById(int customerId);
        public int AddProduct(AddProductDto addProductDto);
        public int UpdateProduct(UpdateProductDto updateProductDto, int id);
        public int DeleteProduct(int productId);
        
    }
}
