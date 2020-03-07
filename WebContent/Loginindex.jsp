<%@page import="com.entity.People"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>studentLogin</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	    
		<title>Login</title>
		<link type="text/css" rel="stylesheet" href="/StudentManager/css/LoginStyle.css"></link>
		<link type="text/css" rel="stylesheet" href="/StudentManager/css/icon.css"></link>
		
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>

				<%
				    String UserName = "";
				    String UserPwd = "";
				    String remember = "";
				    Cookie[] cookies=request.getCookies();
				    if(cookies.length>0){
				    	for(Cookie cookie :cookies){ //查找cookie中记住的用户名和密码
					    	System.out.println("name:"+cookie.getName()+",value:"+cookie.getValue());
					    	if("remember".equals(cookie.getName())){
					    		UserName = cookie.getValue().split("#")[0];
					    		UserPwd = cookie.getValue().split("#")[1];
					            remember =cookie.getValue().split("#")[2];
					        }  
					    }
				    }
				    
				%>

		<div class="top">
			
		</div>
		<div class="login-box">
			<h1>登录页面</h1>
			<form action="login/studentLogin.do" method="post">
			<div class="textbox">
				<i class="iconfont">&#xeb90;</i>
				<input type="text" placeholder="Username" name="userName" id="userName" value="<%=UserName%>">
				
			</div>
			
			
			<div class="textbox">
				<i class="iconfont">&#xe620;</i>
				<input type="password" placeholder="Password" name="pwd" id="pwd" value="<%=UserPwd%>">
			</div>
		
		
		
			<div class="textbox"> 
			<input type="text" placeholder="输入验证码" name="image" >
			<font color="red">${requestScope.imageMess}</font>
			<img src="/StudentManager/VerifyCodeServlet" style="float:right;">
			</div>
			
			
			记住密码:<input type="checkbox" name="pwdRemember" id="pwdRemember" value="true">
			<input  class="btn1" type="button" value="换一个" style="float:right" id="btn">
			
			
			
			<input class="btn" type="submit"  value="登录">
			</form>
			<input class="btn" type="button" name="" value="注册" onclick="window.location.href='Register.jsp'">
			
			<a href="/StudentManager/FindPwd.html" style="color: white;" >忘记密码？</a>
			<a href="/StudentManager/MLoginindex.jsp" style="color: white; float: right;" >管理入口</a><!-- hrefÃ§ÂÂ/Ã¥ÂÂÃ¦ÂÂ¯Ã¦ÂÂ http://localhost:8080/ -->
			<input type="button" value="测试" id="testCookie">
		</div>
		

		
		<script type="text/javascript">
		var username;
		var pwd;
		var remember="<%=remember%>";

		
		document.getElementById("testCookie").onclick = function () {
				alert(<%=UserName%>);
				alert(<%=UserPwd%>);
		        alert(remember);
		    };
		    
	    document.getElementById("btn").onclick = function () {
	        // 获取img元素
	        // 为了让浏览器发送请求到servlet, 所以一定要改变src
	        document.getElementsByTagName("img")[0].src =
	            "/StudentManager/VerifyCodeServlet?time=" + new Date().getTime();
	    };
		    
 		if(remember=="true"){
			document.getElementById("pwdRemember").setAttribute("checked", "checked");
		}else{
			document.getElementById("pwdRemember").removeAttribute("checked");
		} 
		    
	
		
		</script>

		

  </body>
</html>
