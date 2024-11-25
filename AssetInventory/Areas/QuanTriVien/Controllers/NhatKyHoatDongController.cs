using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AssetInventory.Models;

namespace AssetInventory.Areas.QuanTriVien.Controllers
{
    public class NhatKyHoatDongController : Controller
    {
        AIDataContext db = new AIDataContext();

        // GET: QuanTriVien/NhatKyHoatDong
        public ActionResult Index()
        {
            // Debug log giá trị session
            Debug.WriteLine("Session Admin: " + (Session["Admin"] != null ? Session["Admin"].ToString() : "null"));
            Debug.WriteLine("Session Nhanvien: " + (Session["Nhanvien"] != null ? Session["Nhanvien"].ToString() : "null"));
            Debug.WriteLine("Session TruongBan: " + (Session["TruongBan"] != null ? Session["TruongBan"].ToString() : "null"));
            // Chỉ chuyển hướng đến đăng nhập nếu không có session nào tồn tại
            if (Session["Admin"] == null && Session["Nhanvien"] == null && Session["TruongBan"] == null)
            {
                return RedirectToAction("DangNhap", "TrangChu");
            }
            // Nếu có session hợp lệ, hiển thị trang chính
            return View();
        }


        [HttpGet]
        public JsonResult Select_NKHD()
        {
            var get_data = from s in db.NhatKyHoatDongs.OrderByDescending(a => a.NgayHoatDong)
                           select new { s.MaNKHD, s.TenDangNhap, s.HoatDong, s.ChiTietHoatDong, s.GhiChu, s.NgayHoatDong};
            return Json(new { data = get_data }, JsonRequestBehavior.AllowGet);
        }
    }
}