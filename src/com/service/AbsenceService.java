package com.service;

import java.sql.SQLException;
import java.util.List;

import com.entity.AbsencePeople;
import com.entity.People;


public interface AbsenceService {

	
	//按学号用户名查询单个学生缺勤记录
	public List<AbsencePeople> queryAbsStuByUsername(String username) throws SQLException, ClassNotFoundException;
	
	//按学号查询请假未受理学生信息
	public List<AbsencePeople> queryAbsingStuByUsername(String username) throws SQLException, ClassNotFoundException;
	
	//学生申请请假
	public void AskAbsence(AbsencePeople absencePeople);
	
	
	//查询所有缺勤学生
	public List<AbsencePeople> queryAllAbsedStu();
	
	//按名查询缺勤学生
	public List<AbsencePeople> queryAbsedStuByName(String student);
	
	//查询所有请假未受理学生信息
	public List<AbsencePeople> dealAbsingStu();
	
	//按名查询未受理学生信息
	public List<AbsencePeople> dealAbsingStuByName(String student);
	
	//管理增加缺勤信息
	public boolean addAbsence(AbsencePeople absencePeople);
	
	//根据学号和姓名查询缺勤学生/判断是否存在该学号和学生姓名 
	public AbsencePeople queryAbsStuByUseAndName(AbsencePeople absencePeople);
	
	//批准请假
	public void agreeAbs(int id);
	
	//拒绝请假
	public void refuseAbs(int id);
	
}
