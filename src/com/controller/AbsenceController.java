package com.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.entity.AbsencePeople;
import com.mapper.AbsenceMapper;
import com.service.AbsenceService;
import com.sun.javafx.sg.prism.NGShape.Mode;

@Controller
@RequestMapping("Absence")
public class AbsenceController {

	@Autowired
	AbsenceService absenceService;
	
	@Autowired
	AbsenceMapper absenceMapper;
	
	//学生查询自己已缺勤的信息
	@RequestMapping("queryAbsStuByUsername.do")
	public String queryAbsStuByUsername(@RequestParam String username,Model model) {
		try {
			List<AbsencePeople> peoples=absenceService.queryAbsStuByUsername(username);
			System.out.println(peoples);
			model.addAttribute("peoples", peoples);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "student-absence";
		
	}
	
	
	//学生查询自己未受理请假的信息
	@RequestMapping("queryAbsingStuByUsername.do")
	public String queryAbsStuingByUsername(@RequestParam String username,Model model,HttpServletRequest request) {
		
			absenceMapper.hasView(username);
			int isView=absenceMapper.isView(username);
		    
			request.getSession().setAttribute("isView", isView); 
		try {
			List<AbsencePeople> peoples=absenceService.queryAbsingStuByUsername(username);
			System.out.println(peoples);
			model.addAttribute("peoples", peoples);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "student-absenceResult";
		
	}
	
	//学生请假
	@RequestMapping("AskAbsence.do")
	public String AskAbsence(AbsencePeople absencePeople,Model model) {
		System.out.println(absencePeople.getUsername());
		try {
			if (absenceService.AskAbsence(absencePeople)) {
				JOptionPane.showMessageDialog(null, "申请成功");
			}else {
				JOptionPane.showMessageDialog(null, "没有该学生！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			JOptionPane.showMessageDialog(null, "申请失败");
		}
		return "redirect:/to/student-askforleave.do?username="+absencePeople.getUsername();
		
	}
	
	
	//查询所有缺勤学生
	@RequestMapping("queryAllAbsedStu.do")
	public String queryAllAbsedStu(Model model) {
		try {
			List<AbsencePeople> peoples=absenceService.queryAllAbsedStu();
			System.out.println(peoples);
			model.addAttribute("ap", peoples);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin-absence";
		
	}
	
	//查询所有缺勤学生
		@RequestMapping("queryAbsedStuByName.do")
		public String queryAbsedStuByName(@RequestParam String student,Model model) {
			try {
				List<AbsencePeople> peoples=absenceService.queryAbsedStuByName(student);
				System.out.println(peoples);
				model.addAttribute("ap", peoples);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "admin-absence";
			
		}
		
	//查询所有未处理请假的学生信息
	@RequestMapping("dealAbsingStu.do")
	public String dealAbsingStu(Model model,HttpServletRequest request) {
		int count=absenceMapper.absCount();
		try {
			List<AbsencePeople> peoples=absenceService.dealAbsingStu();
			System.out.println(peoples);
			model.addAttribute("nd", peoples);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getSession().setAttribute("absCount", count);
		return "admin-absenceResult";
		
	}
	
	//按名查询所有未处理请假的学生信息
	@RequestMapping("dealAbsingStuByName.do")
	public String dealAbsingStuByName(@RequestParam String student,Model model) {
		try {
			List<AbsencePeople> peoples=absenceService.dealAbsingStuByName(student);
			System.out.println(peoples);
			model.addAttribute("nd", peoples);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin-absenceResult";
		
	}
	
	//管理增加缺勤信息
	@RequestMapping("addAbsence.do")
	public String addAbsence(AbsencePeople absencePeople) {
		try {
			if (absenceService.addAbsence(absencePeople)) {
				JOptionPane.showMessageDialog(null, "增加成功");
			}else {
				JOptionPane.showMessageDialog(null, "姓名或者学号有误!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/to/admin-addleave.do";
		
	}
	
	
	//同意请假
	@RequestMapping("agreeAbsence.do")
	public String agreeAbsence(@RequestParam int id,Model model) {
		List<AbsencePeople> peoples=absenceService.dealAbsingStu();
		//新增提示
		absenceMapper.setView(id);
		model.addAttribute("nd", peoples);
		try {
			absenceService.agreeAbs(id);
			JOptionPane.showMessageDialog(null, "同意成功");
			
		} catch (Exception e) {
			e.printStackTrace();
			JOptionPane.showMessageDialog(null, "操作失败");
		}
		return "redirect:/Absence/dealAbsingStu.do";
		
	}
	
	//拒绝请假
	@RequestMapping("refuseAbsence.do")
	public String refuseAbsence(@RequestParam int id,Model model) {
		List<AbsencePeople> peoples=absenceService.dealAbsingStu();
		model.addAttribute("nd", peoples);
		try {
			absenceService.refuseAbs(id);
			JOptionPane.showMessageDialog(null, "拒绝成功");
			
		} catch (Exception e) {
			e.printStackTrace();
			JOptionPane.showMessageDialog(null, "操作失败");
		}
		return "redirect:/Absence/dealAbsingStu.do";
		
	}
	
	
	
	
}
