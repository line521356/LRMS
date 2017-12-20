<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common-header.jsp" %>
<%@ include file="common-ui.jsp" %>
<%-- <%@ include file="index.jsp" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>userlist</title>
<script type="text/javascript">
	function deleteUser(user_id,user_type){
		var user_id=user_id;
		var user_type=user_type;
		if(confirm("是否确认删除该用户？")){
		$.ajax({
			url:"${basePath}/deleteUser",
			data:{"user_id":user_id},
			dataType:"json",
			type : 'post' ,
			success:function(data){
				 if(data.success){
					alert(data.msg);
					window.location.href="${basePath}/userList?user_type="+user_type;
				} 
			},
			error:function(data){
				alert(data.msg);
			}		
		});	
		}}
</script>
<script type="text/javascript">
    KE.show({
        id : 'content7',
        cssPath : './index.css'
    });
  </script>
  
<script type="text/javascript">
$(document).ready(function(e) {
    $(".select1").uedSelect({
		width : 345			  
	});
	$(".select2").uedSelect({
		width : 167  
	});
	$(".select3").uedSelect({
		width : 100
	});
});
</script>

</head>

<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">用户管理</a></li>
    <li><a href="#">
    	<c:if test="${user_type==1 }">教师</c:if>
		<c:if test="${user_type==2 }">学生</c:if>
	信息</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    <div class="formtitle"><span>
    	<c:if test="${user_type==1 }">教师</c:if>
		<c:if test="${user_type==2 }">学生</c:if>
	信息</span>
	</div>

<div id="tab2" class="tabson">

<table class="tablelist">
    <thead>
    	<tr>
        <th>用户名<i class="sort"><img src="${basePath }/resource/images/px.gif" /></i></th>
        <th>姓名</th>
        <th>年龄</th>
        <th>性别</th>
        <th>学院</th>
        <th>专业</th>
        <th>第一次登陆</th>
        <th>操作</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach var="userList" items="${requestScope.userList}">
        <tr>
        		<td >${userList.login_name }</td>
				<td >${userList.user_name }</td>
				<td >${userList.age }</td>
				<td >
					<c:if test="${userList.sex==1 }">男</c:if>
					<c:if test="${userList.sex==2 }">女</c:if>
				</td>
				<td >${userList.institute }</td>
				<td >${userList.major }</td>
				<td >
					<c:if test="${userList.is_firstlogin==0 }">是</c:if>
			   		<c:if test="${userList.is_firstlogin==1 }">否</c:if>
			   	</td>
			   	<td>
				<img src="${basePath }/resource/images/t03.png" ></img>
				<a onclick="deleteUser('${userList.user_id }','${userList.user_type}')" class="tablelink">删除</a>
				</td>
		</tr>
    </c:forEach> 
	</tbody>
</table>
</div>
</div>
	<script type="text/javascript"> 
      $("#usual1 ul").idTabs(); 
    </script>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>

</body>
</html>