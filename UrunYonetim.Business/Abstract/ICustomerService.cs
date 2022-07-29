using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UrunYonetimDAL.DTO.Customer;

namespace UrunYonetim.Business.Abstract
{
    public interface ICustomerService
    {
        public List<GetCustomerListDto> GetCustomerList();
        public GetCustomerDto GetCustomerById(int customerId);
        public int AddCustomer(AddCustomerDto addCustomerDto);
        public int UpdateCustomer(UpdateCustomerDto updateCustomerDto, int id);
        public int DeleteCustomer(int customerId);
    }
}
