<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link rel="stylesheet" href="/StudentManager/css/LoginStyle.css" />
<link rel="stylesheet" href="/StudentManager/css/icon.css" />
<title>Insert title here</title>
</head>
<body>
		
		<div class="top">
			
		</div>
		<div class="login-box">
			<h1>找回密码</h1>
			<form action="/StudentManager/login/findPwd.do" method="post">
			
			
			<div class="textbox">
				<i class="iconfont">&#xe72d;</i>
				<input type="text" placeholder="email" name="uemail" value="">
			</div>
			
			<input class="btn" type="submit"  value="提交">
			</form>
			<a href="/StudentManager/login.do" style="color: white; float: right;" >返回</a>
		</div>
		

</body>
</html>