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
       
        public IActionResult DeleteCustomer(int id)
        {
            _customerService.DeleteCustomer(id);
            return RedirectToAction("Index", "Customer");
        }

        public IActionResult DetailCustomer(int id)
        {
            var customer = _customerService.GetCustomerById(id);

            return View(customer);
        }
        [HttpPost]
        public IActionResult UpdateCustomer(UpdateCustomerDto updateCustomerDto, int id)
        {
            _customerService.UpdateCustomer(updateCustomerDto, id);
            return RedirectToAction("DetailCustomer", "Customer", new { id = id });
        }

       
    }
}
