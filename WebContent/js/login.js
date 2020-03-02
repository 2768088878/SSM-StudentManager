function myonclick(){
	var name = document.getElementById("name").value;
	var password =document.getElementById("password").value;
	if(name.length == 0 ){
		alert("用户名不能为空,请重新输入");
		return;
	}
	if(password.length == 0){
		alert("密码不能为空,请重新输入");
		return;
	}
	document.getElementById("form1").submit();
	
}