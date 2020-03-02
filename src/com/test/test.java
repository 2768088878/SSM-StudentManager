package com.test;

import java.sql.SQLException;
import java.util.Random;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.entity.AbsencePeople;
import com.entity.People;
import com.service.AbsenceService;
import com.service.PeopleService;

public class test {
	
	
	@Test  //ע��
	public void addStudent() throws ClassNotFoundException, SQLException{
		
		 ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
		 
		 PeopleService peopleService=(PeopleService) ac.getBean("peopleService");

		 for(int i=0;i<15;i++){
			 People people=new People();
			 Random random=new Random();
			 String userName="201"+(random.nextInt(999999999)+1);
			 people.setUserName(userName);
			 people.setPwd("1");
			 people.setName("小红"+userName.substring(6));
			 people.setEmail("1111");
			 people.setIDcard("4406821997");
			 people.setIsManager(0);
			 people.setAccess("bh");
			 people.setIphone("123456");
			 people.setAge(11);
			 Random random1=new Random();
			 people.setClassNo(random1.nextInt(5)+1);
			 people.setMajor("会计");
			 people.setSex("女");
			
			 peopleService.addPeople(people, "123456");
		 }
		
	}
	
	
	//ɾ��ѧ��
	@Test
	public void deletePeopleByName() throws ClassNotFoundException, SQLException{
		
		ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
			 
		PeopleService peopleService=(PeopleService) ac.getBean("peopleService");
		
//		peopleService.deletePeopleByUserame("2");
	
	
	}

	//����ѧ�Ų�ѯһ��ѧ��
	@Test
	public void queryStudentByUsername() throws ClassNotFoundException, SQLException{
		
		ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
			 
		PeopleService peopleService=(PeopleService) ac.getBean("peopleService");
		
		People student = peopleService.queryStudentByUsername("4");
	
		System.out.println(student);
	}
	
	
	//����������ѯһ��ѧ��
	@Test
	public void queryStudentByNo() throws ClassNotFoundException, SQLException{
		
		ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
			 
		PeopleService peopleService=(PeopleService) ac.getBean("peopleService");
		
		People student = peopleService.queryStudentByNo(19);
	
		System.out.println(student);
	}
	
	
	//���������޸�һ��ѧ����ϢupdatePeopleById
	@Test
	public void updateStudentById() throws ClassNotFoundException, SQLException{
		
		ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
			 
		PeopleService peopleService=(PeopleService) ac.getBean("peopleService");
		
		People student=new People();
		student.setId(31);
		student.setUserName("2333");
		student.setPwd("233");
		student.setName("233");
		student.setEmail("233");
		student.setIDcard("233");
		student.setIsManager(0);
		student.setAccess("233");
		student.setIphone("233");
		student.setAge(11);
		student.setClassNo(5);
		student.setMajor("233");
		student.setSex("233�");
		peopleService.updateStudentById(student);
	
	}
	

}
