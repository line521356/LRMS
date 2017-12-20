<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common-header.jsp" %>
<%@ include file="common-ui.jsp" %>
<%-- <%@ include file="index.jsp" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>schedule_table</title>
<script type="text/javascript">
	function selectReservation1(){
			$.ajax({
				url :'${basePath}/selectReservation',/* 执行controller */
				contentType:"application/x-www-form-urlencoded; charset=utf-8",
				dataType : 'json' , 
				data : $("#form").serialize(),
			    success :function(data){
			    	alert("123");
			    	window.location.href='${basePath}/jsp/selectReservation.jsp';
			    } 
			    		
				/*error : function(){
					alert("预约失败");
				} */
			});
	}

</script>
</head>

<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">预约信息管理</a></li>
    <li><a href="#">高级搜索</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    <!-- <div class="formtitle"><span>排期表</span></div> -->

<div id="tab2" class="tabson">
<form action="${basePath}/selectReservation" method="post" id="form" >
<c:if test="${loginuser.user_type==0}"><input type="hidden" name="user_id" id="user_id" value='0' ></input></c:if>
<c:if test="${loginuser.user_type!=0}"><input type="hidden" name="user_id" id="user_id" value="${loginuser.user_id}" ></input></c:if>

<ul class="seachform">
    <li><label>用户类别：</label>
    <div class="vocation">
    <select name="user_type" id="user_type"  class="select1">
    	<option value =''>请选择用户类别</option>
		<option value ='1'>教师</option> 
		<option value ='2'>学生</option>
	</select>
    </div>
    </li>
    <c:if test="${loginuser.user_type==0}">
    <li><label>用户名：</label><input name="user_name" id="user_name" class="dfinput"  style="width:100px"></input></li>
	</c:if>
	<c:if test="${loginuser.user_type==0}">
    <li><label></label><input name="user_name" id="user_name" class="dfinput"  style="width:10px" type="hidden" value=""></input></li>
	</c:if>
	
	<li><label>预约类型：</label>
    <div class="vocation">
    <select name="reserve_type" id="reserve_type"  class="select1">
    	<option value =''>请选择预约类别</option>
		<option value ='1'>个人预约</option> 
		<option value ='2'>课堂预约</option>
	</select>
    </div>
    </li>
    <li><label>选择日期区间：</label>
    <input name="from" id="from"  class="Wdate"  type="text" onfocus="WdatePicker({minDate:'{%y-1}-%M-%d'})" placeholder="选择开始日期" style="width:150px; height:32px; line-height:32px; border-top:solid 1px #a7b5bc; border-left:solid 1px #a7b5bc; border-right:solid 1px #ced9df; border-bottom:solid 1px #ced9df;"/>		
		&nbsp;&nbsp;至&nbsp;&nbsp;
		<input name="end" id="end"  class="Wdate"  type="text" onfocus="WdatePicker({minDate:'{%y-1}-%M-{%d+1}',maxDate:'%y-{%M+6}-%d'})" placeholder="选择结束日期" style="width:150px; height:32px; line-height:32px; border-top:solid 1px #a7b5bc; border-left:solid 1px #a7b5bc; border-right:solid 1px #ced9df; border-bottom:solid 1px #ced9df;"/>
		&nbsp;&nbsp;&nbsp;&nbsp;
    </li>  
    <li><label>&nbsp;</label><input name="" type="submit" class="scbtn" value="查询" onclick="selectReservation()"/></li>
</ul>
</form>
<c:if test="${empty list1}"><br/><center><h2>暂无查询记录</h2></center></c:if>
<c:if test="${not empty list1}">
<table class="tablelist">
    <thead>
    	<tr>
        <th>序号<i class="sort"><img src="${basePath }/resource/images/px.gif" /></i></th>
        <th>实验室名称</th>
        <th>用户名</th>
        <th>预约类型</th>
        <c:if test="${loginuser.user_type!=2}"><th>课程名称</th></c:if>
        <th>预约时间</th>
        <th>预约人数</th>
        <th>备注</th>
        <th>创建时间</th>
        </tr>
    </thead>
	<tbody>
	<c:forEach var="list" items="${requestScope.list1}" varStatus="stauts">
	<tr>
	  <td>${stauts.count}</td>
	  <td>${list.building_name }${list.room_number }</td>
	  <td>${list.user_name}</td>
	  <td>
	  		<c:if test="${list.reserve_type==1 }">个人预约</c:if>
	  		<c:if test="${list.reserve_type==2 }">课堂预约</c:if>
	  </td>
	  <c:if test="${loginuser.user_type!=2}">
	  	<td>${list.course_name}</td>
	  </c:if>
	  
	  <td>${list.reserve_date } 
	  	<c:if test="${list.time_interval==1 }">  8:00~10:00</c:if>
	  	<c:if test="${list.time_interval==2 }">  10:00~12:00</c:if>
	  	<c:if test="${list.time_interval==3 }">  14:00~16:00</c:if>
	  	<c:if test="${list.time_interval==4 }">  16:00~18:00</c:if>
	  	<c:if test="${list.time_interval==5 }">  19:00~21:00</c:if>
	  </td>
	  <td>${list.person_number }</td>
	  <td>${list.description }</td>
	  <td><fmt:formatDate value="${list.create_time }" pattern="yyyy-MM-dd HH:mm"/></td>
	</tr>
	</c:forEach>
	</tbody>
</table>
</c:if>
</div>
</div>
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>


</body>
</html>
