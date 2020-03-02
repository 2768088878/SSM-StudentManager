<!-- 公共meta -->
<%@page import="com.entity.AbsencePeople"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>
<%@ include file="common/meta.jsp"%>
<!-- 公共meta-->

<title>广东培正学院</title>
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
			学生考勤 <span class="c-gray en">&gt;</span> 请假处理<a id="btn-refresh"
				class="btn btn-success radius r"
				style="line-height:1.6em;margin-top:3px"
				href="/StudentManager/Absence/dealAbsingStu.do" title="刷新"><i
				class="Hui-iconfont">&#xe68f;</i> </a>
		</nav>
		
		
		<div class="Hui-article">
			<article class="cl pd-20">
			<div class="text-c">
				<div class="boxx">
			
				<form action="/StudentManager/Absence/dealAbsingStuByName.do"  method="post">				
				
					<input type="text" class="input-text" style="width:100px "
							placeholder="输入姓名" id="" name="student">
					<button type="submit" class="btn btn-success radius" id="" name="">
							<i class="Hui-iconfont">&#xe665;</i> 搜索
					</button>
				</form>	
				</div>	
			</div>
			
			<div class="mt-20">
				
					<table	class="table table-border table-bordered table-hover table-bg table-sort">
						<thead>					
							<tr class="text-c">

								<th width="30">姓名</th>
								<th width="30">学号</th>
								<th width="30">课程</th>
								<th width="30">日期</th>
								<th width="30">请假原因</th>
								<th width="30">受理情况</th>
								<th width="30">操作</th>

							</tr>
						</thead>
						<tbody>

						<c:forEach items="${nd}" var="nd">

					  		<!-- 不能直接访问jsp，不然peoples集合里面没有先获取数据，所以要再xml里先设置优先访问queryAllServlet -->
					  		<tr class="text-c">
					  			<th>${nd.student}</th>
					  			<th>${nd.username}</th>
					  			<th>${nd.className}</th>
					  			<th>${nd.date}</th>
					  			<th>${nd.reason}</th>
					  			<th>${nd.deal}</th>
					  			<td class="td-manage">
					  				<a  href="javascript:;"
					  				onclick="agree('this','${nd.id}')" class="ml-5" style="text-decoration:none">
					  					批准
					  				</a> 
					  				
					  				<a  href="javascript:;"
					  				onclick="refuse('this','${nd.id}')" class="ml-5" style="text-decoration:none">
					  					驳回
					  				</a> 
							
								</td>
					  		</tr>

					  		</c:forEach>
	
						</tbody>
					</table>
				</div>

				
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
	<script>
		/*       */
		function agree(obj, id) {
			layer.confirm('确认要批准吗？', function(index) { 
				
				window.location.href="/StudentManager/Absence/agreeAbsence.do?id="+id;
				 
			});
		}
		/*驳回*/
		function refuse(obj, id) {
			layer.confirm('确认要驳回吗？', function(index) {
				
				window.location.href="/StudentManager/Absence/refuseAbsence.do?&id="+id;
				 
			});
		}
	</script>
</body>
</html>