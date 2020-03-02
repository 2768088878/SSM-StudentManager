<!-- 公共meta -->
<%@page import="com.entity.AbsencePeople"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page import="java.util.List"%>
<%@ include file="common/meta.jsp"%>
<!-- 公共meta-->

<title>广东培正学院</title>
<head>
	<script src="/js/jquery-1.9.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="/css/bootstrap-theme.css">
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
			考勤 <span class="c-gray en">&gt;</span> 缺勤记录<a id="btn-refresh"
				class="btn btn-success radius r"
				style="line-height:1.6em;margin-top:3px"
				onclick="javascript:location.replace(location.href);" title="刷新"><i
				class="Hui-iconfont">&#xe68f;</i> </a>
		</nav>
		<div class="Hui-article">
			<article class="cl pd-20">
					<div class="mt-20">
					<table	class="table table-border table-bordered table-hover table-bg table-sort">
						<thead>
							<tr class="text-c">

								<th width="30">姓名</th>
								<th width="30">学号</th>
								<th width="30">课程</th>
								<th width="30">日期</th>



							</tr>
						</thead>
						<tbody>
						<c:forEach items="${peoples}" var="peoples">

					  		<!-- 不能直接访问jsp，不然peoples集合里面没有先获取数据，所以要再xml里先设置优先访问queryAllServlet -->
					  		<tr class="text-c">
					  			<th>${peoples.student}</th>
					  			<th>${peoples.username}</th>
					  			<th>${peoples.className}</th>
					  			<th>${peoples.date}</th>


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

</body>
</html>