using AssetInventory.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
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
          
            // Chỉ chuyển hướng đến đăng nhập nếu không có session nào tồn tại
            if (Session["Admin"] == null && Session["Nhanvien"] == null && Session["TruongBan"] == null)
            {
                return RedirectToAction("DangNhap", "TrangChu");
            }
            // Nếu có session hợp lệ, hiển thị trang chính
            return View();
        }



        [HttpGet]
        public JsonResult GetDataAnalyst()
        {
            var listTaiSan = from ts in db.NhomTaiSans
                             select ts;



            var taisanObject = new List<Dictionary<string, object>>();


            foreach (var ts in listTaiSan)
            {
                var phanbo = (from pb in db.PhanBos
                              where pb.MaNhomTS == ts.MaNhomTS
                              select pb).Count();

                var kiemeke = (from ctpkk in db.ChiTietPhieuKiemKes
                               where ctpkk.MaNhomTS == ts.MaNhomTS
                               select ctpkk).Count();
                var thanhly = (from tl in db.ThanhLys
                               where tl.MaNhomTS == ts.MaNhomTS
                               select tl).Count();

                taisanObject.Add(new Dictionary<string, object>
                {
                    { "MaNhomTS", ts.MaNhomTS },
                    { "TenNhomTS", ts.TenNhomTS },
                    { "SoLanDuocPhanBo", phanbo },
                    { "SoLanDuocKiemKe", kiemeke },
                    { "SoLanDuocThanhLy", thanhly }
                });
            }

            return Json(new { data = taisanObject }, JsonRequestBehavior.AllowGet);
        }
    }
}