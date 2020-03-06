package com.mapper;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.entity.AbsencePeople;
import com.entity.People;


@Repository("stuMesMapper")
public interface StuMesMapper {
	

	// 判断是否存在已有学生账号 
	public People isExist(String username) throws SQLException, ClassNotFoundException;
	
	
	//注册学生
	public boolean addPeople(People people) throws ClassNotFoundException, SQLException;
	
	//学生登录
	public People LoginStudent(People people) throws SQLException, ClassNotFoundException;
	
	//管理登录
	public People adminLogin(People people) throws SQLException, ClassNotFoundException;
	
	//按学号用户名查询单个学生
	public People queryStudentByUsername(String username) throws SQLException, ClassNotFoundException;
	
	//按姓名查询单个学生
	public People queryStudentByName(String name) throws SQLException, ClassNotFoundException;
	
	//按id查看单个学生
	public People queryStudentByNo(int id) throws SQLException, ClassNotFoundException;
	
	//按学号用户名修改单个学生
	public void updateStudentById(People student) throws SQLException, ClassNotFoundException;
	
	
	//管理查询所有学生
	public List<People> queryAllStudent() throws SQLException, ClassNotFoundException;
	
	//查询学生总数
	public int studentCount();
	
	//管理分页查询所有学生
	public List<People> queryAllStudentByPage(int page);
	
		
	//管理删除学生
	public boolean deletePeopleById(Integer id);
	
	//管理批量删除学生
	public void deleteMore(List<Integer> ids);
	
	//管理动态查询学生
	public List<People> queryStu(People people);
	
	//通过邮箱查询学生
	public People queryStuByEmail(String email);
	
	//修改密码
	public void updatePwd(People people);
	
	
	//查询所有专业
	public List<String> allMajor();
	
	
	
	
	
	
	
	
	
	
	
	



}
