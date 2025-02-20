﻿using SFMS.Entity;
using System;
using System.Collections.Generic;
using System.Linq;

namespace IMSRepository
{
    public class PaymentRepository : Repository<PaymentReceive>
    {
        DataContext context = null;
        public PaymentRepository(DataContext dataContext) : base(dataContext)
        {
            this.context = dataContext;
        }

        public List<PaymentReceive> GetAllPaymentReceiveByCustomerId(Guid CustomerId,string InvoiceType,string UserType)
        {
            List<PaymentReceive> PaymentReceiveList = new List<PaymentReceive>();
            string TypeQuery = "";
            string ForCustomerQuery = "";
            if(!string.IsNullOrEmpty(InvoiceType))
            {
                if(InvoiceType != "Paid")
                {
                    TypeQuery = " and pr.PaymentStatus != 'Paid'";
                }
                else
                {
                    TypeQuery = " and pr.PaymentStatus = 'Paid'";
                }
               
            }
            if(!string.IsNullOrEmpty(UserType))
            {
                if(UserType == "Customer")
                {
                    ForCustomerQuery = " and so.IsForCustomer = 1";
                }
                else
                {
                    ForCustomerQuery = " and (so.IsForCustomer = 0 or so.IsForCustomer = null)";
                }
             
            }

            string rawQuery = @"  
                                select *,us.Name from PaymentReceives pr 
                                left join SalesOrders so on so.SalesOrderId = pr.SalesOrderId
                                left join Users us on us.UserId = so.CustomerId
                                where us.UserId = '{0}' {1} 
                               ";

            string sqlQuery = string.Format(rawQuery, CustomerId, TypeQuery);
            PaymentReceiveList = context.Set<PaymentReceive>().SqlQuery(sqlQuery).ToList();
            return PaymentReceiveList;
        }

        public PaymentReceive GetPaymentBySOId(Guid SalesOrderId)
        {
            return context.Set<PaymentReceive>().Where(x=>x.SalesOrderId == SalesOrderId).FirstOrDefault();
        }
    }
}
