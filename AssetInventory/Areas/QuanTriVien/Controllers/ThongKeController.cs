using AssetInventory.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AssetInventory.Areas.QuanTriVien.Controllers
{
    public class ThongKeController : Controller
    {
        // GET: QuanTriVien/ThongKe
        AIDataContext db = new AIDataContext();

        // GET: QuanTriVien/ThongKe
        public ActionResult Index()
        {
            if (Session["Admin"] == null || Session["Admin"].ToString() == "")
            {
                return RedirectToAction("DangNhap", "TrangChu");
            }
            else
            {
                return View();

            }
        }


        [HttpGet]
        public JsonResult GetDataAnalyst()
        {
            var listTaiSan = from ts in db.TaiSans
                             select ts;



            var taisanObject = new List<Dictionary<string, object>>();


            foreach (var ts in listTaiSan)
            {
                var phanbo = (from pb in db.PhanBos
                              where pb.MaTS == ts.MaTS
                              select pb).Count();

                var kiemeke = (from ctpkk in db.ChiTietPhieuKiemKes
                               where ctpkk.MaTS == ts.MaTS
                               select ctpkk).Count();

                taisanObject.Add(new Dictionary<string, object>
                {
                    { "MaTS", ts.MaTS },
                    { "TenTS", ts.TenTS },
                    { "SoLanDuocPhanBo", phanbo },
                    { "SoLanDuocKiemKe", kiemeke }
                });
            }

            return Json(new { data = taisanObject }, JsonRequestBehavior.AllowGet);
        }
    }
}