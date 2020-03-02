<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 公共meta -->
<%@ include file="common/meta.jsp" %>
<!-- 公共meta-->

<title>添加车次</title>
</head>
<body>

<!-- 业务开始  -->
<article class="cl pd-20">
	
	<form  action="/StudentManager/stuMes/updateStu.do"  
	method="post" class="form form-horizontal" id="form-member-add">
	
	    <!-- 隐藏域  hiden，传到后台使用-->
	    <input type="hidden" value="${people.id}" name="id"/> 
	    
	    
	    <div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>学号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${people.userName}"   name="userName">
			</div>
		</div>

        
       <div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>姓名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${people.name}"   name="name">
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>邮箱：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${people.email}"   name="email">
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>年龄：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${people.age}"   name="age">
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>地址：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${people.access}"   name="access">
			</div>
		</div>
		 
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>性别：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${people.sex}"   name="sex">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>专业：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${people.major}"   name="major">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>班级：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${people.classNo}"   name="classNo">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>手机：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${people.iphone}"   name="iphone">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>身份证：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${people.IDcard}"   name="IDcard">
			</div>
		</div>

	 
		 
	 
		 
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit"  value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
			</div>
		</div>
		
		
	</form>
	
	
	
</article>
<!-- 业务结束  -->



<!-- 公共底部 -->
<%@ include file="common/footer.jsp" %>
<!-- 公共底部 -->



<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script> 
<script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	
	/*jquery  validate表单验证插件*/
	$("#form-member-add").validate({
		rules:{
			cch:{
				required:true,
			},
			cfz:{
				required:true,
			},
			ddz:{
				required:true,
			},
			cfsj:{
				required:true,
			},
			ddsj:{
				required:true,
			},
			zw:{
				required:true,
			},

		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit();    //ajax提交方式，无刷新
			var index = parent.layer.getFrameIndex(window.name);
			parent.$('#btn-refresh').click();   //刷新
			parent.layer.close(index);   //js关掉添加页
		}
	});
	
	
});


</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>