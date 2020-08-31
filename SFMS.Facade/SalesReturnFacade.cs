using IMSRepository;
using SFMS.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFMS.Facade
{
    public class SalesReturnFacade : Facade<SalesReturn>
    {
        SalesReturnRepository salesReturnRepository = null;
        public SalesReturnFacade(DataContext dataContext) : base(dataContext)
        {
            salesReturnRepository = new SalesReturnRepository(dataContext);
        }
        public SalesReturnModel GetSalesReturn(SalesReturnFilter filter)
        {
            return salesReturnRepository.GetSalesReturn(filter);
        }
    }
}
