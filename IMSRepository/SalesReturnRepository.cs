using SFMS.Entity;
using System;
using System.Collections.Generic;
using System.Linq;

namespace IMSRepository
{
    public class SalesReturnRepository: Repository<SalesReturn>
    {
        public SalesReturnRepository(DataContext dataContext) : base(dataContext) { }

        public SalesReturnModel GetSalesReturn(SalesReturnFilter filter)
        {
            string searchTextQuery = "";
            string subquery = "";
            string filterQuery = "";
            string CountTextQuery = "";

            if (!string.IsNullOrWhiteSpace(filter.SearchText))
            {
                searchTextQuery = " p.ProductName like '%" + filter.SearchText + "%' or  p.ProductName like '%" + filter.SearchText + "%' or u.CompanyName like '%" + filter.SearchText + "%' or s.Quantity like '%" + filter.SearchText + "%' and ";
                CountTextQuery = " where p.ProductName like '%" + filter.SearchText + "%' or p.ProductName like '%" + filter.SearchText + "%' or u.CompanyName like '%" + filter.SearchText + "%' or s.Quantity like '%" + filter.SearchText + "%' ";
            }

            string rawQuery = @"  
                                declare @pagesize int
                                declare @pageno int 
                                set @pagesize = " + filter.UnitPerPage + @"
                                set @pageno = " + filter.PageNumber + @"
                                declare @pagestart int
                                set @pagestart=(@pageno-1)* @pagesize  
                                select  TOP (@pagesize) s.*, p.ProductName, u.Name as CompanyName 
                                FROM SalesReturn s
								left join Products as p on s.ProductId=p.ProductId
                                left join Users as u on s.CustomerId=u.UserId
                           
                                where {1}{2}  s.Id NOT IN(Select TOP (@pagestart) Id from SalesReturn {0})
                                {0}
                               ";

            string CountQuery = string.Format("Select * from SalesReturn s {0}", CountTextQuery);

            rawQuery = string.Format(rawQuery, subquery, searchTextQuery, filterQuery);
            int TotalCount = 0;
            List<SalesReturn> dsResult = new List<SalesReturn>();
            try
            {
                var ctx = DataContext.getInstance();
                dsResult = ctx.SalesReturn.SqlQuery(rawQuery).ToList();
                TotalCount = ctx.SalesReturn.SqlQuery(CountQuery).ToList().Count;
            }
            catch (Exception ex)
            {

            }

            SalesReturnModel salesReturnModel = new SalesReturnModel();
            salesReturnModel.SalesReturnList = dsResult;

            //context.Dispose();
            salesReturnModel.TotalCount = TotalCount;
            return salesReturnModel;
        }


    }
}
