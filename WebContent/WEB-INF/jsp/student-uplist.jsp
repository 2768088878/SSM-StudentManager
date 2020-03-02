<!-- 公共meta -->
<%@page import="com.entity.People"%>
<%@page import="java.util.List"%>
<%@ include file="common/meta.jsp"%>
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
			文件 <span class="c-gray en">&gt;</span> 下载<a id="btn-refresh"
				class="btn btn-success radius r"
				style="line-height:1.6em;margin-top:3px"
				onclick="javascript:location.replace(location.href);" title="刷新"><i
				class="Hui-iconfont">&#xe68f;</i> </a>
		</nav>
		<div class="Hui-article">
			<article class="cl pd-20">
				<div class="text-c">
					
			
					
					
				</div>

				<div class="mt-20">
					<table	class="table table-border table-bordered table-hover table-bg table-sort">
						<thead>
							<tr class="text-c">	
								<th width="100">文件</th>
								<th width="100">下载</th>								
							</tr>
						</thead>
								<tr class="text-c">	
								<th width="100">${applicationScope.fileName}</th>
								<th width="100"><a href="/StudentManager/file/download.do?filename=${applicationScope.fileName}">下载</a></th>								
								</tr>
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