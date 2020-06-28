using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFMS.Entity
{
    public class ProductDetails : Entity
    {
        public Guid ProductId { get; set; }
        public double BuyingPrice { get; set; }
        public double SaleingPrice { get; set; }
        public int Quantity { get; set; }
    }
}
