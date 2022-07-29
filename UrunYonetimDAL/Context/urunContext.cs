using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using UrunYonetimDAL.Entity;

namespace UrunYonetimDAL.Context
{
    public class urunContext : DbContext
    {
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfigurationsFromAssembly(Assembly.GetExecutingAssembly());
        }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer("Server=.;Database=urunDb;Trusted_Connection=True;"); 
            //optionsBuilder.UseSqlServer("Server=89.252.185.155\\MSSQLSERVER2019;Database=neoverde_product;User Id=neoverde_deneme;Password=L906v!4jr;");
        // sifre L906v!4jr
        }
        public DbSet<Customer> Customers { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<CustomerProduct> CustomerProducts  { get; set; }
    }
}
