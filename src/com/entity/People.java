package com.entity;

public class People {
	private int id;
	private String userName;
	private String pwd;
	private String name;
	private String email;
	private int age;
	private String access;
	private String sex;
	private String major;
	private int classNo;
	private String iphone;
	private String IDcard;
	private int isManager;
	
	public People(){
		
	}

	
	
	//登录
	public People(String userName,String pwd) {
		super();
		this.pwd = pwd;
		this.userName = userName;
	}

	public People(String userName) {
		super();
		this.userName = userName;
		
	}

	


	//查询信息用
	public People(int id,String userName, String pwd,String name,  int age,String email,
			String access,  String major, int classNo, String iphone,
			String iDcard, String sex) {
		super();
		this.id=id;
		this.userName = userName;
		this.pwd = pwd;
		this.name=name;
		this.email = email;
		this.age = age;
		this.access = access;
		this.sex = sex;
		this.major = major;
		this.classNo = classNo;
		this.iphone = iphone;
		this.IDcard = iDcard;
		this.isManager = isManager;
	}
	
	//修改信息用
	public People(String userName,String name,  int age,String email,
			String access,  String major, int classNo, String iphone,
			String iDcard, String sex) {
		super();

		this.userName = userName;
		this.name=name;
		this.email = email;
		this.age = age;
		this.access = access;
		this.sex = sex;
		this.major = major;
		this.classNo = classNo;
		this.iphone = iphone;
		this.IDcard = iDcard;
		this.isManager = isManager;
	}


	//注册
	public People(String userName, String pwd,String name,  int age,String email,
			String access,  String major, int classNo, String iphone,
			String iDcard, String sex) {
		super();
		this.userName = userName;
		this.pwd = pwd;
		this.name=name;
		this.email = email;
		this.age = age;
		this.access = access;
		this.sex = sex;
		this.major = major;
		this.classNo = classNo;
		this.iphone = iphone;
		this.IDcard = iDcard;
		this.isManager = isManager;
	}






	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



	public String getPwd() {
		return pwd;
	}



	public void setPwd(String pwd) {
		this.pwd = pwd;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public int getAge() {
		return age;
	}



	public void setAge(int age) {
		this.age = age;
	}



	public String getAccess() {
		return access;
	}



	public void setAccess(String access) {
		this.access = access;
	}



	public String getSex() {
		return sex;
	}



	public void setSex(String sex) {
		this.sex = sex;
	}



	public String getMajor() {
		return major;
	}



	public void setMajor(String major) {
		this.major = major;
	}



	public int getClassNo() {
		return classNo;
	}



	public void setClassNo(int classNo) {
		this.classNo = classNo;
	}



	public String getIphone() {
		return iphone;
	}



	public void setIphone(String iphone) {
		this.iphone = iphone;
	}



	public String getIDcard() {
		return IDcard;
	}



	public void setIDcard(String iDcard) {
		IDcard = iDcard;
	}



	public int getIsManager() {
		return isManager;
	}



	public void setIsManager(int isManager) {
		this.isManager = isManager;
	}



	@Override
	public String toString() {
		return "People [id=" + id + ", userName=" + userName + ", pwd=" + pwd
				+ ", name=" + name + ", email=" + email + ", age=" + age
				+ ", access=" + access + ", sex=" + sex + ", major=" + major
				+ ", classNo=" + classNo + ", iphone=" + iphone + ", IDcard="
				+ IDcard + ", isManager=" + isManager + "]";
	}
	

	
	
	

	

}



