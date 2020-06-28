using SFMS.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IMSRepository
{
    public class ProductDetailsRepository : Repository<ProductDetails>
    {
        public ProductDetailsRepository(DataContext dataContext) : base(dataContext) { }
    }
}
