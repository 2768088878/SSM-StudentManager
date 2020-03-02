package com.entity;

import java.sql.Timestamp;

public class AbsencePeople {
	private int id;
	private String student;
	private String username;
	private String className;
	private String date;
	private String reason;
	private String deal;
	private Timestamp gmtCreate;
	
	
	
	
	
	
	public Timestamp getGmtCreate() {
		return gmtCreate;
	}

	public void setGmtCreate(Timestamp gmtCreate) {
		this.gmtCreate = gmtCreate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStudent() {
		return student;
	}

	public void setStudent(String student) {
		this.student = student;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getDeal() {
		return deal;
	}

	public void setDeal(String deal) {
		this.deal = deal;
	}

	public AbsencePeople() {
		
	}
	
	
	

	
	@Override
	public String toString() {
		return "AbsencePeople [student=" + student + ", username=" + username
				+ ", className=" + className + ", date=" + date + "]";
	}
	
	
	
	
}
