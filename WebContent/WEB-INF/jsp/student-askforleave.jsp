<!-- 公共meta -->
<%@page import="com.entity.People"%>
<%@page import="java.util.List"%>
<%@ include file="common/meta.jsp"%>
<!-- 公共meta-->

<title>广东培正学院</title>
<head>
   <style>
        *{
            margin: 0;
            padding: 0;
        }
        body{
            position: relative;
        }
        a{
            text-decoration:none;
            color: #333333;
        }
        .leave{
            width: 500px;
            position: absolute;
            left: 0;
            right: 0;
            margin: 100px auto;
        }
        .leave table{
            width: 100%;
            height: 100%;
            border-collapse: collapse;
        }
        .leave table tr{
            height: 40px;

        }
        .leave table th{
            border: 1px solid black;
            height: 50px;
            text-align: center;
        }
        
        .leave table th input{
            width: 80px;
			background: none;
			padding: 5px;
			font-size: 10px;
			cursor: pointer;
			margin: 12px 0;
        }
        
        .leave table tr:first-child{
            background-color: #f2fcff;
        }
        .leave table td{
            border: 1px solid black;
            width: 250px;
            text-align: center;
        }
        .leave table td input{
            width: 200px;
            height: 25px;
            text-align: center;
        }
        
        .leave table td select{
            font-family: "微软雅黑";
            background: rgba(0,0,0,0);
            width: 50px;
            height: 30px;
            font-size: 10px;
            text-align: center;


        }
        
        .leave table td textarea{
            width: 200px;
            height: 60px;
            resize: none;
        }
    </style>
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
			考勤 <span class="c-gray en">&gt;</span> 请假<a id="btn-refresh"
				class="btn btn-success radius r"
				style="line-height:1.6em;margin-top:3px"
				onclick="javascript:location.replace(location.href);" title="刷新"><i
				class="Hui-iconfont">&#xe68f;</i> </a>
		</nav>
		<div class="Hui-article">
			<article class="cl pd-20">
		<div class="text-c"></div>
		
		
	<form action="/StudentManager/Absence/AskAbsence.do" method="post">	
		<input type="hidden" value="${username}" name="username"/>	
		<div class="leave">
        <table>
            <tr>
                <th colspan="2">请假单</th>
            </tr>
            <tr>
                <td>姓名</td>
                <td><input type="text" name="student" id="student"></td>
            </tr>
            <tr>
                <td>课程</td>
                <td><input type="text" name="className" id="className"></td>
            </tr>
            <tr>
                <td>时间段</td>
                <td>
	           		     第	<select name="date">
	                        <option value="第1周">1周</option>
	                        <option value="第2周">2周</option>
	                        <option value="第3周">3周</option>
	                        <option value="第4周">4周</option>
	                        <option value="第5周">5周</option>
	                        <option value="第6周">6周</option>
	                        <option value="第7周">7周</option>
	                        <option value="第8周">8周</option>
	                        <option value="第9周">9周</option>
	                        <option value="第10周">10周</option>
	                        <option value="第11周">11周</option>
	                        <option value="第12周">12周</option>
	                        <option value="第13周">13周</option>
	                        <option value="第14周">14周</option>
	                        <option value="第15周">15周</option>
	                        <option value="第16周">16周</option>
	                        <option value="第17周">17周</option>
	                    </select>
	               		 
                  	  周<select name="date">
                        <option value="周一">一</option>
                        <option value="周二">二</option>
                        <option value="周三">三</option>
                        <option value="周四">四</option>
                        <option value="周五">五</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>请假原因</td>
                <td>
                    <textarea name="reason" id="reason"></textarea>
                </td>
            </tr>
            <tr>
                <th colspan="2"><input type="submit" id="btn" value="提交"><br><span>${msg}</span></th>
            </tr>
          
        </table>
        
   		</div>
   		 
	</form>
		
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
		var mysubmit=document.getElementById("btn");
		window.onload=function(){
			mysubmit.onclick=function(){
				var student=document.getElementById("student").value;
				var className=document.getElementById("className").value;
				var reason=document.getElementById("reason").value;
				if(student.length>0&&className.length>0&&reason.length>0){
					alert("提交成功");
				}else{
					event.preventDefault();
					alert("内容不能为空");
				}
			}
		}
</script>

</body>
</html>