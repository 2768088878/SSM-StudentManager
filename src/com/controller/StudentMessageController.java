package com.controller;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Currency;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import org.eclipse.jdt.internal.compiler.lookup.InferenceContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.entity.People;
import com.service.PeopleService;

@Controller
@RequestMapping("stuMes")
public class StudentMessageController {
	
	@Autowired
	PeopleService peopleService;
	
	
	//查询单个学生
	@RequestMapping(value="queryStuByUsername.do")
	public String queryStuByUsername(@RequestParam String StuName,Model model) {
		
		People people;
		try {
			people = peopleService.queryStudentByUsername(StuName);
			model.addAttribute("people", people);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return "student-list";
	}
	
	
	//根据id打开单个学生的编辑页面
	@RequestMapping(value="toEditStu.do")
	public String toEditStu(@RequestParam int uid,Model model) {
		
		People people;
		try {
			people = peopleService.queryStudentByNo(uid);
			model.addAttribute("people", people);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return "student-input";
	}
	
	//修改单个学生的编辑页面
		@RequestMapping(value="updateStu.do")
		public String updateStu(People people,Model mode,HttpServletRequest request,HttpServletResponse response) {
			String msg="";
			try {
				peopleService.updateStudentById(people);
				msg="修改成功";
				request.setAttribute("msg", msg);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "student-list";
		}
		
		
		
		
	//管理查询所有学生
	@RequestMapping(value="queryAllStu.do")
	public String queryAllStu(Model model) {
		
		try {
			List<People> peoples = peopleService.queryAllStu();
			model.addAttribute("peoples", peoples);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return "member-list";
	}
	
	//管理分页查询所有学生
		@RequestMapping(value="queryAllStuByPage.do")
		public String queryAllStuByPage(Model model
										,@RequestParam(name="currentPage",defaultValue="1") String page,
										@RequestParam(name="major",required=false) String major,
										@RequestParam(name="classNo",required=false) Integer classNo,
										@RequestParam(name="name",required=false) String name,
										HttpServletRequest request) {
			
//			查询所有专业
			List<String> majors=peopleService.allMajors();
			String select=request.getParameter("select");
			
			
			int currentPage;
			try {
				currentPage=Integer.parseInt(page);
			} catch (Exception e) {
				currentPage=1;
			}
			
			
			int finalPage;
			int count = peopleService.studentCount();
			if (count%10==0) {
				finalPage=count/10;
			}else {
				finalPage=count/10+1;
			}
			
			int lastPage;
			if (currentPage==1) {
				lastPage=1;
			}else {
				lastPage=currentPage-1;
			}
			
			int nextPage;
			if (currentPage==finalPage) {
				nextPage=finalPage;
			}else {
				nextPage=currentPage+1;
			}
			
			try {
				List<People> peoples=null;
//				查询全部学生
				if ("all".equals(select)) {
					peoples = peopleService.queryAllStudentByPage((currentPage-1)*10);
					model.addAttribute("hide",1);
				}else if ("some".equals(select)){
					People people=new People();
					people.setMajor(major);
					people.setClassNo(classNo);
					people.setName(name);
					peoples = peopleService.queryStu(people);
					model.addAttribute("hide",0);
				}

				model.addAttribute("count",count);
				model.addAttribute("peoples", peoples);
				model.addAttribute("majors", majors);
				if (major!=null) {
					model.addAttribute("isMajor", major);
				}
				if (classNo!=null) {
					model.addAttribute("classNo", classNo);
				}
				model.addAttribute("currentPage", currentPage);
				model.addAttribute("lastPage", lastPage);
				model.addAttribute("nextPage", nextPage);
				model.addAttribute("finalPage", finalPage);
				
				
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			System.out.println("=="+select);
			return "member-list";
		}
	
	
	//管理根据id打开单个学生的编辑页面
		@RequestMapping(value="AdmintoEditStu.do")
		public String AdmintoEditStu(@RequestParam int id,Model model) {
			
			People people;
			try {
				people = peopleService.queryStudentByNo(id);
				model.addAttribute("people", people);
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			
			return "admin-input";
		}
	
	//管理删除学生
	@RequestMapping(value="delStu.do")
	public String delStu(@RequestParam("id") Integer id,@RequestParam("currentPage") Integer currentPage,Model model) {
		String msg="";
		try {
			peopleService.deletePeopleById(id);
			JOptionPane.showMessageDialog(null, "删除成功！");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/stuMes/queryAllStuByPage.do?currentPage="+currentPage+"&select=all";
		
		
		
	}

	//管理批量删除学生
	@RequestMapping(value="delMore.do")
	public String delMore(@RequestParam("ids") String ids,@RequestParam("currentPage") int page){
		List<Integer> lists = new ArrayList<Integer>();
		String[] str=ids.split(",");
		for(int i=0;i<str.length;i++){
			lists.add(Integer.parseInt(str[i]));
		}
		
		peopleService.deleteMore(lists);
		JOptionPane.showMessageDialog(null, "删除成功！");
		return "redirect:/stuMes/queryAllStuByPage.do?currentPage="+page+"&select=all";
	}
	
	//管理动态查询学生
//	@RequestMapping(value="queryStu.do")
//	public String queryStu(People people,Model model) {
//		
//		try {
//			List<People> peoples = peopleService.queryStu(people);
//			model.addAttribute("peoples", peoples);
//			System.out.println(peoples);
//		} catch (Exception e) {
//			
//			e.printStackTrace();
//		}
//		
//		return "redirect:/stuMes/queryAllStuByPage.do";
//	}
	
	
	
	
	
	
	
	
	
	
}
