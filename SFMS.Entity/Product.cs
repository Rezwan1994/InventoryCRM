﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFMS.Entity
{
    public class Product : Entity
    {
    
        public Guid ProductId { get; set; }
        public string ProductName { get; set; }
        public string ProductNameBangla { get; set; }
        public double BuyingPrice { get; set; }

        public double SellingPrice { get; set; }
        public string Category { get; set; }
        public string SubCategory { get; set; }
        public int Quantity { get; set; }
        public string ImageUrl { get; set; }

        [NotMapped]
        public int RemainQantity { get; set; }
        [NotMapped]
        public int QuantityOnHand { get; set; }
        [NotMapped]
        public string WarehouseName { get; set; }
        [NotMapped]
        public Guid WarehouseId { get; set; }
        
    }
    [NotMapped]
    public class ProductVM : Product
    {

    }
}








