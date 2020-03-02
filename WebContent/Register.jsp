<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
		<link type="text/css" rel="stylesheet" href="/StudentManager/css/LoginStyle.css"></link>
		<link type="text/css" rel="stylesheet" href="/StudentManager/css/icon.css"></link>
		<script src="js/common.js"></script>
</head>
<body>
	<div class="top">
			
		</div>
		<div class="login-box">
			<h1>学生注册</h1>
			 <form action="login/studentRegister.do" method="post">
			<div class="textbox">
				<i class="iconfont">&#xeb90;</i>
				<font color="red">*</font><input type="text" placeholder="Username" name="userName" id="userName" value="">
				
			</div>
			<div class="textbox">
				<i class="iconfont">&#xe620;</i>
				<font color="red">*</font><input type="password" id="pwd" placeholder="Password" name="pwd" value=""><div class="pwdl" ></div>

			</div>
			<div class="pwd">
				<em>密码强度：</em> 
				<em id="strength"></em>
				<div id="strengthLevel" class="strengthLv0"></div>
			</div>
			<div class="pwdl" >不少于6位</div>
			<div class="textbox">
				<i class="iconfont">&#xe60c;</i>
				<font color="red">*</font><input type="text" id="name" placeholder="Name" name="name" value=""> <div class="pwdl" ></div>

			</div>
			<div class="textbox">
				<i class="iconfont">&#xe60e;</i>
				<input type="text" id="age" placeholder="Age" name="age" value=""><div class="pwdl" ></div><!--仅数字-->

			</div>
			<div class="textbox">
				<i class="iconfont">&#xe72d;</i>
				<font color="red">*</font><input type="text"  id="email" placeholder="Email" name="email" value=""><div class="pwdl" ></div><!--邮箱正则-->

			</div>
			
			<div class="textbox">
				<i class="iconfont">&#xe681;</i>
				<input type="text" placeholder="Access" name="access" value="">

			</div>
			<div class="textbox">
				<i class="iconfont">&#xe61f;</i>
				<input type="text" placeholder="Major" name="major" value="">

			</div>

			<div class="textbox">
				<i class="iconfont">&#xe645;</i>
				<font color="red">*</font><input type="text" id="iphone" placeholder="Iphone" name="iphone" value=""><div class="pwdl" ></div><!--仅数字-->

			</div>
			<div class="textbox">
				<i class="iconfont">&#xe674;</i>
				<font color="red">*</font><input type="text" id="idcard" placeholder="IDcard" name="IDcard" value=""><div class="pwdl" ></div><!--输入正确的身份证格式-->

			</div>
			<div>
             <i class="iconfont">&#xe63e;</i><font color="red">*</font><input type="radio" id="sex" name="sex" value="男">男
             <input type="radio" id="sex" name="sex" value="女">女
             <br>

         </div>
			
			<div>
             <i class="iconfont">&#xe662;</i><font color="red">*</font>
             <input type="radio" name="classNo" id="classNo" value="1">1
             <input type="radio" name="classNo" id="classNo" value="2">2
             <input type="radio" name="classNo" id="classNo" value="3">3
             <input type="radio" name="classNo" id="classNo" value="4">4
             <input type="radio" name="classNo" id="classNo" value="5">5
             <br>

         </div>
			<input class="btn" id="btn" type="submit" value="注册">
