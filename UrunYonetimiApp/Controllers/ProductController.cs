using Microsoft.AspNetCore.Mvc;
using UrunYonetim.Business.Abstract;
using UrunYonetimDAL.DTO.Product;

namespace UrunYonetimiApp.Controllers
{
    public class ProductController : Controller
    {
        private readonly IProductService _productService;
        private readonly ICustomerService _customerService;
        private readonly IProductCustomerService _productCustomerService;

        public ProductController(IProductService productService, ICustomerService customerService, IProductCustomerService productCustomerService)
        {
            _productService = productService;
            _customerService = customerService;
            _productCustomerService = productCustomerService;
        }

        public IActionResult Index()
        {
            var products = _productService.GetProductList();
            return View(products);
        }
        [HttpGet]
        public IActionResult AddProduct()
        {
            return View();
        }
        [HttpPost]
        public IActionResult AddProduct(AddProductDto addProductDto)
        {
            _productService.AddProduct(addProductDto);
            return RedirectToAction("Index", "Product");
        }
        public IActionResult DeleteProduct(int id)
        {
            _productService.DeleteProduct(id);
            return RedirectToAction("Index", "Product");
        }
        public IActionResult DetailProduct(int id)
        {
            var product = _productService.GetProductById(id);

            return View(product);
        }
        [HttpPost]
        public IActionResult UpdateProduct(UpdateProductDto updateProductDto, int id)
        {
            _productService.UpdateProduct(updateProductDto, id);
            return RedirectToAction("DetailProduct", "Product", new { id = id });
        }

        public IActionResult OutputProductDetail(int id)
        {
            ViewBag.Musteriler = _customerService.GetCustomerList();
            var product = _productService.GetProductById(id);
            return View(product);

        }
        [HttpPost]
        public IActionResult OutputProduct(OutputProductDto outputProductDto)
        {
            var id = outputProductDto.Id;
            var customerId = outputProductDto.customerId;
            var selectQuantity = outputProductDto.SelectQuantity;
            if (outputProductDto.SelectQuantity > outputProductDto.Quantity)
            {
                //ViewBag.Alert = "true";
                //var s = "true";
                //return RedirectToAction("OutputProductDetail",new { id,s });
              

                return RedirectToAction("OutputProductDetail", "Product", new {id=id});
            }
            else
            {
                _productCustomerService.AddProductCustomer(id, customerId, selectQuantity);
            }
            return RedirectToAction("Index","Product");

        }
    }
}
