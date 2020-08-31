using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFMS.Entity
{
    public class SalesReturn: Entity
    {
        public Guid ProductId { get; set; }
        public float Quantity { get; set; }
        public string Status { get; set; }
        public Guid CustomerId { get; set; }
        public DateTime CreatedDate { get; set; }

        [NotMapped]
        public string CompanyName { get; set; }
        [NotMapped]
        public string ProductName { get; set; }

    }
}
