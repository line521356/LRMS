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
	function deleteAnnouncement(publish_id){
		if(confirm("是否确认删除该公告？")){
		$.ajax({
			url:"${basePath}/deleteAnnouncement",
			data:{"publish_id":publish_id},
			dataType:"json",
			type : 'post' ,
			success:function(data){
				 if(data.success){
					alert(data.msg);
					window.location.href="${basePath}/ManageAnnouncementList";
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
    <li><a href="#">公告管理</a></li>
    <li><a href="#">删除公告</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    <div class="formtitle"><span>删除公告</span></div>

<div id="tab2" class="tabson">

<table class="tablelist">
    <thead>
    	<tr>
		<th>序号<i class="sort"><img src="${basePath }/resource/images/px.gif" /></i></th>        
		<th>创建时间</th>
        <th>标题</th>
        <th>内容</th>
        <th>操作</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach var="list" items="${requestScope.list}" varStatus="stauts">
        <tr>
        		<td>${stauts.count}</td>
        		<td><fmt:formatDate value="${list.create_time }" pattern="yyyy-MM-dd HH:mm"/></td>
				<td>${list.title }</td>
				<td>${list.content }</td>
			   	<td>
				<a onclick="deleteAnnouncement('${list.publish_id }')" class="tablelink">
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