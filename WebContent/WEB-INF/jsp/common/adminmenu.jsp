<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!--_menu 作为公共模版分离出去-->
<aside class="Hui-aside">
	
	<div class="menu_dropdown bk_2">
		
        <dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe616;</i> 信息管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd style="display:block">
			<!-- <ul><li><a href="/StudentManager/queryServlet?m=e&findName=${username}&currentPage=1" title="学生信息">学生信息</a></li></ul> -->	
				<ul><li><a href="/StudentManager/stuMes/queryAllStuByPage.do?select=all" title="学生信息">学生信息</a></li></ul>
			</dd>
		</dl>

	 
		<dl id="menu-tongji">
			<dt><i class="Hui-iconfont">&#xe61a;</i> 文件<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd style="display:block">
				<ul><li><a href="/StudentManager/to/AdminFile.do" title="文件">文件</a></li></ul>
			</dd>
		</dl>
		
		<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe616;</i>学生考勤<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd style="display:block">
				<ul><li><a href="/StudentManager/Absence/queryAllAbsedStu.do" title="缺勤记录">缺勤记录</a></li></ul>
				<ul><li><a href="/StudentManager/Absence/dealAbsingStu.do" title="请假处理">请假处理<span class="badge" style="margin-left: 5px">${sessionScope.absCount}</span></a>
				</li></ul>
				<ul><li><a href="/StudentManager/to/admin-addleave.do" title="增加缺勤记录">增加缺勤记录</a></li></ul>
			</dd>
		</dl>
		 
</div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<!--/_menu 作为公共模版分离出去-->

