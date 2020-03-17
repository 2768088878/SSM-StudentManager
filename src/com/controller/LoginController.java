package com.controller;





import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.entity.People;
import com.mapper.AbsenceMapper;
import com.service.PeopleService;
import com.service.impl.SendMailImpl;


@Controller
//指定返回路径

@RequestMapping("login")
public class LoginController {
	
	//依赖Service
	@Autowired
	PeopleService peopleService;
	
	@Autowired
	AbsenceMapper absenceMapper;
	
	
	
	//学生登录
	@RequestMapping("studentLogin.do")
	public String studentLogin(People people,HttpServletRequest req,HttpServletResponse resp){
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html; charset=UTF-8"); //转码
		HttpSession session = req.getSession();
		String imageText = req.getParameter("image");
		// 图片的验证码
		String text = (String) req.getSession().getAttribute("text");
		String username=req.getParameter("userName");
		String pwd=req.getParameter("pwd");
		
		
		try {
			if (peopleService.LoginStudent(people)!=1||!text.equalsIgnoreCase(imageText)) {
	            PrintWriter printWriter = resp.getWriter();
	            printWriter.flush();
	            printWriter.println("<script>");
	            printWriter.println("alert('登录失败！');");
	            printWriter.println("history.back();");//这种不会刷新页面
	            printWriter.println("history.go(0);");//这种会刷新页面
	            printWriter.println("</script>");
	            return null;	
				
			}else {
				session.setAttribute("username", people.getUserName());
				session.setAttribute("pwd", people.getPwd());
				System.out.println("学生登录成功:"+username+"......"+pwd);
				session.setMaxInactiveInterval(30*60);//30秒
				
					//是否勾选了记住密码
			        String isPwdRemember = req.getParameter("pwdRemember");
			        System.out.println("pwdRemember"+isPwdRemember);
			        if("true".equals(isPwdRemember))
			        {
			            //将用户名和密码放入cookie  Cookie("remember",username+"#"+pwd+"#"+isPwdRemember);
			            Cookie rememberUserCookie = new Cookie("remember", username+"#"+pwd+"#"+isPwdRemember);
			            rememberUserCookie.setPath("/");
			            resp.addCookie(rememberUserCookie);
			        }
			        
//				登录进来的时候查询通知
			    int isView=absenceMapper.isView(username);
			    
			    req.getSession().setAttribute("isView", isView); 
				return "index";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "forward:/Loginindex.jsp";
		}

		
		
	}

	
	//管理登录
		@RequestMapping("adminLogin.do")
		public String adminLogin(People people,HttpServletRequest req){
			HttpSession session = req.getSession();
			/*
			        拿到页面传过来的手动输入的验证码, 该验证码要和生成图片上的
			        文本验证码比较, 如果相同, 验证码输入成功!
			*/
			String imageText = req.getParameter("image");
			// 图片的验证码
			String text = (String) req.getSession().getAttribute("text");
			System.out.println("imageText:"+imageText+",text:"+text);
			try {
				if (peopleService.adminLogin(people)!=1||!text.equalsIgnoreCase(imageText)) {
					System.out.println("管理登录失败");
					session.invalidate();		
				}else {
					session.setAttribute("username", people.getUserName());
					session.setAttribute("pwd", people.getPwd());
					System.out.println("管理员登录成功");
					session.setMaxInactiveInterval(30*60);//30秒
					
//					管理登录进来的时候查询通知
				    int count=absenceMapper.absCount();
				    
				    System.out.println("count:"+count);
				    session.setAttribute("absCount", count); 
					return "Adminindex";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			


			return "redirect:/MLoginindex.jsp";
				
			
		}
	
	//学生注册
		@RequestMapping("studentRegister.do")
		public String registerStudent(People people,HttpServletResponse resp) throws IOException{
	        resp.setCharacterEncoding("utf-8");
	        resp.setContentType("text/html; charset=UTF-8"); //转码
			PrintWriter printWriter = resp.getWriter();
			try {
				if (peopleService.addPeople(people,people.getUserName())) {
		            printWriter.flush();
		            printWriter.println("<script>");
		            printWriter.println("alert('注册成功！');");
		            printWriter.println("history.back();");//这种不会刷新页面
		            printWriter.println("history.go(0);");//这种会刷新页面
		            printWriter.println("</script>");
					return null;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
            printWriter.flush();
            printWriter.println("<script>");
            printWriter.println("alert('注册成功！');");
            printWriter.println("history.back();");//这种不会刷新页面
            printWriter.println("history.go(0);");//这种会刷新页面
            printWriter.println("</script>");
            return null;

		}
		
		
		
		//注销
		@RequestMapping("/sessionInvalidate.do")
		public String sessionInvalidate(HttpServletRequest req){
			HttpSession session = req.getSession();
			session.invalidate();
		
			return "redirect:/Loginindex.jsp";
		}
		
		
		
	//邮箱找回密码
	@RequestMapping("findPwd.do")
	public String findPwd(HttpServletRequest req,Model model){
		String email=req.getParameter("uemail");
		
		//实例化一个发送邮件的对象
		SendMailImpl mySendMail = new SendMailImpl();
		People people=new People();
		
		try {
			//通过邮箱找学生是否存在
			people=peopleService.queryStuByEmail(email);
			
			if (people!=null) {
				mySendMail.sendMail(email, "管理系统提醒，请前往以下页面修改新密码：http://localhost:8080/StudentManager/to/updatePassword.do?");
				System.out.println("请根据邮箱发送的链接修改密码");
//				req.getServletContext().setAttribute("email",email);
				req.getSession().setAttribute("email",email);
				return "forward:/FindPwd.html";
			}else {
				System.out.println("该邮箱未注册，请重新输入！");
				return "forward:/FindPwd.html";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/FindPwd.html";
		}
		
		
	}
	
	
	
	
	//修改密码
	@RequestMapping("updatePwd.do")
	public String updatePwd(People people,HttpServletRequest req){
		String email=(String) req.getSession().getAttribute("email");
		System.out.println(email);
		if (email!=null||"".equals(email)) {
			peopleService.updatePwd(people);
			JOptionPane.showMessageDialog(null, "密码修改成功");
		}else {
			JOptionPane.showMessageDialog(null, "错误");
		}
		
		return "redirect:/Loginindex.jsp";
	}
}
