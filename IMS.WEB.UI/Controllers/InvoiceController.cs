﻿using SFMS.Entity;
using SFMS.Facade;
using IMSRepository;
using System;
using System.Collections.Generic;
using System.Web.Mvc;
using System.Linq;

namespace IMS.WEB.UI.Controllers
{
    public class InvoiceController : Controller
    {
        // GET: Invoice

        SalesOrderFacade salesFacade = null;
        PaymentFacade payFacade = null;
        SalesOrderDetailsFacade salesDetailFacade = null;
        WareHouseFacade wareHouseFacade = null;
        PWMFacade pWMFacade = null;
        ProductsFacade productsFacade = null;
        UserFacade userFacade = null;
        public InvoiceController()
        {
            DataContext Context = DataContext.getInstance();
            salesFacade = new SalesOrderFacade(Context);
            salesDetailFacade = new SalesOrderDetailsFacade(Context);
            payFacade = new PaymentFacade(Context);
            wareHouseFacade = new WareHouseFacade(Context);
            pWMFacade = new PWMFacade(Context);
            productsFacade = new ProductsFacade(Context);
            userFacade = new UserFacade(Context);
        }
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult InvoicePartial(Guid CustomerId)
        {
            ViewBag.CustomerId = CustomerId;
            return View();
        }
        public ActionResult InvoiceListPartial(Guid CustomerId, string InvoiceType)
        {
            ViewBag.CustomerId = CustomerId;
            List<PaymentReceive> PaymentList = new List<PaymentReceive>();
            Users user = userFacade.GetUserByUserId(CustomerId);

            PaymentList = payFacade.GetAllPaymentReceiveByCustomerId(CustomerId,InvoiceType,user.UserType);
            return View(PaymentList);
        }

        public ActionResult AddInvoice(Guid CustomerId, Guid? SalesOrderId)
        {

            SalesOrder salesOrder = new SalesOrder();
            SalesOrderModel salesOrderModel = new SalesOrderModel();
            Users user = userFacade.GetUserByUserId(CustomerId);
            if(user != null)
            {

                ViewBag.UserType = user.UserType;
                ViewBag.UserName = user.Name;
            }

            if (SalesOrderId != null && SalesOrderId != new Guid())
            {
                salesOrder = salesFacade.GetSalesOrderBySalesOrderId(SalesOrderId.Value);
                if (salesOrder != null)
                {
                    List<SalesOrderDetailVM> salesDetailList = salesDetailFacade.GetAllSalesDetailsBySaleOrderId(salesOrder.SalesOrderId);
                    salesOrderModel.SalesOrder = salesOrder;
                    salesOrderModel.SalesOrderDetailList = salesDetailList;
                }
            }
            else
            {
                salesOrderModel.SalesOrder = salesOrder;
                salesOrderModel.SalesOrderDetailList = new List<SalesOrderDetailVM>();
            }
            #region Viewbag
            List<SelectListItem> WarehouseList = new List<SelectListItem>();
            WarehouseList.AddRange(wareHouseFacade.GetAll().Select(x => new SelectListItem()
            {
                Text = x.WarehouseName,
                Value = x.WarehouseId.ToString()
            }).ToList());
            //ViewBag.LeadUserList = SalesList;
            ViewBag.WarehouseList = WarehouseList;
            #endregion

            ViewBag.CustomerId = CustomerId;
            return View(salesOrderModel);
        }

