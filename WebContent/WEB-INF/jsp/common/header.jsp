<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!--_header 作为公共模版分离出去-->

<header class="navbar-wrapper">

<script type="text/javascript">
window.onload=function(){
	function btn(){
				alert(<%=request.getSession().getAttribute("username")%>);

			 }
}
</script>

	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl"> <a class="logo navbar-logo f-l mr-10 hidden-xs" href="/StudentManager/Loginindex.jsp">首页</a> <a class="logo navbar-logo-m f-l mr-10 visible-xs" >培正</a> 
			<span class="logo navbar-slogan f-l mr-10 hidden-xs">v3.0</span> 
			<a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
            
		 
    
    
			<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
				<ul class="cl">
					<li>学生用户:${sessionScope.username} 密码：${sessionScope.pwd}</li>
								
					<li class="dropDown dropDown_hover"> <a href="#" onclick="return false;"class="dropDown_A">菜单 <i class="Hui-iconfont">&#xe6d5;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="/StudentManager/login/sessionInvalidate.do" class="dropDown_A"  onclick="btn()">注销</a></li>
							 
<%-- 							<li><a href="<%=basePath%>">退出</a></li>
 --%>				</ul>
			</li>
					
					<li id="Hui-skin" class="dropDown right dropDown_hover"> <a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
							<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
							<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
							<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
							<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
							<li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
				</ul>
			</li>
		</ul>
	</nav>
</div>
</div>


</header>
<!--/_header 作为公共模版分离出去-->