<!-- 			<input type="button" name="sex" value="测试" onclick="newTest()">
			<input type="button" name="sex" value="测试用户名" onclick="Testa()"> -->
			</form> 
			<a href="/StudentManager/FindPwd.html" style="color: white;" >忘记密码？</a>
			<a href="/StudentManager/MLoginindex.jsp" style="color: white; float: right;" >管理入口</a>
		</div>
		
		
		<script>
		var pwdflag=0;
		var nameflag=0;
		var emailflag=0;
		var ageflag=0;
		var iphoneflag=0;
		var idcardflag=0;
		var sexflag=0;
		var classflag=0;
		
		var username=0;
		
		my$("userName").onkeyup=function(){
			
			username=my$("userName").value;
		}
		
		my$("pwd").onkeyup=function(){
			//每次键盘抬起都要获取文本框中的内容，验证文本框中有什么东西，得到一个级别，然后下面的div显示对应颜色
			
			//如果密码长度小于6，没有必要判断

			if(this.value.length>=6){
				pwdflag=1;
			var lvl=getLv(this.value);
				my$("strengthLevel").className="strengthLv"+lvl;
			}else{
				my$("strengthLevel").className="strengthLv0"; 
				pwdflag=0;
			}

//			my$("strengthLevel").className="strengthLv"+ (this.value.length>=6?getLv(this.value):0);
		};
		//给我密码，我返回对应的级别
		function getLv(pwd){
			var lvl=0;//默认是0级
			//密码中是否有数字，或者是字母，或者特殊符号
			if(/[0-9]/.test(pwd)){
				lvl++;
			}
			//判断密码中有没有字母
			if(/[a-zA-Z]/.test(pwd)){
				lvl++;
			}
			//判断密码中有没有特殊符号
			if(/[^0-9a-zA-Z_]/.test(pwd)){
				lvl++;
			}
			return lvl;	
		}
		
		//验证用户名

		my$("name").onkeyup=function(){
			if(/[\u4e00-\u9fa5]{2,4}/.test(this.value)){
				this.nextElementSibling.innerHTML="";
				this.style.backgroundColor="green";		
				nameflag=1;
			}else{
				this.style.backgroundColor="red";
				this.nextElementSibling.innerHTML="请输入2-4个中文";
				nameflag=0;
			}
		}
		
		//验证年龄
			my$("age").onkeyup=function(){
				if(/^\d{1,3}$/.test(this.value)){
					this.nextElementSibling.innerHTML="";
					this.style.backgroundColor="green";		
					ageflag=1;
				}else{
					this.style.backgroundColor="red";
					this.nextElementSibling.innerHTML="请输入1-3正确年龄";
					ageflag=0;
				}
			}
		
	//验证邮箱
			my$("email").onkeyup=function(){
			//判断这个文本框输入的是不是邮箱
			if(/^[0-9a-zA-Z_.-]+[@][0-9a-zA-Z_.-]+([.][a-zA-Z]+){1,2}$/.test(this.value)){
				this.style.backgroundColor="green";
				this.nextElementSibling.innerHTML="";
				emailflag=1;
			}else{
				this.style.backgroundColor="red";
				this.nextElementSibling.innerHTML="有误的的邮箱格式";
				emailflag=0;
			}
		}
		
		
		//验证电话号

			my$("iphone").onkeyup=function(){
			//判断这个文本框输入的是不是邮箱
			if(/^1(3|4|5|6|7|8|9)\d{9}$/.test(this.value)){
				this.nextElementSibling.innerHTML="";
				this.style.backgroundColor="green";
				iphoneflag=1;
			}else{
				this.style.backgroundColor="red";
				this.nextElementSibling.innerHTML="有误的电话号格式";
				iphoneflag=0;
			}
		}
		
		
		//验证身份证

			my$("idcard").onkeyup=function(){
			//判断这个文本框输入的是不是邮箱
			if(/([1-9][0-9]{14})([0-9][0-9xX])?/.test(this.value)){
				this.nextElementSibling.innerHTML="";
				this.style.backgroundColor="green";
				idcardflag=1;
			}else{
				this.style.backgroundColor="red";
				this.nextElementSibling.innerHTML="有误的身份证格式";
				idcardflag=0;
			}
		}
		//验证性别

		
		//验证班别
		
		
		 window.onload=function(){
			var mysubmit=document.getElementById("btn");
			var r=document.getElementsByName("sex");
			var c=document.getElementsByName("classNo");
			mysubmit.onclick=function(event){	
				for(var i=0;i<r.length;i++){
					if(r[i].checked==true){
						sexflag=1;
					}
				}
				for(var j=0;j<c.length;j++){
					if(c[i].checked==true){
						classflag=1;
					}
				}
				if(pwdflag==1&nameflag==1&ageflag==1&emailflag==1&iphoneflag==1&idcardflag==1&sexflag==1&classflag==1){				
					
					
				}else{
					event.preventDefault();
					alert("请按照提示正确填写信息！");
				}
			}
		} //sex classNo
		 
		 function newTest(){
		 	alert("pwd:"+pwdflag+"  name:"+nameflag+"  age:"+ageflag+"  email:"+emailflag+"  iphone:"+iphoneflag+"  idcard:"+idcardflag); 
		 }

	  function Testa(){
		 	alert("用户名是"+username); 
		 }
	</script>
</body>
</html>