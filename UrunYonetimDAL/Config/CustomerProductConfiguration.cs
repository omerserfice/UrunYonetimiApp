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
    public class CustomerProductConfiguration : IEntityTypeConfiguration<CustomerProduct>
    {
        public void Configure(EntityTypeBuilder<CustomerProduct> builder)
        {
            builder.HasKey(p => p.Id);
            builder.Property(p => p.Id).ValueGeneratedOnAdd();
            builder.Property(p => p.CustomerId).IsRequired();
            builder.Property(p => p.ProductId).IsRequired();



            builder.HasOne(x => x.ProductFK).WithMany(y => y.CustomerProducts).HasForeignKey(x => x.ProductId);
            builder.HasOne(x => x.CustomerFK).WithMany(z => z.CustomerProducts).HasForeignKey(x => x.CustomerId);


        }
    }
}
