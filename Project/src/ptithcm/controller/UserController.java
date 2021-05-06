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

import ptithcm.entity.User;

@Transactional
@Controller
@RequestMapping("admin/user/")
public class UserController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("index")
	public String index(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "from User";
		Query query = session.createQuery(hql);
		List<User> list = query.list();
		model.addAttribute("users",list);
		return "admin/user/index";
	}
	
	@RequestMapping(value="insert",method=RequestMethod.GET)
	public String insert(ModelMap model)
	{
		model.addAttribute("user",new User());
		return "admin/user/insert";
	}
	
	@RequestMapping(value="insert",method=RequestMethod.POST)
	public String insert(ModelMap model,@ModelAttribute("user")User user,BindingResult errors)
	{
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
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {		
				session.save(user);
				t.commit();
				model.addAttribute("message","Thêm Mới Thành Công!");
			}
			catch (Exception e) {
				t.rollback();
				model.addAttribute("message","Thêm Mới Thất Bại!");
			}
			finally {
				session.close();
			}
		}		
		return "admin/user/insert";
	}
	
	@RequestMapping(value="update/{iDUser}",method=RequestMethod.GET)
	public String update(ModelMap model,@PathVariable("iDUser") String iDUser)
	{
		Session session = factory.getCurrentSession();
		User user = (User) session.get(User.class, iDUser);
		model.addAttribute("user",user);
		return "admin/user/update";
	}
	
	@RequestMapping(value="update",method=RequestMethod.POST)
	public String update(ModelMap model,@ModelAttribute("user")User user,BindingResult errors)
	{
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
			model.addAttribute("message", "Vui lòng sửa lỗi");
		} else {
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				session.update(user);
				t.commit();
				model.addAttribute("message","Cập Nhật Thành Công!");
			}
			catch (Exception e) {
				t.rollback();
				model.addAttribute("message","Cập Nhật Thất Bại!");
			}
			finally {
				session.close();
			}
		}	
		return index(model);
	}
	
	@RequestMapping(value="delete/{iDUser}",method=RequestMethod.GET)
	public String delete(ModelMap model,@PathVariable("iDUser")String iDUser)
	{
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			User user = (User)session.get(User.class,iDUser);
			session.delete(user);
			t.commit();
			model.addAttribute("message","Xóa Thành Công!");
		}
		catch (Exception e) {
			t.rollback();
			model.addAttribute("message","Xóa Thất Bại!");
		}
		finally {
			session.close();
		}
		return index(model);
	}
}
