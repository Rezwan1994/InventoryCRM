using IMSRepository;
using SFMS.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFMS.Facade
{
    public class ProductDetailsFacade : Facade<ProductDetails>
    {
        ProductDetailsRepository productDetailsRepository = null;
        public ProductDetailsFacade(DataContext dataContext) : base(dataContext)
        {
            productDetailsRepository = new ProductDetailsRepository(dataContext);
        }
    }
}
