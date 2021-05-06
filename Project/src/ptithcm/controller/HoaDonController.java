package ptithcm.controller;

import java.util.List;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ptithcm.entity.CTHoaDon;
import ptithcm.entity.HangHoa;
import ptithcm.entity.HoaDon;
import ptithcm.entity.TheLoai;
import ptithcm.entity.User;

@Transactional
@Controller
@RequestMapping("/admin/hoadon/")
public class HoaDonController {
	@Autowired
	SessionFactory factory;
	
	@ModelAttribute("dsUser")
	public List<User> getdsUser() {
		Session session = factory.getCurrentSession();
		String hql = "FROM User";
		Query query = session.createQuery(hql);
		List<User> list = query.list();
		return list;
	}
	
	@ModelAttribute("dsHangHoa")
	public List<HangHoa> getdsHangHoa() {
		Session session = factory.getCurrentSession();
		String hql = "FROM HangHoa";
		Query query = session.createQuery(hql);
		List<HangHoa> list = query.list();
		return list;
	}
	
	@RequestMapping("index")
	public String index(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "from HoaDon";
		Query query = session.createQuery(hql);
		List<HoaDon> list = query.list();
		model.addAttribute("dsHoaDon", list);
		return "admin/hoadon/index";
	}

	@RequestMapping(value = "insert", method = RequestMethod.GET)
	public String insert(ModelMap model) {
		model.addAttribute("hoaDon", new HoaDon());
		return "admin/hoadon/insert";
	}

	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String insert(ModelMap model, @ModelAttribute("hoaDon") HoaDon hoaDon, BindingResult errors) {
		if (hoaDon.getUser().getiDUser().trim().length() == 0) {
			errors.rejectValue("user.iDUser", "user.iDUser", "Vui Lòng Nhập ID USER");
		}
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau");
		} else {
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				session.save(hoaDon);
				t.commit();
				model.addAttribute("message", "Thêm Mới Thành Công!");
			} catch (Exception e) {
				t.rollback();
				model.addAttribute("message", "Thêm Mới Thất Bại!");
			} finally {
				session.close();
			}
		}
		return "admin/hoadon/insert";
	}

	@RequestMapping(value = "chitiethoadon/{maHoaDon}/insert", method = RequestMethod.GET)
	public String insertCTHoaDon(ModelMap model) {
		model.addAttribute("cTHoaDon", new CTHoaDon());
		return "redirect:/admin/hoadon/chitiethoadon.htm";
	}

	@RequestMapping(value = "chitiethoadon/{maHoaDon}/insert", method = RequestMethod.POST)
	public String insertCTHoaDon(ModelMap model, @ModelAttribute("cTHoaDon") CTHoaDon cTHoaDon,
			@PathVariable("maHoaDon") Integer maHoaDon, BindingResult errors,RedirectAttributes redirectAttributes) {

		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		String hql = "FROM HoaDon where maHoaDon = '" + maHoaDon + "'";
		Query query = session.createQuery(hql);
		List<HoaDon> list = query.list();
		HoaDon hoaDon = list.get(0);
		for (CTHoaDon u : hoaDon.getDsCTHoaDon()) {
			if (u.getHangHoa().getMaHangHoa().equals(cTHoaDon.getHangHoa().getMaHangHoa())) {
				String hql1 = "FROM CTHoaDon where hoaDon.maHoaDon = " + maHoaDon + " and hangHoa.maHangHoa = '"
						+ cTHoaDon.getHangHoa().getMaHangHoa() + "'";
				Query query1 = session.createQuery(hql1);
				List<CTHoaDon> list1 = query1.list();
				CTHoaDon cTHoaDon1 = list1.get(0);
				cTHoaDon1.setSoLuong(cTHoaDon.getSoLuong());
				try {
					session.update(cTHoaDon1);
					t.commit();
					redirectAttributes.addFlashAttribute("message", "Cập Nhật Thành Công!");
				} catch (Exception e) {
					t.rollback();
					redirectAttributes.addFlashAttribute("message", "Cập Nhật Thất Bại!");
				} finally {
					session.close();
				}
				return "redirect:/admin/hoadon/chitiethoadon/{maHoaDon}.htm";
			}
		}
		cTHoaDon.setHoaDon(hoaDon);
		try {
			session.save(cTHoaDon);
			t.commit();
			redirectAttributes.addFlashAttribute("message", "Thêm Mới Thành Công!");
		} catch (Exception e) {
			t.rollback();
			redirectAttributes.addFlashAttribute("message", "Thêm Mới Thất Bại!");
		} finally {
			session.close();
		}
		return "redirect:/admin/hoadon/chitiethoadon/{maHoaDon}.htm";
	}

	@RequestMapping(value = "chitiethoadon/{maHoaDon}/update/{maCTHoaDon}", method = RequestMethod.GET)
	public String updateCTHoaDon(ModelMap model, @PathVariable("maCTHoaDon") Integer maCTHoaDon,
			@PathVariable("maHoaDon") Integer maHoaDon) {
		Session session = factory.getCurrentSession();
		CTHoaDon cTHoaDon = (CTHoaDon) session.get(CTHoaDon.class, maCTHoaDon);
		String hql = "from HoaDon where maHoaDon = " + maHoaDon;
		Query query = session.createQuery(hql);
		List<HoaDon> list = query.list();
		model.addAttribute("hoaDon", list.get(0));
		model.addAttribute("maHoaDon", maHoaDon);
		model.addAttribute("cTHoaDon", cTHoaDon);
		return "admin/hoadon/chitiethoadon";
	}

	@RequestMapping(value = "chitiethoadon/{maHoaDon}/delete/{maCTHoaDon}", method = RequestMethod.GET)
	public String deleteCTHoaDon(ModelMap model, @PathVariable("maCTHoaDon") Integer maCTHoaDon) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			CTHoaDon cTHoaDon = (CTHoaDon) session.get(CTHoaDon.class, maCTHoaDon);
			session.delete(cTHoaDon);
			t.commit();
			model.addAttribute("message", "Xóa Thành Công!");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", e.toString());
		} finally {
			session.close();
		}
		return "redirect:/admin/hoadon/chitiethoadon/{maHoaDon}.htm";
	}

	@RequestMapping(value = "chitiethoadon/{maHoaDon}", method = RequestMethod.GET)
	public String chitiethoadon(ModelMap model, @PathVariable("maHoaDon") Integer maHoaDon) {
		Session session = factory.getCurrentSession();
		String hql = "from HoaDon where maHoaDon = " + maHoaDon;
		Query query = session.createQuery(hql);
		List<HoaDon> list = query.list();
		model.addAttribute("hoaDon", list.get(0));
		model.addAttribute("cTHoaDon", new CTHoaDon());
		model.addAttribute("maHoaDon", maHoaDon);
		return "admin/hoadon/chitiethoadon";
	}

	@RequestMapping(value = "update/{maHoaDon}", method = RequestMethod.GET)
	public String update(ModelMap model, @PathVariable("maHoaDon") Integer maHoaDon) {
		Session session = factory.getCurrentSession();
		HoaDon hoaDon = (HoaDon) session.get(HoaDon.class, maHoaDon);
		model.addAttribute("hoaDon", hoaDon);
		return "admin/hoadon/update";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(ModelMap model, @ModelAttribute("hoaDon") HoaDon hoaDon, BindingResult errors) {
		if (hoaDon.getUser().getiDUser().trim().length() == 0) {
			errors.rejectValue("iDUser", "iDUser", "Vui Lòng Nhập ID USER");
		} else {
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				session.update(hoaDon);
				t.commit();
				model.addAttribute("message", "Cập Nhật Thành Công!");
			} catch (Exception e) {
				t.rollback();
				model.addAttribute("message", "Cập Nhật Thất Bại!");
			} finally {
				session.close();
			}
		}
		return index(model);
	}

	@RequestMapping(value = "delete/{maHoaDon}", method = RequestMethod.GET)
	public String delete(ModelMap model, @PathVariable("maHoaDon") Integer maHoaDon) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			HoaDon hoaDon = (HoaDon) session.get(HoaDon.class, maHoaDon);
			for (var cthd : hoaDon.getDsCTHoaDon()) {
				session.delete(cthd);
			}
			session.delete(hoaDon);
			t.commit();
			model.addAttribute("message", "Xóa Thành Công!");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", e.toString());
		} finally {
			session.close();
		}
		return index(model);
	}
}