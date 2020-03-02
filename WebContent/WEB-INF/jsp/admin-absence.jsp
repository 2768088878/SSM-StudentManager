<!-- 公共meta -->
<%@page import="com.entity.AbsencePeople"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.*"%>
<%@ include file="common/meta.jsp"%>
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
			学生考勤 <span class="c-gray en">&gt;</span> 缺勤记录<a id="btn-refresh"
				class="btn btn-success radius r"
				style="line-height:1.6em;margin-top:3px"
				onclick="javascript:location.replace(location.href);" title="刷新"><i
				class="Hui-iconfont">&#xe68f;</i> </a>
		</nav>
		
		<div class="Hui-article">
			<article class="cl pd-20">
				<div class="text-c">
				<div class="boxx">
			
				<form action="/StudentManager/Absence/queryAbsedStuByName.do"  method="post">				
				
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
							</tr>
						</thead>
						<tbody>					
							<c:forEach items="${ap}" var="ap">
					  		<tr class="text-c">
					  			<th>${ap.student}</th>
					  			<th>${ap.username}</th>
					  			<th>${ap.className}</th>
					  			<th>${ap.date}</th>
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