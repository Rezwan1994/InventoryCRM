using SFMS.Facade;
using IMSRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using System.IO;
using SFMS.Framework;
using SFMS.Entity;
using System.ComponentModel;

namespace SmartFleetManagementSystem.Controllers
{
    public class ReportController : Controller
    {
        // GET: Report
        UserFacade usersFacade = null;

        LookUpFacade lookupFacade = null;
        SalesOrderFacade salesFacade = null;
        PaymentFacade payFacade = null;
        SalesOrderDetailsFacade salesDetailFacade = null;
        public ReportController()
        {
            DataContext Context = DataContext.getInstance();
            lookupFacade = new LookUpFacade(Context);
            usersFacade = new UserFacade(Context);
            salesFacade = new SalesOrderFacade(Context);
            salesDetailFacade = new SalesOrderDetailsFacade(Context);
            payFacade = new PaymentFacade(Context);
        }
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ReportsPartial()
        {
            List<SelectListItem> InvTypeList = new List<SelectListItem>();
            InvTypeList.AddRange(lookupFacade.GetLookupByKey("InvoiceType").Select(x =>
            new SelectListItem()
            {
                Text = x.DisplayText.ToString(),
                Value = x.DataValue.ToString()
            }).ToList());
            ViewBag.InvTypeList = InvTypeList;
            return View();
        }
        public ActionResult LoadCustomerInvReport(InvoiceFilter filter)
        {
            if (filter.PageNumber == 0)
            {
                filter.PageNumber = 1;
            }
            filter.UnitPerPage = 10;
       
            if (filter.PageNumber == null || filter.PageNumber == 0)
            {
                filter.PageNumber = 1;
            }
            //UsersModel UsersList = usersFacade.GetUsers(filter);
            InvoiceModel invList = salesFacade.GetSalesOrderReports(filter);
            ViewBag.OutOfNumber = invList.TotalCount;
            ViewBag.ShowList = invList.InvList != null ? invList.InvList.Count:0;
            if ((int)ViewBag.OutOfNumber == 0)
            {
                ViewBag.Message = "No Content Available !";
            }
            if (@ViewBag.OutOfNumber == 0)
            {
                filter.PageNumber = 1;
            }
            ViewBag.PageNumber = filter.PageNumber;

            if ((int)ViewBag.PageNumber * filter.UnitPerPage > (int)ViewBag.OutOfNumber)
            {
                ViewBag.CurrentNumber = (int)ViewBag.OutOfNumber;
            }
            else
            {
                ViewBag.CurrentNumber = (int)ViewBag.PageNumber * filter.UnitPerPage;
            }

            ViewBag.PageCount = Math.Ceiling((double)ViewBag.OutOfNumber / filter.UnitPerPage.Value);
            return View(invList.InvList);
          
        }
        public ActionResult VehicleFilter()
        {
            #region ViewBags
            ViewBag.FuelSystemList = lookupFacade.GetLookupByKey("FuelSystem").Select(x =>
                 new SelectListItem()
                 {
                     Text = x.DisplayText.ToString(),
                     Value = x.DataValue.ToString()
                 }).ToList();

            ViewBag.VehicleStatusList = lookupFacade.GetLookupByKey("Status").Select(x =>
                       new SelectListItem()
                       {
                           Text = x.DisplayText.ToString(),
                           Value = x.DataValue.ToString()
                       }).ToList();
            ViewBag.VehicleTypeList = lookupFacade.GetLookupByKey("VehicleType").Select(x =>
                       new SelectListItem()
                       {
                           Text = x.DisplayText.ToString(),
                           Value = x.DataValue.ToString()
                       }).ToList();
            ViewBag.VehicleSubTypeList = lookupFacade.GetLookupByKey("VehicleSubType").Select(x =>
                 new SelectListItem()
                 {
                     Text = x.DisplayText.ToString(),
                     Value = x.DataValue.ToString()
                 }).ToList();
            ViewBag.CapacityList = lookupFacade.GetLookupByKey("Capacity").Select(x =>
            new SelectListItem()
            {
                Text = x.DisplayText.ToString(),
                Value = x.DataValue.ToString()
            }).ToList();
            #endregion
            return View();
        }
        public ActionResult FuelFilter()
        {
            List<SelectListItem> CarList = new List<SelectListItem>();
            #region ViewBags
            CarList.Add(new SelectListItem
            {
                Text = "Vehicle",
                Value = "00000000-0000-0000-0000-000000000000"
            });
            ViewBag.CarList = CarList;

            ViewBag.FuelSystemList = lookupFacade.GetLookupByKey("FuelSystem").Select(x =>
                    new SelectListItem()
                    {
                        Text = x.DisplayText.ToString(),
                        Value = x.DataValue.ToString(),
                    }).ToList();
            #endregion
            return View();
        }

        public static DataTable ToDataTable<T>(IList<T> data)
        {
            PropertyDescriptorCollection props =
                TypeDescriptor.GetProperties(typeof(T));
            DataTable table = new DataTable();
            for (int i = 0; i < props.Count; i++)
            {
                PropertyDescriptor prop = props[i];
                table.Columns.Add(prop.Name, Nullable.GetUnderlyingType(
            prop.PropertyType) ?? prop.PropertyType);
            }
            object[] values = new object[props.Count];
            foreach (T item in data)
            {
                for (int i = 0; i < values.Length; i++)
                {
                    values[i] = props[i].GetValue(item);
                }
                table.Rows.Add(values);
            }
            return table;
        }
    }
}