        [HttpPost]
        public ActionResult AddInvoice(SalesOrderModel SalesOrderModel)
        {
            SalesOrder salesOrder = new SalesOrder();
            bool result = false;
            string massege = "";
            Users user = userFacade.GetUserByUserId(SalesOrderModel.SalesOrder.CustomerId);
            if(user != null)
            {
                if(user.UserType == "Customer")
                {
                    SalesOrderModel.SalesOrder.IsForCustomer = true;
                }
                else
                {
                    SalesOrderModel.SalesOrder.IsForCustomer = false;
                }
            }

            try
            {
                if (SalesOrderModel.SalesOrder.Id == 0)
                {

                    if ((SalesOrderModel.SalesOrder.PaymentAmount.HasValue ? SalesOrderModel.SalesOrder.PaymentAmount.Value:0.0) >= 0 && SalesOrderModel.SalesOrder.Total >= (SalesOrderModel.SalesOrder.PaymentAmount.HasValue ? SalesOrderModel.SalesOrder.PaymentAmount.Value : 0.0))
                    {

                        SalesOrderModel.SalesOrder.SalesOrderId = Guid.NewGuid();
                        SalesOrderModel.SalesOrder.CreatedDate = DateTime.Now;
                        SalesOrderModel.SalesOrder.WarehouseId = Guid.NewGuid();
                        SalesOrderModel.SalesOrder.OrderDate = DateTime.Now;
                        SalesOrderModel.SalesOrder.DelivaryDate = DateTime.Now;
                        SalesOrderModel.SalesOrder.SubTotal = SalesOrderModel.SalesOrder.Amount - (SalesOrderModel.SalesOrder.PaymentAmount.HasValue ? SalesOrderModel.SalesOrder.PaymentAmount.Value : 0.0);
                        salesFacade.Insert(SalesOrderModel.SalesOrder);
                        if (SalesOrderModel.SalesOrderDetails.Count > 0)
                        {
                            foreach (var item in SalesOrderModel.SalesOrderDetails)
                            {
                                item.SalesOrderDetailId = Guid.NewGuid();
                                item.SalesOrderId = SalesOrderModel.SalesOrder.SalesOrderId;
                                if(user.UserType == "Customer")
                                {
                                    #region Product Deduct
                                    Product oldProduct = productsFacade.GetByProductId(item.ProductId);
                                    oldProduct.Quantity = oldProduct.Quantity - item.Quantity;
                                    if(oldProduct.Quantity >0)
                                    {
                                        productsFacade.Update(oldProduct);
                                    }
                                    #endregion
                                }
                                else
                                {
                                    #region Product Add
                                    Product oldProduct = productsFacade.GetByProductId(item.ProductId);
                                    oldProduct.Quantity = oldProduct.Quantity + item.Quantity;
                                    productsFacade.Update(oldProduct);
                                    #endregion
                                }

                                salesDetailFacade.Insert(item);
                            }
                        }

                        #region PaymentReceive

                        PaymentReceive payment = new PaymentReceive();
                        payment.PaymentId = Guid.NewGuid();
                        payment.SalesOrderId = SalesOrderModel.SalesOrder.SalesOrderId;
                        payment.BalanceDue = SalesOrderModel.SalesOrder.Amount - (SalesOrderModel.SalesOrder.PaymentAmount.HasValue? SalesOrderModel.SalesOrder.PaymentAmount.Value:0.0);
                        payment.PaymentAmount = SalesOrderModel.SalesOrder.PaymentAmount.HasValue ? SalesOrderModel.SalesOrder.PaymentAmount.Value : 0.0;
                        if (payment.BalanceDue == 0)
                        {
                            payment.PaymentStatus = "Paid";
                        }
                        else if (payment.BalanceDue == SalesOrderModel.SalesOrder.Amount)
                        {
                            payment.PaymentStatus = "UnPaid";
                        }
                        else
                        {
                            payment.PaymentStatus = "Partialy Paid";
                        }

                        payment.PaymentDate = SalesOrderModel.SalesOrder.PaymentDate != null ? SalesOrderModel.SalesOrder.PaymentDate.Value : DateTime.Now;
                        payment.Note = SalesOrderModel.SalesOrder.PaymentNote;
                        payFacade.Insert(payment);
                    }
                    else
                    {
                        result = false;
                        massege = "Payment amount should be less or equal to the Total amount";
                        return Json(new { result = result, message = massege });
                    }
                    #endregion

                }
                else
                {
                    PaymentReceive oldPayment = payFacade.GetPaymentBySOId(SalesOrderModel.SalesOrder.SalesOrderId);
                    SalesOrder sales = salesFacade.Get(SalesOrderModel.SalesOrder.Id);
                    if ((SalesOrderModel.SalesOrder.PaymentAmount.HasValue? SalesOrderModel.SalesOrder.PaymentAmount.Value:0) >= 0 && sales.Amount >= (oldPayment.PaymentAmount + (SalesOrderModel.SalesOrder.PaymentAmount.HasValue ? SalesOrderModel.SalesOrder.PaymentAmount.Value : 0)))
                    {
                      
                        sales.OrderDate = SalesOrderModel.SalesOrder.OrderDate;
                        sales.DelivaryDate = SalesOrderModel.SalesOrder.DelivaryDate;
                        sales.DiscountAmount = SalesOrderModel.SalesOrder.DiscountAmount;
                        sales.Amount = SalesOrderModel.SalesOrder.Amount;
                        sales.Freight = SalesOrderModel.SalesOrder.Freight;
                        sales.Total = SalesOrderModel.SalesOrder.Total;
                        salesFacade.Update(sales);
                        List<SalesOrderDetailVM> salesdetaillist = salesDetailFacade.GetAllSalesDetailsBySaleOrderId(sales.SalesOrderId);
                        if (SalesOrderModel.SalesOrderDetails.Count > 0)
                        {
                            foreach (var item in salesdetaillist)
                            {
                               
                                Product oldProduct = productsFacade.GetByProductId(item.ProductId);
                                if (user.UserType == "Customer")
                                {
                                    if (oldProduct != null)
                                    {
                                        oldProduct.Quantity = oldProduct.Quantity + item.Quantity;
                                        productsFacade.Update(oldProduct);
                                    }
                                }
                                else
                                {
                                    if (oldProduct != null)
                                    {
                                        oldProduct.Quantity = oldProduct.Quantity - item.Quantity;
                                        productsFacade.Update(oldProduct);
                                    }
                                }

                                salesDetailFacade.Delete(item.Id);
                            }
                            foreach (var item in SalesOrderModel.SalesOrderDetails)
                            {
                                SalesOrderDetail tempSalesOrderDetail = new SalesOrderDetail();
                                tempSalesOrderDetail.Price = item.Price;
                                tempSalesOrderDetail.ProductId = item.ProductId;
                                tempSalesOrderDetail.Quantity = item.Quantity;
                                tempSalesOrderDetail.SalesOrderDetailId = Guid.NewGuid();
                                tempSalesOrderDetail.SalesOrderId = SalesOrderModel.SalesOrder.SalesOrderId;
                                tempSalesOrderDetail.SubTotal = item.SubTotal;
                                tempSalesOrderDetail.Total = item.Total;
                                tempSalesOrderDetail.Amount = item.Amount;
                                tempSalesOrderDetail.WarehouseId = item.WarehouseId;
                                if(user.UserType == "Customer")
                                {
                                    #region Product Deduct

                                    Product oldProduct = productsFacade.GetByProductId(item.ProductId);
                                    if (oldProduct != null)
                                    {
                                        oldProduct.Quantity = oldProduct.Quantity - item.Quantity;
                                        productsFacade.Update(oldProduct);
                                    }
                                    #endregion
                                }
                                else
                                {
                                    #region Product Addition

                                    Product oldProduct = productsFacade.GetByProductId(item.ProductId);
                                    if (oldProduct != null)
                                    {
                                        oldProduct.Quantity = oldProduct.Quantity + item.Quantity;
                                        productsFacade.Update(oldProduct);
                                    }
                                    #endregion
                                }


                                salesDetailFacade.Insert(tempSalesOrderDetail);
                            }
                        }

                        #region PaymentReceive

                       

                        oldPayment.BalanceDue = SalesOrderModel.SalesOrder.Amount - (SalesOrderModel.SalesOrder.PaymentAmount.HasValue ? SalesOrderModel.SalesOrder.PaymentAmount.Value: 0.0);
                        oldPayment.PaymentAmount = (oldPayment.PaymentAmount + (SalesOrderModel.SalesOrder.PaymentAmount.HasValue ? SalesOrderModel.SalesOrder.PaymentAmount.Value: 0.0));
                        oldPayment.BalanceDue = SalesOrderModel.SalesOrder.Amount - oldPayment.PaymentAmount;
                        sales.SubTotal = oldPayment.BalanceDue;
                        salesFacade.Update(sales);

                        if (oldPayment.BalanceDue == 0)
                        {
                            oldPayment.PaymentStatus = "Paid";
                        }
                        else if (oldPayment.BalanceDue == SalesOrderModel.SalesOrder.Amount)
                        {
                            oldPayment.PaymentStatus = "UnPaid";
                        }
                        else
                        {
                            oldPayment.PaymentStatus = "Partially Paid";
                        }

                        oldPayment.PaymentDate = SalesOrderModel.SalesOrder.PaymentDate != null ? SalesOrderModel.SalesOrder.PaymentDate.Value : DateTime.Now;
                        oldPayment.Note = SalesOrderModel.SalesOrder.PaymentNote;
                        payFacade.Update(oldPayment);
                    }
                    else
                    {
                        result = false;
                        massege = "Payment amount should be less or equal to the Total amount";
                        return Json(new { result = result, message = massege });
                    }
                    #endregion

                }
                result = true;
                massege = "Invoice saved successfully";
            }
            catch (Exception ex)
            {
                result = false;
                massege = "Invoice not saved";
            }
            return Json(new { result = result, message = massege });
        }
    }
}