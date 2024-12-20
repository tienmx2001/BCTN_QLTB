using AssetInventory.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using static AssetInventory.Models.Phong;

namespace AssetInventory.Areas.QuanTriVien.Controllers
{
    public class ThanhLyController : Controller
    {
        // GET: QuanTriVien/ThanhLy
        AIDataContext db = new AIDataContext();



        [HttpPost]
        public JsonResult ThanhLyTaiSan(int MaTS, int MaPhong)
        {
            try
            {
                // Tìm Phân bổ theo MaTS và MaPhong
                var phanBo = db.PhanBos.FirstOrDefault(p => p.MaTS == MaTS && p.MaPhong == MaPhong);

                if (phanBo == null)
                {
                    return Json(new { success = false, message = "Thiết bị không tìm thấy trong phòng này." });
                }

                // Kiểm tra nếu có số lượng hỏng lớn hơn 0
                if (phanBo.SoLuongHong > 0)
                {
                    // Tạo bản ghi thanh lý
                    ThanhLy thanhLy = new ThanhLy
                    {
                        MaPB = phanBo.MaPB,
                        SoLuongThanhLy = phanBo.SoLuongHong,
                        GhiChu = "Thanh lý thiết bị: " + phanBo.MaTS,
                        NgayCapNhat = DateTime.Now,
                        NgayTao = DateTime.Now,
                        MaTS=phanBo.MaTS,
                        MaNhomTS=phanBo.MaNhomTS,
                    };

                    db.ThanhLys.InsertOnSubmit(thanhLy);

                    int soLuongThanhLy = phanBo.SoLuongHong;
                    phanBo.SoLuongHong = 0; 
                    phanBo.SoLuong -= soLuongThanhLy; 
                    if (phanBo.SoLuong < 0)
                    {
                        phanBo.SoLuong = 0; 
                    }           
                    phanBo.NgayCapNhat = DateTime.Now;

                    db.SubmitChanges(); // Lưu thay đổi vào cơ sở dữ liệu

                    return Json(new { success = true, message = "Thanh lý thiết bị thành công." });
                }
                else
                {
                    return Json(new { success = false, message = "Không có thiết bị hỏng để thanh lý." });
                }
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
        public JsonResult Get_ThanhLy_Data()
        {
            try
            {

                var thanhLyData = from tl in db.ThanhLys
                                  join pb in db.PhanBos on tl.MaPB equals pb.MaPB
                                  join ts in db.TaiSans on pb.MaTS equals ts.MaTS
                                  join p in db.Phongs on pb.MaPhong equals p.MaPhong
                                  orderby tl.NgayTao descending
                                  select new
                                  {
                                      tl.MaTL,
                                      tl.MaPB,
                                      ts.TenTS,
                                      pb.SoLuong,
                                      tl.SoLuongThanhLy,
                                      p.TenPhong,
                                      tl.GhiChu,
                                      NgayCapNhat = tl.NgayCapNhat,
                                      NgayTao = tl.NgayTao
                                  };

                return Json(new { success = true, data = thanhLyData.ToList() }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = "Đã xảy ra lỗi: " + ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpGet]
        public JsonResult Select_PhanBo_By_MaPhong(int MaPhong)
        {
            var get_data = from s in db.PhanBos
                           where s.MaPhong == MaPhong
                           where s.SoLuongHong > 0
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
                           };
            return Json(new { data = get_data.OrderByDescending(s => s.NgayCapNhat) }, JsonRequestBehavior.AllowGet);
        }



    }
}