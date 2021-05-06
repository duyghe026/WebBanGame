package ptithcm.controller;

import java.util.Date;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.persistence.criteria.CriteriaBuilder.In;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import javax.websocket.server.PathParam;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.entity.CTHoaDon;
import ptithcm.entity.HangHoa;
import ptithcm.entity.HoaDon;
import ptithcm.entity.TheLoai;
import ptithcm.entity.User;

@Transactional
@Controller
@RequestMapping("/main/")
public class MainController {
	@Autowired
	SessionFactory factory;

	User getuser;

	HoaDon giohang;

	@ModelAttribute("dsTheLoai")
	public List<TheLoai> getTheLoai() {
		Session session = factory.getCurrentSession();
		String hql = "FROM TheLoai";
		Query query = session.createQuery(hql);
		List<TheLoai> list = query.list();
		return list;
	}

	@RequestMapping(value = "addtocart/{maHangHoa}", method = RequestMethod.POST)
	public String addtocart(ModelMap model, @PathVariable("maHangHoa") String maHangHoa) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		if (getuser == null) {
			return "redirect:/main/login.htm";
		} else {
			if (giohang == null) {
				giohang = new HoaDon();
				giohang.setNgayBan(null);
				giohang.setUser(getuser);
				giohang.setTinhTrang(false);
				try {
					session.save(giohang);
				} catch (Exception e) {
					t.rollback();
				}

				CTHoaDon cTHoaDon = new CTHoaDon();
				HangHoa hangHoa = (HangHoa) session.get(HangHoa.class, maHangHoa);
				cTHoaDon.setHangHoa(hangHoa);
				cTHoaDon.setHoaDon(giohang);
				cTHoaDon.setSoLuong(1);
				try {
					session.save(cTHoaDon);
					t.commit();
				} catch (Exception e) {
					t.rollback();
				} finally {
					session.close();
				}
				return "redirect:/main/index.htm";
			} else {
				String hql = "from CTHoaDon where maHanghoa = '" + maHangHoa + "' and maHoaDon = "
						+ giohang.getMaHoaDon() + "";
				Query query = session.createQuery(hql);
				List<CTHoaDon> list = query.list();
				if (list.size() == 0) {
					HangHoa hangHoa = (HangHoa) session.get(HangHoa.class, maHangHoa);
					CTHoaDon cTHoaDon = new CTHoaDon();
					cTHoaDon.setHangHoa(hangHoa);
					cTHoaDon.setHoaDon(giohang);
					cTHoaDon.setSoLuong(1);
					try {
						session.save(cTHoaDon);
						t.commit();
					} catch (Exception e) {
						t.rollback();
					} finally {
						session.close();
					}
				} else {
					list.get(0).setSoLuong(list.get(0).getSoLuong() + 1);
					try {
						session.save(list.get(0));
						t.commit();
					} catch (Exception e) {
						t.rollback();
					} finally {
						session.close();
					}
				}
				return "redirect:/main/index.htm";
			}
		}
	}

	@RequestMapping("giohang")
	public String giohang(ModelMap model) {
		System.out.println(getuser);
		if (getuser != null) {
			if (giohang != null) {
				Session session = factory.getCurrentSession();
				String hql = "from HoaDon where maHoaDon = " + giohang.getMaHoaDon();
				Query query = session.createQuery(hql);
				List<HoaDon> list = query.list();
				model.addAttribute("hoaDon", list.get(0));
				return "giohang";				
			} else {
				return "giohang";
			}
		}else {
			return "login";
		}	
	}

	@RequestMapping(value = "xoa/{maCTHoaDon}")
	public String xoa(ModelMap model, @PathVariable("maCTHoaDon") Integer maCTHoaDon) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		CTHoaDon ctHoaDon = (CTHoaDon) session.get(CTHoaDon.class, maCTHoaDon);
		try {
			session.delete(ctHoaDon);
			t.commit();
		} catch (Exception e) {
			t.rollback();
		} finally {
			session.close();
		}
		return "redirect:/main/giohang.htm";
	}

	@RequestMapping(value = "tru/{maCTHoaDon}")
	public String tru(ModelMap model, @PathVariable("maCTHoaDon") Integer maCTHoaDon) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		CTHoaDon ctHoaDon = (CTHoaDon) session.get(CTHoaDon.class, maCTHoaDon);
		ctHoaDon.setSoLuong(ctHoaDon.getSoLuong() - 1);
		if (ctHoaDon.getSoLuong() > 0) {
			try {
				session.update(ctHoaDon);
				t.commit();
			} catch (Exception e) {
				t.rollback();
			} finally {
				session.close();
			}
		} else {
			try {
				session.delete(ctHoaDon);
				t.commit();
			} catch (Exception e) {
				t.rollback();
			} finally {
				session.close();
			}
		}
		return "redirect:/main/giohang.htm";
	}

	@RequestMapping(value = "cong/{maCTHoaDon}")
	public String cong(ModelMap model, @PathVariable("maCTHoaDon") Integer maCTHoaDon) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		CTHoaDon ctHoaDon = (CTHoaDon) session.get(CTHoaDon.class, maCTHoaDon);
		ctHoaDon.setSoLuong(ctHoaDon.getSoLuong() + 1);
		try {
			session.update(ctHoaDon);
			t.commit();
		} catch (Exception e) {
			t.rollback();
		} finally {
			session.close();
		}
		return "redirect:/main/giohang.htm";
	}

	@RequestMapping("timkiem")
	public String timkiem(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "FROM HangHoa where tinhTrang=true";
		Query query = session.createQuery(hql);
		List<HangHoa> list = query.list();
		model.addAttribute("dsHangHoa", list);
		return "timkiem";
	}

	@RequestMapping(value = "timkiem", params = "maLoai", method = RequestMethod.GET)
	public String chitiethanghoa(ModelMap model, @PathParam("maLoai") String maLoai) {
		Session session = factory.getCurrentSession();
		String hql = "from HangHoa where theLoai.maLoai = '" + maLoai + "' and tinhTrang=true";
		Query query = session.createQuery(hql);
		List<HangHoa> list = query.list();
		model.addAttribute("dsHangHoa", list);
		return "timkiem";
	}

	@RequestMapping("index")
	public String index(ModelMap model) {				
		Session session1 = factory.getCurrentSession();
		String hql = "FROM HangHoa where tinhTrang=true";
		Query query = session1.createQuery(hql);
		List<HangHoa> list = query.list();
		model.addAttribute("dsHangHoa", list);

		if (getuser != null) {
			System.out.println("so lelelelelel");
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			String hql1 = "from HoaDon where user.iDUser = '" + getuser.getiDUser() + "' and tinhTrang=false";
			Query query1 = session.createQuery(hql1);
			List<HoaDon> list1 = query1.list();
			if (list1.size() != 0) {
				giohang = list1.get(0);
				return "index";
			} else {
				giohang = null;
				return "index";
			}
		} else {
			return "index";
		}
	}

	@RequestMapping("thanhtoan")
	public String thanhtoan() {
		if(giohang != null) {
			if (giohang.getTongTien() > 1) {
				Session session = factory.openSession();
				Transaction t = session.beginTransaction();
				HoaDon hoaDon = (HoaDon) session.get(HoaDon.class, giohang.getMaHoaDon());
				hoaDon.setNgayBan(new Date());
				hoaDon.setTinhTrang(true);
				try {
					session.update(hoaDon);
					t.commit();
				} catch (Exception e) {
					t.rollback();
				} finally {
					session.close();
				}
			}			
			return "giohang";
		}
		return "giohang";
	}
	
	@RequestMapping("lichsu")
	public String lichsu(ModelMap model) {
		if (getuser != null) {
			Session session = factory.getCurrentSession();
			String hql = "FROM HoaDon where user.iDUser = '"+ getuser.getiDUser() +"' and tinhTrang='true'";
			Query query = session.createQuery(hql);
			List<HoaDon> list = query.list();
			model.addAttribute("dsHoaDon", list);
			return "lichsu";
		}	
		return "lichsu";
	}
	
	@RequestMapping("lichsu/{maHoaDon}")
	public String lichsuCT(ModelMap model,@PathVariable("maHoaDon") Integer maHoaDon) {
		if (getuser != null) {
			Session session = factory.getCurrentSession();
			String hql = "FROM CTHoaDon where maHoaDon = '"+ maHoaDon +"'";
			Query query = session.createQuery(hql);
			List<CTHoaDon> list = query.list();
			model.addAttribute("dsCTHoaDon", list);
			return "lichsu";
		}	
		return "lichsu";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}

	@RequestMapping(value = "logout")
	public String logout(HttpSession session2) {
		session2.removeAttribute("user");
		session2.removeAttribute("admin");
		getuser = null;
		giohang = null;
		return "redirect:/main/login.htm";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(ModelMap model, @RequestParam("iDUser") String iDUser,
			@RequestParam("password") String password, HttpSession session2) {

		Session session = factory.getCurrentSession();
		String hql = "FROM User WHERE iDUser='" + iDUser + "' AND password='" + password + "'";
		Query query = session.createQuery(hql);
		List<User> list = query.list();
		if (list.isEmpty() == false) {
			getuser = list.get(0);
			if (getuser.getType() == true) {
				session2.setAttribute("admin", getuser);
				return "redirect:/admin/admin.htm";
			} else if (getuser.getType() == false) {
				session2.setAttribute("user", getuser);
				return "redirect:/main/index.htm";
			}
			return "redirect:/main/index.htm";
		}
		model.addAttribute("message", "Đăng nhập thất bại!");
		return "login";
	}
	
	@RequestMapping(value = "dangki", method = RequestMethod.GET)
	public String insert(ModelMap model) {
		model.addAttribute("user", new User());
		return "dangki";
	}

	@RequestMapping(value = "dangki", method = RequestMethod.POST)
	public String insert(ModelMap model, @ModelAttribute("user") User user, BindingResult errors) {
		user.setType(false);
		if (user.getiDUser().trim().length() == 0) {
			errors.rejectValue("iDUser", "iDUser", "Vui Lòng Nhập Họ Tên");
		}
		if (user.getPassword().trim().length() == 0) {
			errors.rejectValue("password", "password", "Vui Lòng Nhập Mật Khẩu");
		}
		if (user.getUserName().trim().length() == 0) {
			errors.rejectValue("userName", "userName", "Vui Lòng Nhập Tên Tài Khoản");
		}
		if (user.getEmail().trim().length() == 0) {
			errors.rejectValue("email", "email", "Vui Lòng Nhập Email");
		}
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau");
		} else {
			model.addAttribute("message", "Chúc Mừng Bạn Đã Nhập Đúng");
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				session.save(user);
				t.commit();
				model.addAttribute("message", "Đăng Kí Thành Công!");
			} catch (Exception e) {
				t.rollback();
				model.addAttribute("message", "Đăng Kí Thất Bại!");
			} finally {
				session.close();
			}
		}
		return "dangki";
	}

	@RequestMapping(value = "taikhoan", method = RequestMethod.GET)
	public String taikhoan(ModelMap model) {
		Session session = factory.getCurrentSession();
		User user = (User) session.get(User.class, getuser.getiDUser());
		model.addAttribute("user", user);
		return "taikhoan";
	}

	@RequestMapping(value = "taikhoan/update", method = RequestMethod.POST)
	public String taikhoan(ModelMap model, @ModelAttribute("user") User user) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(user);
			t.commit();
			model.addAttribute("message", "Cập Nhật Thành Công!");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Cập Nhật Thất Bại!");
		} finally {
			session.close();
		}
		return taikhoan(model);
	}

	@RequestMapping(value = "quenmatkhau", method = RequestMethod.GET)
	public String quenmatkhau(ModelMap model) {
		return "quenmatkhau";
	}

	@Autowired
	JavaMailSender mailer;

	@RequestMapping(value = "quenmatkhau", method = RequestMethod.POST)
	public String quenmatkhau(ModelMap model, @RequestParam("email") String to) {
		System.out.println(to);
		try {
			// Tạo mail
			Session session = factory.getCurrentSession();
			String hql = "FROM User WHERE email='" + to + "'";
			System.out.println(hql);
			Query query = session.createQuery(hql);
			List<User> list = query.list();

			User user = list.get(0);

			String from = "STEAMSHOP";
			String body = "Taikhoan:" + user.getiDUser() + "\nPassword:" + user.getPassword();
			String subject = "QuênMậtKhẩu";
			System.out.println(body);

			MimeMessage mail = mailer.createMimeMessage();
			// Sử dụng lớp trợ giúp
			MimeMessageHelper helper = new MimeMessageHelper(mail);

			helper.setFrom(from, from);
			helper.setTo(to);
			helper.setReplyTo(from, from);
			helper.setSubject(subject);
			helper.setText(body);

			// Gửi mail
			mailer.send(mail);

			model.addAttribute("message", "Gửi mail thành công");
		} catch (Exception ex) {
			model.addAttribute("message", "Gửi mail thất bại");
		}
		return "quenmatkhau";
	}

	@RequestMapping("about")
	public String about() {
		return "about";
	}

	@RequestMapping("contact")
	public String contact() {
		return "contact";
	}

	@RequestMapping("delivery")
	public String delivery() {
		return "delivery";
	}

	@RequestMapping("news")
	public String news() {
		return "news";
	}
}
