package com.service.impl;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.AbsencePeople;
import com.entity.People;

import com.mapper.StuMesMapper;
import com.service.PeopleService;


@Service("peopleService")
public class PeopleServiceImpl implements PeopleService{
	
	@Autowired
	StuMesMapper stuMesMapper;
	
	@Override
	//注册学生
	public boolean addPeople(People people,String username) throws SQLException, ClassNotFoundException {
		if (stuMesMapper.isExist(username)==null) {
			stuMesMapper.addPeople(people);
			return true;
		}
		return false;	
	}
	
	//学生登录
	public int LoginStudent(People people) throws SQLException, ClassNotFoundException{
		if (stuMesMapper.LoginStudent(people)!=null) {
			return 1;
		}
		return 0;
	}
	
	
	//管理登录
		public int adminLogin(People people) throws SQLException, ClassNotFoundException{
			if (stuMesMapper.adminLogin(people)!=null) {
				return 1;
			}
			return 0;
		}
	
	//按学号用户名查询单个学生
	@Override
	public People queryStudentByUsername(String username) throws SQLException, ClassNotFoundException {

		return stuMesMapper.queryStudentByUsername(username);
	}
	
	@Override//根据id查学生
	public People queryStudentByNo(int id) throws SQLException, ClassNotFoundException {
		
		return stuMesMapper.queryStudentByNo(id);
	}
	
	
	//根据id修改学生信息
	public void updateStudentById(People student) throws ClassNotFoundException, SQLException{
		stuMesMapper.updateStudentById(student);
	}
	
	//查询所有学生
	public List<People> queryAllStu() throws ClassNotFoundException, SQLException {
		return stuMesMapper.queryAllStudent();
	}
	
	//查询学生总数
	public int studentCount(){
		return stuMesMapper.studentCount();
	}
	
	//管理分页查询所有学生
	public List<People> queryAllStudentByPage(int page){
		return stuMesMapper.queryAllStudentByPage(page);
	}
	
	@Override//管理删除学生
	public void deletePeopleById(Integer id) throws SQLException, ClassNotFoundException {
		stuMesMapper.deletePeopleById(id);	
	}
	//管理批量删除学生
	public void deleteMore(List<Integer> ids){
		stuMesMapper.deleteMore(ids);
	}

	//管理动态查询学生
	public List<People> queryStu(People people){
		return stuMesMapper.queryStu(people);
	}
	

	//通过邮箱查询学生
	public People queryStuByEmail(String email){
		return stuMesMapper.queryStuByEmail(email);
	}
	

	//修改密码
	public void updatePwd(People people){
		stuMesMapper.updatePwd(people);
	}
	
//	查询所有专业
	public List<String> allMajors(){
		return stuMesMapper.allMajor();
	}
	

}
