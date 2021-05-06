package ptithcm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.entity.HoaDon;

@Transactional
@Controller
@RequestMapping("/admin/")
public class AdminController {
	@Autowired
	SessionFactory factory;

	@RequestMapping("admin")
	public String admin(ModelMap model) {
		return "admin/admin";
	}

	@RequestMapping(value = "logout")
	public String logout(HttpSession session2) {
		session2.removeAttribute("admin");
		return "login";
	}

	@RequestMapping(value = "xem", method = RequestMethod.POST)
	public String insert(ModelMap model, @RequestParam("tuNgay") String tuNgay, @RequestParam("toiNgay") String toiNgay) {
		System.out.println(tuNgay);
		System.out.println(toiNgay);
//		if (tuNgay.compareTo(toiNgay) > 0) {
//			errors.rejectValue("tuNgay", "tuNgay", "Vui Lòng Chọn Từ Ngày Bé Hơn Tới Ngày");
//		}
//		if (errors.hasErrors()) {
//			model.addAttribute("message", "Vui lòng sửa các lỗi sau");
//		} else {
			Session session = factory.getCurrentSession();
			String hql = "FROM HoaDon where ngayBan >= '"+ tuNgay +"' and ngayBan <= '" + toiNgay + "' and tinhTrang='true'";
			System.out.println(hql);
			Query query = session.createQuery(hql);
			List<HoaDon> list = query.list();
			model.addAttribute("dsHoaDon",list);
			long tong = 0;
			for(HoaDon u : list) {
				tong += u.getTongTien();
			}
			model.addAttribute("tongTien",tong);
//		}
		return "admin/admin";
	}
}
