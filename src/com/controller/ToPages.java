package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("to")
public class ToPages {

	//前往申请请假页
	@RequestMapping("student-askforleave.do")
	public String toAskAbsence(@RequestParam String username,Model model) {
		model.addAttribute("username", username);
		return "student-askforleave";
	}

	
	//管理前往增加页
	@RequestMapping("admin-addleave.do")
	public String toaddleave() {
		return "admin-addleave";
	}
	
	//学生前往文件页
	@RequestMapping("File.do")
	public String toFile() {
		return "student-uplist";
	}
	
	//管理前往文件页
	@RequestMapping("AdminFile.do")
	public String toAdminFile() {
		return "member-uplist";
	}
	
	//前往修改密码页
	@RequestMapping("updatePassword.do")
	public String updatePassword() {
		return "updatePwd";
	}
}
