<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MLoginindex.jsp' starting page</title>
    <meta charset="utf-8" />
	<title>Login</title>
	<link rel="stylesheet" href="css/LoginStyle.css" />
	<link rel="stylesheet" href="css/icon.css" />

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    	<div class="top">
			
		</div>
		<div class="login-box">
			<h1>管理入口</h1>
			<form action="login/adminLogin.do" method="post">
			<div class="textbox">
				<i class="iconfont">&#xeb90;</i>
				<input type="text" placeholder="Username" name="userName"  value="">
				
			</div>
			
			
			<div class="textbox">
				<i class="iconfont">&#xe620;</i>
				<input type="password" placeholder="Password" name="pwd" value="">
			</div>
			
			<div class="textbox">
			<input type="text" placeholder="输入验证码" name="image" >
			<font color="red">${requestScope.imageMess}</font>
			<img src="/StudentManager/VerifyCodeServlet" style="float:right;">
			</div>
			<input  class="btn1" type="button" value="换一个" style="float:right" id="btn">
			
			<input class="btn" type="submit"  value="登录">
			</form>
			<a href="/StudentManager/login.do" style="color: white; float: left;" >返回</a>

			
		</div>
		
		<script type="text/javascript">
		var username;
		var pwd;
		
		
		    document.getElementById("btn").onclick = function () {
		        // 获取img元素
		        // 为了让浏览器发送请求到servlet, 所以一定要改变src
		        document.getElementsByTagName("img")[0].src =
		            "/StudentManager/VerifyCodeServlet?time=" + new Date().getTime();
		    };
		    
		    
		    
	
		
		</script>
		
		
  </body>
</html>
