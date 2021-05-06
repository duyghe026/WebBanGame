package ptithcm.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletContext;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ptithcm.entity.HangHoa;
import ptithcm.entity.TheLoai;

@Transactional
@Controller
@RequestMapping("admin/hanghoa/")
public class HangHoaController {
	@Autowired
	SessionFactory factory;
	@Autowired
	ServletContext context;

	@ModelAttribute("dsLoai")
	public List<TheLoai> getLoai() {
		Session session = factory.getCurrentSession();
		String hql = "FROM TheLoai";
		Query query = session.createQuery(hql);
		List<TheLoai> list = query.list();
		return list;
	}

	@RequestMapping("index")
	public String index(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "from HangHoa";
		Query query = session.createQuery(hql);
		List<HangHoa> list = query.list();
		model.addAttribute("dshangHoa", list);
		return "admin/hanghoa/index";
	}

	@RequestMapping(value = "insert", method = RequestMethod.GET)
	public String insert(ModelMap model) {
		model.addAttribute("hangHoa", new HangHoa());
		return "admin/hanghoa/insert";
	}

	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String insert(ModelMap model, @ModelAttribute("hangHoa") HangHoa hangHoa,
			@RequestParam("photo") MultipartFile photo, BindingResult errors)
			throws IllegalStateException, IOException {
		if (hangHoa.getMaHangHoa().trim().length() == 0) {
			errors.rejectValue("maHangHoa", "maHangHoa", "Vui Lòng Nhập Mã Hàng Hóa");
		}
		if (hangHoa.getTenHangHoa().trim().length() == 0) {
			errors.rejectValue("tenHangHoa", "tenHangHoa", "Vui Lòng Nhập Tên Hàng Hóa");
		}
		if (hangHoa.getGiamGia() > hangHoa.getDonGia()) {
			errors.rejectValue("giamGia", "giamGia", "Vui Lòng Chọn Giảm Giá Nhỏ Hơn Đơn Giá");
		}
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau");

		} else {
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			if (photo.getOriginalFilename().isEmpty()) {
				hangHoa.setAnh("unknown.png");
			} else {
				String photoPath = "";
				photoPath = context.getRealPath("/images/" + photo.getOriginalFilename());
				photo.transferTo(new File(photoPath));
				hangHoa.setAnh(photo.getOriginalFilename());
			}
			try {
				session.save(hangHoa);
				t.commit();
				model.addAttribute("message", "Thêm Mới Thành Công!");
			} catch (Exception e) {
				t.rollback();
				model.addAttribute("message", "Thêm Mới Thất Bại!");
			} finally {
				session.close();
			}
		}
		return "admin/hanghoa/insert";
	}

	@RequestMapping(value = "update/{maHangHoa}", method = RequestMethod.GET)
	public String update(ModelMap model, @PathVariable("maHangHoa") String maHangHoa) {
		Session session = factory.getCurrentSession();
		HangHoa hangHoa = (HangHoa) session.get(HangHoa.class, maHangHoa);
		model.addAttribute("hangHoa", hangHoa);
		return "admin/hanghoa/update";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(ModelMap model, @ModelAttribute("hangHoa") HangHoa hangHoa,
			@RequestParam("photo") MultipartFile photo, BindingResult errors)
			throws IllegalStateException, IOException {
		if (hangHoa.getMaHangHoa().trim().length() == 0) {
			errors.rejectValue("hangHoa.maHangHoa", "hangHoa.maHangHoa", "Vui Lòng Nhập Mã Hàng Hóa");
		}
		if (hangHoa.getTenHangHoa().trim().length() == 0) {
			errors.rejectValue("tenHangHoa", "tenHangHoa", "Vui Lòng Nhập Tên Hàng Hóa");
		}
		if (hangHoa.getGiamGia() > hangHoa.getDonGia()) {
			errors.rejectValue("giamGia", "giamGia", "Vui Lòng Chọn Giảm Giá Nhỏ Hơn Đơn Giá");
		}
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau");

		} else {
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			if (photo.getOriginalFilename().isEmpty()) {
				Session session1 = factory.getCurrentSession();
				HangHoa temp = (HangHoa) session1.get(HangHoa.class, hangHoa.getMaHangHoa());
				hangHoa.setAnh(temp.getAnh());
				System.out.println(temp.getAnh());
			} else {
				String photoPath = "";
				photoPath = context.getRealPath("/images/" + photo.getOriginalFilename());
				photo.transferTo(new File(photoPath));
				hangHoa.setAnh(photo.getOriginalFilename());
				System.out.println(hangHoa.getAnh());
			}
			try {
				session.update(hangHoa);
				t.commit();
				model.addAttribute("message", "Cập Nhật Thành Công!");
			} catch (Exception e) {
				t.rollback();
				model.addAttribute("message", "Cập Nhật Thất Bại!");
			} finally {
				session.close();
			}
		}
		return "redirect:/admin/hanghoa/index.htm";
	}

	@RequestMapping(value = "delete/{maHangHoa}", method = RequestMethod.GET)
	public String delete(ModelMap model, @PathVariable("maHangHoa") String maHangHoa) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			HangHoa hangHoa = (HangHoa) session.get(HangHoa.class, maHangHoa);
			session.delete(hangHoa);
			t.commit();
			model.addAttribute("message", "Xóa Thành Công!");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Xóa Thất Bại!");
		} finally {
			session.close();
		}
		return "redirect:/admin/hanghoa/index.htm";
	}
}
