using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UrunYonetimDAL.Entity;

namespace UrunYonetimDAL.Config
{
    public class CustomerConfiguration : IEntityTypeConfiguration<Customer>
    {
        public void Configure(EntityTypeBuilder<Customer> builder)
        {
            builder.HasKey(p => p.Id);
            builder.Property(p => p.Id).ValueGeneratedOnAdd();
            builder.Property(p => p.CustomerName).HasMaxLength(100).IsRequired();
            builder.Property(p => p.PhoneNumber).HasMaxLength(11).IsRequired();
            builder.Property(p => p.Address).HasMaxLength(1000).IsRequired();
            

        }
    }
}
