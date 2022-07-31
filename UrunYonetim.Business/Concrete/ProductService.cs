using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UrunYonetim.Business.Abstract;
using UrunYonetimDAL.Context;
using UrunYonetimDAL.DTO.Product;
using UrunYonetimDAL.Entity;

namespace UrunYonetim.Business.Concrete
{
    public class ProductService : IProductService
    {
        private readonly urunContext _urunContext;

        public ProductService(urunContext urunContext)
        {
            _urunContext = urunContext;
        }

        public int AddProduct(AddProductDto addProductDto)
        {
            var newProduct = new Product
            {
               ProductName = addProductDto.ProductName,
               Price = addProductDto.Price,
               Quantity = addProductDto.Quantity,
            };
            _urunContext.Products.Add(newProduct);
            return _urunContext.SaveChanges();
        }

        public int DeleteProduct(int productId)
        {
            var product = _urunContext.Products.Where(p => !p.IsDeleted && p.Id == productId).FirstOrDefault();

            product.IsDeleted = true;
            _urunContext.Products.Update(product);
            return _urunContext.SaveChanges();
        }

        public GetProductDto GetProductById(int productId)
        {
            var product = _urunContext.Products.Where(p => !p.IsDeleted && p.Id == productId)
                 .Select(p => new GetProductDto
                 {
                     Id = p.Id,
                     ProductName = p.ProductName,
                     Price = p.Price,
                     Quantity = p.Quantity,


                 }).FirstOrDefault();
            return product;
        }

        public List<GetProductListDto> GetProductList()
        {
            return _urunContext.Products.Where(p => !p.IsDeleted)

               .Select(p => new GetProductListDto
               {
                   Id = p.Id,
                   ProductName = p.ProductName,
                   Price = p.Price,
                   Quantity = p.Quantity
               }).ToList();
        }


        public int UpdateProduct(UpdateProductDto updateProductDto, int id)
        {
            var currentProduct = _urunContext.Products.Where(p => !p.IsDeleted && p.Id == id).FirstOrDefault();
            currentProduct.ProductName = updateProductDto.ProductName;
            currentProduct.Price = updateProductDto.Price;
            currentProduct.Quantity = updateProductDto.Quantity;
            _urunContext.Products.Update(currentProduct);
            return _urunContext.SaveChanges();
        }
    }
}
