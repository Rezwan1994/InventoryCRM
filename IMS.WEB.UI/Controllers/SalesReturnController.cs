using IMSRepository;
using SFMS.Entity;
using SFMS.Facade;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IMS.WEB.UI.Controllers
{
    public class SalesReturnController : Controller
    {
        SalesReturnFacade salesReturnFacade = null;
        ProductsFacade productsFacade = null;
        LookUpFacade lookupFacade = null;
        UserFacade userFacade = null;
        public SalesReturnController()
        {
            DataContext Context = DataContext.getInstance();
            salesReturnFacade = new SalesReturnFacade(Context);
            productsFacade = new ProductsFacade(Context);
            userFacade = new UserFacade(Context);
            lookupFacade = new LookUpFacade(Context);
        }

        // GET: SalesReturn
        [Authorize]
        public ActionResult Index()
        {
            return View();
        }

        [Authorize]
        public ActionResult SalesReturnPartial()
        {
            return View();
        }

        [Authorize]
        public ActionResult LoadSalesReturnPartial()
        {
            List<SelectListItem> CompanyList = new List<SelectListItem>();
            List<Users> Companies = userFacade.GetAll().Where(x => x.UserType == "Vendor").ToList();
            CompanyList.AddRange(Companies.Select(x =>
            new SelectListItem()
            {
                Text = x.Name.ToString(),
                Value = x.UserId.ToString()
            }).ToList());
            CompanyList.Insert(0, new SelectListItem()
            {
                Text = "Search By Company",
                Value = "-1"
            });
            ViewBag.Category = CompanyList;
            return PartialView();
        }

        [Authorize]
        public ActionResult LoadSalesReturnList(SalesReturnFilter filter)
        {
            if (filter.CompanyName == "-1" || filter.CompanyName == null)
            {
                filter.CompanyName = string.Empty;
            }
            if (filter.PageNumber == 0)
            {
                filter.PageNumber = 1;
            }
            filter.UnitPerPage = 12;

            if (filter.PageNumber == null || filter.PageNumber == 0)
            {
                filter.PageNumber = 1;
            }
            SalesReturnModel salesReturnList = salesReturnFacade.GetSalesReturn(filter);

            ViewBag.OutOfNumber = salesReturnList.TotalCount;
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
            salesReturnList.SalesReturnList = salesReturnList.SalesReturnList.Where(x => x.CompanyName.Contains(filter.CompanyName)).ToList();
            return View(salesReturnList.SalesReturnList);
        }

        //public ActionResult AddSalesReturn(int? id)
        //{
        //    SalesReturn model = new SalesReturn();
        //    List<SelectListItem> ProductList = new List<SelectListItem>();

        //    if (id.HasValue && id > 0)
        //    {
        //        model = salesReturnFacade.Get(id.Value);
        //        ProductList.Add(new SelectListItem
        //        {
        //            Text = model.ProductName,
        //            Value = model.ProductName,
        //        });
        //    }
        //    ViewBag.Categorylist = lookupFacade.GetLookupByKey("ProductCategory").Select(x =>
        //    new SelectListItem()
        //    {
        //        Text = x.DisplayText.ToString(),
        //        Value = x.DataValue.ToString(),
        //        Selected = model.Category == x.DataValue ? true : false
        //    }).ToList();
        //    ViewBag.ProductList = ProductList;
        //    return View(model);
        //}

        //public JsonResult SaveProduct(Product newProduct)
        //{
        //    var result = false;
        //    if (newProduct != null)
        //    {
        //        if (newProduct.Id > 0)
        //        {
        //            var oldProduct = productsFacade.Get(newProduct.Id);
        //            oldProduct.ImageUrl = newProduct.ImageUrl;
        //            oldProduct.ProductNameBangla = newProduct.ProductNameBangla;
        //            oldProduct.ProductName = newProduct.ProductName;
        //            oldProduct.Quantity = newProduct.Quantity;
        //            oldProduct.SellingPrice = newProduct.SellingPrice;
        //            oldProduct.BuyingPrice = newProduct.BuyingPrice;
        //            oldProduct.Category = newProduct.Category;
        //            oldProduct.SubCategory = newProduct.SubCategory;

        //            if (productsFacade.Update(oldProduct) > 0)
        //            {
        //                result = true;
        //            }
        //        }
        //        else
        //        {
        //            Product oldProduct = productsFacade.GetByProductName(newProduct.ProductName).FirstOrDefault();
        //            if (oldProduct == null)
        //            {
        //                newProduct.ProductId = Guid.NewGuid();
        //                if (productsFacade.Insert(newProduct) > 0)
        //                {
        //                    result = true;
        //                }
        //            }
        //            else
        //            {
        //                oldProduct.Quantity = newProduct.Quantity + oldProduct.Quantity;
        //                oldProduct.SellingPrice = newProduct.SellingPrice;
        //                oldProduct.BuyingPrice = newProduct.BuyingPrice;
        //                oldProduct.SubCategory = newProduct.SubCategory;

        //                if (productsFacade.Update(oldProduct) > 0)
        //                {
        //                    result = true;
        //                }
        //            }
        //        }
        //    }
        //    return Json(new { result = result });
        //}

        //public JsonResult DeleteProduct(int id)
        //{
        //    bool result = productsFacade.Delete(id) > 0;
        //    string message = "Something Wrong!!";
        //    if (result)
        //    {
        //        message = "Product deleted Sucessfully";
        //    }
        //    return Json(new { result = result, message = message });
        //}

    }
}