<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common-header.jsp" %>
<%@ include file="common-ui.jsp" %>
<%-- <%@ include file="index.jsp" %> --%>
<%
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //HH24小时制  hh12小时制
	String date=sdf.format(new Date());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>schedule_table</title>
<script type="text/javascript">
	function deleteRev(reserve_id,user_id,user_type){
		if(confirm("是否确认取消预约？")){
		$.ajax({
			url :'${basePath}/deleteReservation',/* 执行controller */
			contentType:"application/x-www-form-urlencoded; charset=utf-8",
			dataType : 'json' ,
			data : {'reserve_id':reserve_id},
		    success : function(data){
		    	alert(data.msg);
		    	if(data.success==true){
		    		window.location.href='${basePath}/reservationByUser?user_id='+user_id+'&&user_type='+user_type;
		    	}
			},
			error : function(){
				alert("取消预约失败");
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
    <li><a href="#">查看预约信息</a></li>
    </ul>
</div>
    
<div class="formbody">
<div class="formtitle"><span>查看预约信息</span></div>

<div id="tab1" class="tabson">

<table class="tablelist">
    <thead>
    	<tr>
        <th>序号<i class="sort"><img src="${basePath }/resource/images/px.gif" /></i></th>
        <th>创建时间</th>
        <c:if test="${loginuser.user_type==1}"><th >预约类型</th></c:if>
        <th>实验室名称</th>
        <th>预约时间</th>
        <th>预约人数</th>
         <th>备注</th>
        <th>操作</th>
        </tr>
    </thead>
	<tbody>
	<c:forEach var="list" items="${requestScope.list}" varStatus="stauts">
	<tr>
	  <td>${stauts.count}</td>
	  <td><fmt:formatDate value="${list.create_time }" pattern="yyyy-MM-dd HH:mm"/></td>
	  <c:if test="${loginuser.user_type==1}">
	  	<td>
	  		<c:if test="${list.reserve_type==1 }">个人预约</c:if>
	  		<c:if test="${list.reserve_type==2 }">课堂预约</c:if>
	  	</td>
	  </c:if>
	  <td>${list.building_name }${list.room_number }</td>
	  <td>${list.reserve_date } 
	  	<c:if test="${list.time_interval==1 }">  8:00~10:00</c:if>
	  	<c:if test="${list.time_interval==2 }">  10:00~12:00</c:if>
	  	<c:if test="${list.time_interval==3 }">  14:00~16:00</c:if>
	  	<c:if test="${list.time_interval==4 }">  16:00~18:00</c:if>
	  	<c:if test="${list.time_interval==5 }">  19:00~21:00</c:if>
	  </td>
	  <td>${list.r_person_number }</td>
	  <td>${list.r_description }</td>
	  <td >
	  	<c:set var="currentday">
		<fmt:formatDate value="<%=new Date()%>" pattern="yyyy-MM-dd" type="date"/>
		</c:set>
		
		<c:if test="${list.reserve_date < currentday }">
		<input type="button" value="不可取消预约"  id="deletebtn"  disabled="true"></input>
		</c:if>
		<c:if test="${list.reserve_date >= currentday }">
		<img src="${basePath }/resource/images/t03.png" ></img>
			 <input type="button" value="取消预约"  id="deletebtn" onclick="deleteRev('${list.reserve_id }','${loginuser.user_id }','${loginuser.user_type }');" ></input>
		</c:if>
	  </td>
	</tr>
	</c:forEach>
	</tbody>
</table>
</div>


<c:if test="${loginuser.user_type==2}">
<div class="formtitle"><span>实验课程</span></div>
<div id="tab2" class="tabson">
<table class="tablelist">
    <thead>
    	<tr>
        <th>序号<i class="sort"><img src="${basePath }/resource/images/px.gif" /></i></th>
        <th>创建时间</th>
        <th>实验室名称</th>
        <th>课堂名称</th>
        <th>预约时间</th>
        <th>工作日</th>
        <th>备注</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach var="list" items="${requestScope.list2}" varStatus="stauts">
	<tr>
	  <td>${stauts.count}</td>
	  <td><fmt:formatDate value="${list.create_time }" pattern="yyyy-MM-dd HH:mm"/></td>
	  <td>${list.building_name }${list.room_number }</td>
	  <td>${list.course_name }</td>
	  <td>${list.reserve_date } 
	  	<c:if test="${list.time_interval==1 }">  8:00~10:00</c:if>
	  	<c:if test="${list.time_interval==2 }">  10:00~12:00</c:if>
	  	<c:if test="${list.time_interval==3 }">  14:00~16:00</c:if>
	  	<c:if test="${list.time_interval==4 }">  16:00~18:00</c:if>
	  	<c:if test="${list.time_interval==5 }">  19:00~21:00</c:if>
	  </td>
	  <td>
	  	<c:if test="${list.weekday==1 }">周一</c:if>
	  	<c:if test="${list.weekday==2 }">周二</c:if>
	  	<c:if test="${list.weekday==3 }">周三</c:if>
	  	<c:if test="${list.weekday==4 }">周四</c:if>
	  	<c:if test="${list.weekday==5 }">周五</c:if>
	  	<c:if test="${list.weekday==6 }">周六</c:if>
	  	<c:if test="${list.weekday==7 }">周日</c:if>
	  </td>
	  <td>${list.r_description }</td>
	</tr>
	</c:forEach>
    </tbody>
</table>
</div>
</c:if>
</div>
<script type="text/javascript"> 
	$("#usual1 ul").idTabs(); 
</script>
    
<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
</script>

</body>
</html>
