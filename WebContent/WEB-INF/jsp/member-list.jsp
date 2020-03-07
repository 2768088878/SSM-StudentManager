<!-- 公共meta -->
<%@page import="com.entity.People"%>
<%@page import="java.util.List"%>
<%@ include file="common/meta.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 公共meta-->

<title>广东培正学院</title>
<head>

	<style>
    .boxx{
		        width:1000px;
		        height: 50px;
		        border: none;
    }
    select{

                font-family: "微软雅黑";
                background: rgba(0,0,0,0);
                width: 150px;
                height: 30px;
                font-size: 10px;
                text-align: center;
                border: 1px #1a1a1a solid;
                border-radius: 5px;
                
				
			}
	option{
				width:50px;
				
	}
    </style>
</head>
<body>

	<!-- 公共顶部 -->
	<%@ include file="common/adminheader.jsp"%>
	<%@ include file="common/adminmenu.jsp"%>
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
				<div class="text-c">
					
			<!-- 	<form action="/Student/queryByClassNoServlet" method="post">
						<input type="text" class="input-text" style="width:250px"
							placeholder="输入姓名" id="" name="find">
						<button type="submit" class="btn btn-success radius" id="" name="">
							<i class="Hui-iconfont">&#xe665;</i> 搜索
						</button>
					</form> -->	
				<div class="boxx">
				<form action="/StudentManager/stuMes/queryAllStuByPage.do?select=some"  method="post">				
						选择专业<select name="major" >
					<c:forEach items="${majors}" var="major">
						<option value ="${major}" <c:if test="${major==isMajor}">selected</c:if>>
							${major}
						</option>
					</c:forEach>

					</select>选择班级
					<select name="classNo">
					  <option value ="1" <c:if test="${classNo==1}">selected</c:if>>1</option>
					  <option value ="2" <c:if test="${classNo==2}">selected</c:if>>2</option>
					  <option value="3" <c:if test="${classNo==3}">selected</c:if>>3</option>
					  <option value="4" <c:if test="${classNo==4}">selected</c:if>>4</option>
					  <option value="5" <c:if test="${classNo==5}">selected</c:if>>5</option>
					</select>
					<input type="text" class="input-text" style="width:100px "
							placeholder="输入姓名" id="" name="name">
					<button type="submit" class="btn btn-success radius" id="" name="">
							<i class="Hui-iconfont">&#xe665;</i> 搜索
					</button>
				</form>	
				</div>	
				</div>
				<%-- <div id="msg" style="display:none">${msg}</div>
				<button class="btn btn-success" onclick="text()">测试</button> --%>
				<div class="mt-20">
					<table	class="table table-border table-bordered table-hover table-bg table-sort">
						<thead>
							<tr class="text-c">
								<th width="30"><input type="checkbox" onchange="changebox()" id="all"></th>
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
								<th width="30">操作&nbsp&nbsp&nbsp<a href="javascript:;" onclick="deleteMore(${currentPage})">批量删除</a></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${peoples}" var="peoples">
							

					  		<!-- 不能直接访问jsp，不然peoples集合里面没有先获取数据，所以要再xml里先设置优先访问queryAllServlet -->
					  		<tr class="text-c">
					  			<th><input type="checkbox" name="lists" value="${peoples.id}"></th>
								<th>${peoples.userName}</th>
								<th>${peoples.name}</th>
								<th>${peoples.age}</th>
								<th>${peoples.email}</th>
								<th>${peoples.access}</th>
								<th>${peoples.major}</th>
								<th>${peoples.classNo}</th>
								<th>${peoples.iphone}</th>
								<th>${peoples.IDcard}</th>
								<th>${peoples.sex}</th>
					  			<td class="td-manage"><a title="编辑" href="javascript:;"
								onclick="member_edit('编辑','<%=basePath%>stuMes/AdmintoEditStu.do?id=${peoples.id}','4','','510')"
								class="ml-5" style="text-decoration:none"><i  
									class="Hui-iconfont">&#xe6df;</i> </a> 
							
							<a title="删除" href="javascript:;"
								onclick="member_del(this,'${peoples.id}','${currentPage}')" class="ml-5"
								style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i>
							</a></td>
					  		</tr>
	
							</c:forEach>
						</tbody>
					</table>
				</div>
				
 		<c:if test="${hide==1}">
<%-- 		<span>${select}sadsad</span> --%>
			<div>
				<a href="/StudentManager/stuMes/queryAllStuByPage.do?currentPage=1&select=all" >首页</a>
				<a href="/StudentManager/stuMes/queryAllStuByPage.do?currentPage=${lastPage}&select=all" >上一页</a>
				
 	<!-- <input type="text" style="width:30px;" name="currentPage" value="${currentPage+1}" >
				<input type="button" name="page" value="跳转" onclick="Testa('${currentPage+1}')">  -->				
				
				<a href="/StudentManager/stuMes/queryAllStuByPage.do?currentPage=${nextPage}&select=all" >下一页</a>
				<a href="/StudentManager/stuMes/queryAllStuByPage.do?currentPage=${finalPage}&select=all" >尾页</a>&nbsp&nbsp&nbsp 当前学生总数:${count}
				
				
			
				<form action="/StudentManager/stuMes/queryAllStuByPage.do?select=all" method="post">
					<input type="hidden" name="findName" value="${username }">
					<input type="text" style="width:30px;" name="currentPage" value="${currentPage}" >
					<input type="submit" value="跳转"> 
				</form>
			</div>
		</c:if>	
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
		$(document).ready(function(){
			
			var html=$("#msg").html();
		 	if(html=="删除成功"){
		 		alert(html);
		 	}
		 })
			
		 	
		 
		
		
		
		
		
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
		function member_del(obj,id,currentPage) {
			layer.confirm('确认要删除吗？', function(index) {
				
				window.location.href="/StudentManager/stuMes/delStu.do?id="+id+"&currentPage="+currentPage;
				 
			});
		}		
		
		
		function changebox(){
			var all=document.getElementById("all");
			var lists=document.getElementsByName("lists");
			for(var i=0;i<lists.length;i++){
				lists[i].checked=all.checked;
			}
		}
		
		function deleteMore(sp){
			var num=0;
			var ids="";
			var lists = document.getElementsByName("lists")//获取当前页所有的复选框
			 for(var i=0;i<lists.length;i++){
				 if(lists[i].checked){//当前复选框是否被选中
					 ids+=lists[i].value+",";
					 num++;
				 }
			 }
			if(num==0){
				alert("请选择要删除的记录!");
				return;
			}
			
			if(confirm("你确定要删除"+num+"条记录吗？")){
				ids=ids.substring(0,ids.length-1);
				
				 location.href="/StudentManager/stuMes/delMore.do?ids="+ids+"&currentPage="+sp; 
			}
			
		}
		
		
	
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>