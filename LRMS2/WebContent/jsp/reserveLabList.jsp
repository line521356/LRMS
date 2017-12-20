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
function getLabReserveById(lab_id,user_id,labName){
	window.location.href="${basePath}/getLabReserveById?lab_id="+lab_id+"&&user_id="+user_id+"&&labName="+labName;
}
	function deleteLab(lab_id){
		var lab_id=lab_id;
		if(confirm("是否确认删除该实验室？")){
		$.ajax({
			url:"${basePath}/deleteLab",
			data:{"lab_id":lab_id},
			dataType:"json",
			type : 'post' ,
			success:function(data){
				 if(data.success){
					alert(data.msg);
					window.location.href="${basePath}/labList";
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
    <li><a href="#">预约管理</a></li>
    <li><a href="#">预约实验室</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    <div class="formtitle"><span>预约实验室</span></div>

<div id="tab2" class="tabson">

<table class="tablelist">
    <thead>
    	<tr>
        <th>实验楼名字<i class="sort"><img src="${basePath }/resource/images/px.gif" /></i></th>
        <th>实验室No</th>
        <th>容纳人数</th>
        <th>是否空闲</th>
        <th>描述</th>
        <th>操作</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach var="labList" items="${requestScope.labList}">
			<tr >				
				<td >${labList.building_name }</td>
				<td >${labList.room_number }</td>
				<td >${labList.person_number }</td>
				<td >${labList.is_free }</td>
				<td >${labList.description}</td>
				<td >
				
				
				<a onclick="getLabReserveById('${labList.lab_id }','${loginuser.user_id }','${labList.building_name }${labList.room_number }');"  class="tablelink">
				<img src="${basePath }/resource/images/t01.png" ></img>预约</a>
				
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