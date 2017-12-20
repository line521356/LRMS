<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="basePath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎登录实验室预约管理系统</title>
<link href="${basePath }/resource/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="${basePath }/resource/js/jquery.js"></script>
<script src="${basePath }/resource/js/cloud.js" type="text/javascript"></script>
<script type="text/javascript" src="${basePath }/resource/jquery.min.js"></script>
<link href="${basePath }/resource/css/buttonStyle.css" rel="stylesheet" type="text/css" />

<script language="javascript">
	$(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })  
});  
	function checkLogin(){
		var loginname=$("#loginname").val();
		var password=$("#password").val();
		var logintype=$("#type:checked").val(); /* 获取选中的radio的value */
		if(loginname==""){
			alert("用户名为空");
			return false;
		}else if(password==""){
			alert("密码为空");
			return false;
		}/* else if(logintype==null){
			alert("为啥不选一个捏~！");
			return false;
		} */else
			return true;
	}
	function login(){
		if(checkLogin()){
			$.ajax({
				url : '${basePath}/login',/* 执行controller */
				dataType : 'json' , 
				data : $("#form").serialize(),
				success : function(data){
					if(data.success){
						alert(data.msg);
						window.location.href='${basePath}/index';
					}else{
						alert(data.msg);
					}
				},
				error : function(){
					alert("登录失败");
				}
			});
		}
	}
	
	function changePwd(){
		window.location.href='${basePath}/jsp/index1.jsp';
	}
</script> 

</head>

<body style="background-color:#1c77ac; background-image:url(LRMS2/resource/images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">

    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  

<div class="logintop">    
    <span>欢迎登录实验室预约管理系统</span>    
    <ul>
    <li><a href="${basePath}/index">回首页</a></li>
    <li><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    </ul>    
    </div>
    
    <div class="loginbody">
    
    <span class="systemlogo"></span> 
       
    <div class="loginbox">
    <form action="login" method="post" id="form" >
    <ul>
    <li><input name="login_name" id="loginname" type="text" class="loginuser" placeholder="用户名" /></li>
    <li><input name="password" id="password" type="password" class="loginpwd" placeholder="密码" /></li>
    <li><input name="" type="button" class="loginbtn" value="登录"  onclick="login();"/><label><a  onclick="changePwd();">忘记密码？</a></label></li>
    </ul>
    </form>
    </div>
    
    </div>
    
    
    
    <div class="loginbm">如有问题请联系xiu-hongc@foxmail.com，所有权归陈秀红所有</div>
	
    
</body>

</html>
