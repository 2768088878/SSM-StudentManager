<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--_menu 作为公共模版分离出去-->
<aside class="Hui-aside">
	
	<div class="menu_dropdown bk_2">
		
        <dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe616;</i> 信息管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd style="display:block">
				<ul><li><a href="/StudentManager/stuMes/queryStuByUsername.do?StuName=${username}" title="学生信息">学生信息</a></li></ul>
			</dd>
		</dl>

	 
		<dl id="menu-tongji">
			<dt><i class="Hui-iconfont">&#xe61a;</i> 文件<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd style="display:block">
				<ul><li><a href="/StudentManager/to/File.do" title="文件">文件</a></li></ul>
			</dd>
		</dl>
		
		<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe616;</i>考勤<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd style="display:block">
				<ul><li><a href="/StudentManager/Absence/queryAbsStuByUsername.do?username=${username}" title="缺勤记录">缺勤记录</a></li></ul>
				<ul><li><a href="/StudentManager/Absence/queryAbsingStuByUsername.do?username=${username}" title="请假进度">请假进度
				<c:if test="${sessionScope.isView!=0}">
					<span class="badge" style="margin-left: 5px">${sessionScope.isView}</span>
				</c:if></a></li></ul>

				<ul><li><a href="/StudentManager/to/student-askforleave.do?username=${username}" title="请假">请假</a></li></ul>
			</dd>
		</dl>
		
		 
</div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<!--/_menu 作为公共模版分离出去-->

