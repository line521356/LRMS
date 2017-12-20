<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common-header.jsp" %>
<%@ include file="common-ui.jsp" %>
<%-- <%@ include file="index.jsp" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>labList</title>
<script type="text/javascript">
function getCourseById(course_id){
	window.location.href="${basePath}/getCourseById?course_id="+course_id;
}
	function deleteCourse(course_id,user_id){
		if(confirm("是否确认删除该课程？")){
		$.ajax({
			url:"${basePath}/deleteCourse",
			data:{"course_id":course_id},
			dataType:"json",
			type : 'post' ,
			success:function(data){
				 if(data.success){
					alert(data.msg);
					window.location.href="${basePath}/courseList?user_id="+user_id;
				} 
			},
			error:function(data){
				alert(data.msg);
			}		
		});	
		}}
</script>
</head>

<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">课程管理</a></li>
    <li><a href="#">课程列表</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    <div class="formtitle"><span>课程列表</span>
	</div>

<div id="tab2" class="tabson">

<table class="tablelist">
    <thead>
    	<tr>
        <th>课程编号<i class="sort"><img src="${basePath }/resource/images/px.gif" /></i></th>
        <th>课程名称</th>
        <th>课堂人数</th>
        <th>描述</th>
        <th>操作</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach var="courseList" items="${requestScope.courseList}">
			<tr >				
				<td >${courseList.courseNumber }</td>
				<td >${courseList.courseName }</td>
				<td >${courseList.person_number }</td>
				<td >${courseList.courseDescription}</td>
				<td >
				<a onclick="getCourseById('${courseList.course_id }');"  class="tablelink">
				<img src="${basePath }/resource/images/t02.png" ></img>编辑</a>
				&nbsp;&nbsp;&nbsp;
				<a onclick="deleteCourse('${courseList.course_id }','${loginuser.user_id }');" class="tablelink">
				<img src="${basePath }/resource/images/t03.png" ></img>删除</a>
				
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