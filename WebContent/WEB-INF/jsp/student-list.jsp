<!-- 公共meta -->
<%@page import="com.entity.People"%>
<%@page import="java.util.List"%>
<%@ include file="common/meta.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 公共meta-->

<title>广东培正学院</title>
</head>
<body>

	<!-- 公共顶部 -->
	<%@ include file="common/header.jsp"%>
	<%@ include file="common/menu.jsp"%>
	<!-- 公共顶部 -->

	<!-- 业务开始  -->
	<section class="Hui-article-box">
		<nav class="breadcrumb">
			<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
			信息管理 <span class="c-gray en">&gt;学生信息</span> <a id="btn-refresh"
				class="btn btn-success radius r"
				style="line-height:1.6em;margin-top:3px"
				onclick="javascript:location.replace(location.href);" title="刷新"><i
				class="Hui-iconfont">&#xe68f;</i> </a>
		</nav>
		<div class="Hui-article">
			<article class="cl pd-20">
				
				<span style="text-align: center;display:block;">${msg}</span>
				<div class="mt-20">
					<table	class="table table-border table-bordered table-hover table-bg table-sort">
						<thead>
							<tr class="text-c">

								<th width="30">ID</th>
								<th width="30">学号</th>
								<th width="30">姓名</th>
								<th width="30">年龄</th>
								<th width="30">邮箱</th>
								<th width="30">地址</th>
								<th width="30">专业</th>
								<th width="30">班级</th>
								<th width="30">手机号</th>
								<th width="30">身份证</th>
								<th width="30">性别</th>
								<th width="30">操作</th>
							</tr>
						</thead>
						<tbody>

						

							
							<% 
					  			//获取request域中的数据
					  			request.setCharacterEncoding("utf-8");
					  			People people = (People)request.getAttribute("people");
					  			
					  			if(people!=null){
					  		%>
					  		<!-- 不能直接访问jsp，不然peoples集合里面没有先获取数据，所以要再xml里先设置优先访问queryAllServlet -->
					  		<tr class="text-c">
					  			<th><%=people.getId() %></th>
					  			<th><%=people.getUserName() %></th>
					  			<th><%=people.getName() %></th>
					  			<th><%=people.getAge()%></th>
					  			<th><%=people.getEmail() %></th>
					  			<th><%=people.getAccess() %></th>
					  			<th><%=people.getMajor() %></th>
					  			<th><%=people.getClassNo() %></th>
					  			<th><%=people.getIphone() %></th>
					  			<th><%=people.getIDcard() %></th>
					  			<th><%=people.getSex() %></th>
					  			<td class="td-manage"><a title="编辑" href="javascript:;"
								onclick="member_edit('编辑','<%=basePath%>/stuMes/toEditStu.do?uid=<%=people.getId() %>','4','','510')"
								class="ml-5" style="text-decoration:none"><i
									class="Hui-iconfont">&#xe6df;</i> </a>
																 
								</td>
					  		</tr>
					  		<%
					  		
					  			}
					  			
					  		%>  	
		

									
				


						</tbody>
					</table>
				</div>
				<div id="msg" style="display:none">${msg}</div>
			</article>
		</div>
	</section>
	<!-- 业务结束 -->

	<!-- 公共底部 -->
	<%@ include file="common/footer.jsp"%>
	<!-- 公共底部 -->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript"
		src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
	<script type="text/javascript">
		$(function() {
			var msg=$("#msg").html();
			 
		    if(msg=="修改成功") {
		        alert(msg)
		    }
		});
		/*用户-添加*/
		function member_add(title, url, w, h) {
			layer_show(title, url, w, h);
		}
		/*用户-查看*/
		function member_show(title, url, id, w, h) {
			layer_show(title, url, w, h);
		}

		/*用户-编辑*/
		function member_edit(title, url, id, w, h) {
			layer_show(title, url, w, h);
		}
		/*密码-修改*/
		function change_password(title, url, id, w, h) {
			layer_show(title, url, w, h);
		}
		/*用户-删除*/
		function member_del(obj, id) {
			layer.confirm('确认要删除吗？', function(index) {
				
				window.location.href="/Student/DeleteServlet?&deleteNo="+id;
				 
			});
		}
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>