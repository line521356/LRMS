<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>selectCourse</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resource/jquery.min.js"></script>
<script type="text/javascript">

function select(){
	var selectDiv=$("#selectDiv");
	if(!selectDiv.is(':hidden')){
		selectCourse('${loginuser.user_id}');
	}
}
</script>
</head>

<body >
<div class="content" id="courseDiv">
	<h2>
		请选择一门课程
	</h2>
	<table border="2px" align="center">
		<tr align="center">
			<td width="7%">课程编号</td>
			<td width="7%">课程名称</td>
			<td width="14%">课程描述</td>
			<td width="4%">操作</td>			
		</tr>
		<c:forEach var="courseList" items="${requestScope.courseList}">
			<tr onclick="" align="center">				
				<td >${courseList.courseNumber }</td>
				<td >${courseList.courseName }</td>
				<td >${courseList.courseDescription }</td>
				<td ><input type="button" value="选择"  id="selectbtn" onclick="selectCourse('${userList.user_id }','${userList.user_type}');"></input></td>
			</tr>			
		</c:forEach>	
	</table>
</div>
</body>
</html>