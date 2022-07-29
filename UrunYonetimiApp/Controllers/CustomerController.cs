using Microsoft.AspNetCore.Mvc;
using UrunYonetim.Business.Abstract;
using UrunYonetimDAL.DTO.Customer;

namespace UrunYonetimiApp.Controllers
{
    public class CustomerController : Controller
    {
        private readonly ICustomerService _customerService;

        public CustomerController(ICustomerService customerService)
        {
            _customerService = customerService;
        }

        public IActionResult Index()
        {
            var customerList = _customerService.GetCustomerList();

            return View(customerList);
        }
        [HttpGet]
        public IActionResult AddCustomer()
        {
            return View();
        }
        [HttpPost]
        public IActionResult AddCustomer(AddCustomerDto addCustomerDto)
        {
            _customerService.AddCustomer(addCustomerDto);
           return RedirectToAction("Index","Customer");
        }
    }
}
