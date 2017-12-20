<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common-header.jsp" %>
<%@ include file="common-ui.jsp" %>
<%-- <%@ include file="index.jsp" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>index</title>
</head>

<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">用户管理</a></li>
    <li><a href="#">个人信息</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>个人信息</span></div>
    
    <ul class="forminfo">
    <li><label>用户名：</label><input name="" type="text" class="dfinput" value="${loginuser.login_name }" disabled="disabled"/></li>
    <li><label>姓名：</label><input name="" type="text" class="dfinput" value="${loginuser.user_name }" disabled="disabled"/></li>
    <li><label>性别：</label>
    	<c:if test="${loginuser.sex==1 }"><input name="" type="text" class="dfinput" value="男" disabled="disabled"/><br/></c:if>
		<c:if test="${loginuser.sex==2 }"><input name="" type="text" class="dfinput" value="女" disabled="disabled"/><br/></c:if>
	</li>
    <li><label>年龄：</label><input name="" type="text" class="dfinput" value="${loginuser.age }" disabled="disabled"/></li>
    <li><label>学院：</label><input name="" type="text" class="dfinput" value="${loginuser.institute }" disabled="disabled"/></li>
    <li><label>专业：</label><input name="" type="text" class="dfinput" value="${loginuser.major }" disabled="disabled"/></li>
    <li><label>第一次登陆:</label>
    	<c:if test="${loginuser.is_firstlogin==0 }"><input name="" type="text" class="dfinput" value="是" disabled="disabled"/><br/></c:if>
		<c:if test="${loginuser.is_firstlogin==1 }"><input name="" type="text" class="dfinput" value="否" disabled="disabled"/><br/></c:if>	
    </li>
    <li><label>用户类别:</label>
    	<c:if test="${loginuser.user_type==0 }"><input name="" type="text" class="dfinput" value="管理员" disabled="disabled"/><br/></c:if>
		<c:if test="${loginuser.user_type==1 }"><input name="" type="text" class="dfinput" value="教师" disabled="disabled"/><br/></c:if>
		<c:if test="${loginuser.user_type==2 }"><input name="" type="text" class="dfinput" value="学生" disabled="disabled"/><br/></c:if>
    </li>
    </ul>
    </div>


</body>
</html>