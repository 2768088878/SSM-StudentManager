package com.service;

import java.sql.SQLException;
import java.util.List;

import com.entity.AbsencePeople;
import com.entity.People;


public interface PeopleService {
	
	//注册学生
	public boolean addPeople(People people,String username) throws SQLException, ClassNotFoundException;
	
	
	
	//学生登录
	public int LoginStudent(People people) throws SQLException, ClassNotFoundException;
	
	//管理登录
	public int adminLogin(People people) throws SQLException, ClassNotFoundException;
	
	//按学号用户名查询单个学生
	public People queryStudentByUsername(String username) throws SQLException, ClassNotFoundException;
	
	//根据id修改学生信息
	public void updateStudentById(People student) throws SQLException, ClassNotFoundException;
	
	//根据id查询学生
	public People queryStudentByNo(int id) throws SQLException, ClassNotFoundException;
	
	//查询所有学生
	public List<People> queryAllStu() throws ClassNotFoundException, SQLException;

	//查询学生总数
	public int studentCount();
	
	//管理分页查询所有学生
	public List<People> queryAllStudentByPage(int page);
	
	//管理删除学生
	public void deletePeopleById(Integer id) throws SQLException, ClassNotFoundException;
	
	//管理批量删除学生
	public void deleteMore(List<Integer> ids);
	
	//管理动态查询学生
	public List<People> queryStu(People people);
		
	//通过邮箱查询学生
	public People queryStuByEmail(String email);
	
	//修改密码
	public void updatePwd(People people);
	
//	查询所有专业
	public List<String> allMajors();
	
	
	
	
	
}
