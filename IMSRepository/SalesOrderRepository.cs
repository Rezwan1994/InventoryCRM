using SFMS.Entity;
using System;
using System.Collections.Generic;
using System.Linq;

namespace IMSRepository
{
    public class SalesOrderRepository : Repository<SalesOrder>
    {
        DataContext context = null;
        public SalesOrderRepository(DataContext dataContext) : base(dataContext) {
            this.context = dataContext;
        }

        public SalesOrder GetSalesOrderBySalesOrderId(Guid SalesOrderId)
        {
            List<SalesOrder> SalesOrderList = new List<SalesOrder>();
            SalesOrder salesOrder = new SalesOrder();
            string rawQuery = @"  
                                select so.*,pr.PaymentAmount as PaymentAmount,pr.BalanceDue as BalanceDue from SalesOrders so 
                                left join PaymentReceives pr on pr.SalesOrderId = so.SalesOrderId where so.SalesOrderId ='{0}'
                               ";

      

            string sqlQuery = string.Format(rawQuery, SalesOrderId);

            try
            {
                var ctx = DataContext.getInstance();
                
                SalesOrderList = ctx.Database.SqlQuery<SalesOrderVM>(sqlQuery, new object[] { }).ToList<SalesOrder>();

            }
            catch (Exception ex)
            {

            }
          
            if(SalesOrderList != null)
            {
                salesOrder = SalesOrderList.FirstOrDefault();
            }
          
            return salesOrder;
        }
        public InvoiceModel GetSalesOrderReports(InvoiceFilter filter)
        {
            string searchTextQuery = "";
            string subquery = "";
            string filterQuery = "";
            string CountTextQuery = "";

            if (!string.IsNullOrWhiteSpace(filter.SearchText))
            {
               searchTextQuery = " (CustomerName like '%" + filter.SearchText + "%' or Id like '%" + filter.SearchText + "%') and ";
               // CountTextQuery = " where c.Name like '%" + filter.SearchText + "%' or c.Mobile like '%" + filter.SearchText + "%' or c.Email like '%" + filter.SearchText + "%' or c.Address like '%" + filter.SearchText + "%' ";
            }

            List<Users> OpportunityList = new List<Users>();

            string rawQuery = @"  
                                declare @pagesize int
	                            declare @pageno int
                                set @pagesize = " + filter.UnitPerPage + @"
                                set @pageno = " + filter.PageNumber + @"
                             
                           
                                declare @pagestart int
                                set @pagestart=(@pageno-1)* @pagesize  

                                select so.*,pr.PaymentAmount as PaymentAmount,pr.BalanceDue as BalanceDue,pr.PaymentStatus as PaymentStatus,us.Name as CustomerName,us.Id as CusId into #InvTemp from SalesOrders so 
                                left join PaymentReceives pr on pr.SalesOrderId = so.SalesOrderId
								left join Users us on us.UserId = so.CustomerId
                                select  TOP (@pagesize) * FROM #InvTemp
                           
                                where   {0}{1} Id NOT IN(Select TOP (@pagestart) Id from #InvTemp)

						";

            string CountQuery = string.Format("Select * from SalesOrders  {0}", CountTextQuery);
            rawQuery = string.Format(rawQuery, searchTextQuery, filterQuery);
            int TotalCount = 0;
            List<SalesOrderVM> dsResult = new List<SalesOrderVM>();
            try
            {
                var ctx = DataContext.getInstance();
                dsResult = ctx.Database.SqlQuery<SalesOrderVM>(rawQuery, new object[] { }).ToList<SalesOrderVM>();
                TotalCount = ctx.SalesOrder.SqlQuery(CountQuery).ToList().Count;
            }
            catch (Exception ex)
            {

            }

            InvoiceModel invModel = new InvoiceModel();
            invModel.InvList = dsResult;

            //context.Dispose();
            invModel.TotalCount = TotalCount;
            return invModel;
        }
    }
}
