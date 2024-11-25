using AssetInventory.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AssetInventory.Areas.QuanTriVien.Controllers
{
    public class ThanhLyController : Controller
    {
        // GET: QuanTriVien/ThanhLy
        AIDataContext db = new AIDataContext();

       

        [HttpPost]
        public JsonResult ThanhLyTaiSan(int MaPhong)
        {
            try
            {
                // Lấy danh sách tài sản trong phòng với SoLuongHong > 0
                var danhSachTaiSan = (from s in db.PhanBos
                                      where s.MaPhong == MaPhong && s.SoLuongHong > 0
                                      join ts1 in db.TaiSans on s.MaTS equals ts1.MaTS
                                      join nts in db.NhomTaiSans on ts1.MaNhomTS equals nts.MaNhomTS
                                      select new
                                      {
                                          s.MaTS,
                                          ts1.MaNhomTS,
                                          nts.TenNhomTS,
                                          ts1.TenTS,
                                          ts1.GiaTri,
                                          s.SoLuong,
                                          s.SoLuongHong,
                                          ts1.HangSanXuat,
                                          ts1.NamSanXuat,
                                          ts1.NuocSanXuat,
                                          s.GhiChu,
                                          s.NgayCapNhat
                                      }).ToList();

                if (!danhSachTaiSan.Any())
                {
                    return Json(new { success = false, message = "Không có tài sản hỏng trong phòng này để thanh lý." });
                }

                // Cập nhật số lượng hỏng của các tài sản về 0
                foreach (var item in danhSachTaiSan)
                {
                    var phanBo = db.PhanBos.FirstOrDefault(p => p.MaTS == item.MaTS && p.MaPhong == MaPhong);
                    if (phanBo != null)
                    {
                        phanBo.SoLuongHong = 0;  // Cập nhật số lượng hỏng thành 0
                        phanBo.NgayCapNhat = DateTime.Now;
                    }
                }

                db.SubmitChanges();  // Lưu thay đổi vào cơ sở dữ liệu

                return Json(new { success = true, message = "Thanh lý tài sản thành công." });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = "Đã xảy ra lỗi: " + ex.Message });
            }
        }
        [HttpGet]
        public ActionResult Index()
        {  
            return View();
        }
        [HttpGet]
        public JsonResult DanhSachTaiSanCanThanhLy()
        {
            var danhSachTaiSanCanThanhLy = (from s in db.PhanBos
                                            where s.SoLuongHong > 0
                                            join ts1 in db.TaiSans on s.MaTS equals ts1.MaTS
                                            join nts in db.NhomTaiSans on ts1.MaNhomTS equals nts.MaNhomTS
                                            select new
                                            {
                                                s.MaTS,
                                                nts.TenNhomTS,
                                                ts1.TenTS,
                                                s.SoLuongHong,
                                                s.GhiChu
                                            }).ToList();

            return Json(danhSachTaiSanCanThanhLy, JsonRequestBehavior.AllowGet);
        }


    }
}