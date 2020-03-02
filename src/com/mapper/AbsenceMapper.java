package com.mapper;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.entity.AbsencePeople;
import com.entity.People;


@Repository("absenceMapper")
public interface AbsenceMapper {
	
	//按学号查询缺勤学生信息
	public List<AbsencePeople> queryAbsedStuByUsername(String username);
	
	//按学号查询请假未受理学生信息 
	public List<AbsencePeople> queryAbsingStuByUsername(String username);
	
	//学生申请请假
	public void AskAbsence(AbsencePeople absencePeople);

	// 判断是否存在已有学生账号 
	public AbsencePeople isExistAbs(String username) throws SQLException, ClassNotFoundException;
	
	//查询所有已缺勤学生
	public List<AbsencePeople> queryAllAbsedStu();
	
	//按名查询缺勤学生
	public List<AbsencePeople> queryAbsedStuByName(String student);
	
	//查询所有请假未受理学生信息
	public List<AbsencePeople> dealAbsingStu();
	
	//按名查询未受理学生信息
	public List<AbsencePeople> dealAbsingStuByName(String student);
	
	//管理增加缺勤信息
	public void addAbsence(AbsencePeople absencePeople);
	
	//根据学号和姓名查询缺勤学生/判断是否存在该学号和学生姓名 
	public AbsencePeople queryAbsStuByUseAndName(AbsencePeople absencePeople);
	
	//批准请假
	public void agreeAbs(int id);
	
	//拒绝请假
	public void refuseAbs(int id);
	
	//登录进来后根据用户名查询
	public int isView(String username);
	
	//通知
	public void setView(int id);
	
	//已阅
	public void hasView(String username);
	
	//新请假申请通知数
	public int absCount();
	
	
	
	
	
	
	
	
	
	
	
	
	



}
