using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UrunYonetim.Business.Abstract;
using UrunYonetimDAL.Context;
using UrunYonetimDAL.DTO.Customer;
using UrunYonetimDAL.Entity;
using static UrunYonetimDAL.DTO.Customer.GetCustomerListDto;

namespace UrunYonetim.Business.Concrete
{
    public class CustomerService : ICustomerService
    {
        private readonly urunContext _urunContext;

        public CustomerService(urunContext urunContext)
        {
            _urunContext = urunContext;
        }

        public int AddCustomer(AddCustomerDto addCustomerDto)
        {
            var newCustomer = new Customer
            {
                CustomerName = addCustomerDto.CustomerName,
                PhoneNumber = addCustomerDto.PhoneNumber,
                Address = addCustomerDto.Address,
            };
            _urunContext.Customers.Add(newCustomer);
            return _urunContext.SaveChanges();
        }

        public int DeleteCustomer(int customerId)
        {
            var customer = _urunContext.Customers.Where(p => !p.IsDeleted && p.Id == customerId).FirstOrDefault();
           
            customer.IsDeleted = true;
            _urunContext.Customers.Update(customer);
            return _urunContext.SaveChanges();
        }

        public GetCustomerDto GetCustomerById(int customerId)
        {
            var customer = _urunContext.Customers.Where(p => !p.IsDeleted && p.Id == customerId)
                .Select(p => new GetCustomerDto
                {
                    Id = p.Id,
                    CustomerName = p.CustomerName,
                    PhoneNumber = p.PhoneNumber,
                    Address = p.Address,
                   
                   
                }).FirstOrDefault();
            return customer;
        }
        
        public List<GetCustomerListDto> GetCustomerList()
        {
            return _urunContext.Customers.Where(p => !p.IsDeleted)
                
                .Select(p => new GetCustomerListDto
                {
                    Id = p.Id,
                    CustomerName = p.CustomerName,
                    PhoneNumber=p.PhoneNumber,
                    Address=p.Address,
                    Products = p.CustomerProducts.Where(p => !p.IsDeleted)
                    .Select(p => new ProductName
                    {
                        Id = p.ProductFK.Id,
                        PName=p.ProductFK.ProductName
                    }).ToList()
                }).ToList();
        }

        public int UpdateCustomer(UpdateCustomerDto updateCustomerDto, int id)
        {
            var currentCustomer = _urunContext.Customers.Where(p=>!p.IsDeleted && p.Id == id).FirstOrDefault();
            currentCustomer.CustomerName = updateCustomerDto.CustomerName;
            currentCustomer.PhoneNumber = updateCustomerDto.PhoneNumber;
            currentCustomer.Address = updateCustomerDto.Address;
            _urunContext.Customers.Update(currentCustomer);
            return _urunContext.SaveChanges();
        }
    }
}
