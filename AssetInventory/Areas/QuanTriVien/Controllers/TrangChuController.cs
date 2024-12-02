using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using AssetInventory.Models;

namespace AssetInventory.Areas.QuanTriVien.Controllers
{
    public class TrangChuController : Controller
    {
        // GET: QuanTriVien/TrangChu
        AIDataContext db = new AIDataContext();

        [HttpGet]
        public ActionResult Index()
        {
            // Debug log giá trị session
            Debug.WriteLine("Session Admin: " + (Session["Admin"] != null ? Session["Admin"].ToString() : "null"));
            Debug.WriteLine("Session Nhanvien: " + (Session["Nhanvien"] != null ? Session["Nhanvien"].ToString() : "null"));
            Debug.WriteLine("Session TruongBan: " + (Session["TruongBan"] != null ? Session["TruongBan"].ToString() : "null"));
            // Chỉ chuyển hướng đến đăng nhập nếu không có session nào tồn tại
            if (Session["Admin"] == null && Session["Nhanvien"] == null && Session["TruongBan"] == null)
            {
                return RedirectToAction("DangNhap");
            }
            // Nếu có session hợp lệ, hiển thị trang chính
            return View();
        }

        [HttpGet]
        public ActionResult DangNhap()
        {
            // Nếu người dùng đã đăng nhập với bất kỳ quyền nào, chuyển hướng về trang chính
            if (Session["Admin"] != null || Session["Nhanvien"] != null || Session["TruongBan"] != null)
            {
                return RedirectToAction("Index"); // Đảm bảo trang Index xử lý session đúng cách
            }
            return View();
        }

        [HttpPost]
        public ActionResult DangNhap(FormCollection collection)
        {
            var sTDN = collection["username"];
            var sMK = collection["password"];
            if (String.IsNullOrEmpty(sTDN))
            {
                ViewBag.ThongBao = "Chưa nhập tên đăng nhập.";
            }
            else if (String.IsNullOrEmpty(sMK))
            {
                ViewBag.ThongBao = "Phải nhập mật khẩu.";
            }
            else
            {
                // Kiểm tra thông tin đăng nhập
                NguoiDung kh = db.NguoiDungs.SingleOrDefault(n => n.TenDangNhap == sTDN && n.MatKhau == sMK);
                if (kh != null)
                {

                    // Xử lý phân quyền
                    if (kh.PhanQuyen == 1)
                    {
                        Session["Admin"] = kh;
                    }
                    else if (kh.PhanQuyen == 0)
                    {
                        Session["Nhanvien"] = kh;
                    }
                    else if (kh.PhanQuyen == 2)
                    {
                        Session["TruongBan"] = kh;
                    }
                    else
                    {
                        // Trường hợp quyền không hợp lệ
                        ViewBag.ThongBao = "Quyền truy cập không hợp lệ. Vui lòng liên hệ quản trị viên.";
                        return View();
                    }

                    // Log giá trị session sau khi phân quyền
                    Debug.WriteLine("Session Admin: " + (Session["Admin"] != null ? Session["Admin"].ToString() : "null"));
                    Debug.WriteLine("Session Nhanvien: " + (Session["Nhanvien"] != null ? Session["Nhanvien"].ToString() : "null"));
                    Debug.WriteLine("Session TruongBan: " + (Session["TruongBan"] != null ? Session["TruongBan"].ToString() : "null"));

                    // Ghi nhật ký hoạt động
                    NhatKyHoatDong nkhd = new NhatKyHoatDong
                    {
                        TenDangNhap = kh.ChucDanh,
                        HoatDong = "Đăng nhập",
                        ChiTietHoatDong = kh.ChucDanh + " Đăng nhập vào hệ thống thành công",
                        NgayHoatDong = DateTime.Now
                    };
                    db.NhatKyHoatDongs.InsertOnSubmit(nkhd);
                    db.SubmitChanges();

                    return RedirectToAction("Index", "TrangChu");
                }
                else
                {
                    ViewBag.ThongBao = "Tên đăng nhập hoặc mật khẩu không đúng.";
                }
            }

            return View();
        }


        public ActionResult DangXuat()
        {
            Session.Clear(); // Xóa toàn bộ session
            return RedirectToAction("DangNhap");
        }
    }
}
