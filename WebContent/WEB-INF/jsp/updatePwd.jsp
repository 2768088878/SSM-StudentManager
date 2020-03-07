<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Login</title>
		<link rel="stylesheet" href="/StudentManager/css/LoginStyle.css" />
		<link rel="stylesheet" href="/StudentManager/css/icon.css" />
		<script src="/StudentManager/js/common.js"></script>
<title>Insert title here</title>
</head>
<body>

		<div class="top">
			
		</div>
		<div class="login-box">
			<h1>修改密码</h1>
			<form action="/StudentManager/login/updatePwd.do?email=${sessionScope.email}" method="post">
			
			
			<div class="textbox">
				<i class="iconfont">&#xe620;</i>
				<input type="text" placeholder="password" name="abc" id="abc" value="">
			</div>
			
			<div class="textbox">
				<i class="iconfont">&#xe620;</i>
				<input type="text" placeholder="password" name="pwd" id="pwd" value=""><div class="pwdl" ></div>
			</div>
			
			<input class="btn" id="submit" type="submit"  value="提交">
			</form>
			<a href="/StudentManager/Loginindex.jsp" style="color: white; float: right;" >返回</a>
		</div>

		
	<script>

		var flag=0;
		
		var pwd=document.getElementById("pwd");
		var abc=document.getElementById("abc");
		pwd.onkeyup=function(){
			if(pwd.value!=abc.value){	
				flag=0;
				this.nextElementSibling.innerHTML="两个密码不一致！";
			}else{
				this.nextElementSibling.innerHTML=""
				flag=1;
			}
		}
		
		var mysubmit=document.getElementById("submit");
		mysubmit.onclick=function(){
			if(flag==0||pwd.value.length<6||abc.value.length<6){	
				event.preventDefault();
				alert("请输入一致的密码,长度不小于6位！");
			}else{
				
			}
		}
		
	
	</script>

</body>
</html>