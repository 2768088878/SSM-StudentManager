package com.service.impl;

import java.sql.SQLException;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.AbsencePeople;
import com.entity.People;
import com.mapper.AbsenceMapper;
import com.mapper.StuMesMapper;
import com.service.AbsenceService;
import com.service.PeopleService;


@Service("absenceService")
public class AbsenceServiceImpl implements AbsenceService{
	
	@Autowired
	AbsenceMapper absenceMapper;
	
	@Autowired
	StuMesMapper stuMesMapper;

	//按学号查询缺勤学生信息
	public List<AbsencePeople> queryAbsStuByUsername(String username) {
		return absenceMapper.queryAbsedStuByUsername(username);
	}

	//按学号查询请假未受理学生信息
	@Override
	public List<AbsencePeople> queryAbsingStuByUsername(String username) throws SQLException, ClassNotFoundException {
		return absenceMapper.queryAbsingStuByUsername(username);
	}

	//学生申请请假
	@Override
	public boolean AskAbsence(AbsencePeople absencePeople) throws ClassNotFoundException, SQLException {
//		查询之前先查找是否有该学生
		if (queryAbsStuByUseAndName(absencePeople)!=null) {
			absenceMapper.AskAbsence(absencePeople);
			return true;
		}
		return false;
	}
	
	//查询所有缺勤学生
	public List<AbsencePeople> queryAllAbsedStu(){
		return absenceMapper.queryAllAbsedStu();
	}

	//按名查询缺勤学生
	public List<AbsencePeople> queryAbsedStuByName(String student) {
		return absenceMapper.queryAbsedStuByName(student);
	}
	
	//查询所有请假未受理学生信息
	public List<AbsencePeople> dealAbsingStu(){
		return absenceMapper.dealAbsingStu();
	}
	
	//按名查询未受理学生信息
	public List<AbsencePeople> dealAbsingStuByName(String student){
		return absenceMapper.dealAbsingStuByName(student);
	}
	
	//管理增加缺勤信息
	public boolean addAbsence(AbsencePeople absencePeople){
//		先用学号和姓名查询有没有该学生
		if (queryAbsStuByUseAndName(absencePeople)!=null) {
//			有就添加
			absenceMapper.addAbsence(absencePeople);
			return true;
		}
		return false;
	}

	//根据学号和姓名查询缺勤学生/判断是否存在该学号和学生姓名 
	public People queryAbsStuByUseAndName(AbsencePeople absencePeople){
		return absenceMapper.queryAbsStuByUseAndName(absencePeople.getUsername(),absencePeople.getStudent());
	}
	
	//批准请假
	public void agreeAbs(int id){
		absenceMapper.agreeAbs(id);
	}
	
	//拒绝请假
	public void refuseAbs(int id){
		absenceMapper.refuseAbs(id);
	}


}
