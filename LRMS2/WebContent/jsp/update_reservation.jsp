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
<title>reserveLab</title>
<script type="text/javascript">
function changeDiv(){
	if($("#reserve_type").val()=='1'){
		$("#dateDiv1").show();
		$("#dateDiv2").hide();
		$("#persondiv1").show();
		$("#persondiv2").hide();
	}
	if($("#reserve_type").val()=='2'){
		$("#dateDiv2").show();
		$("#dateDiv1").hide();
		$("#persondiv2").show();
		$("#persondiv1").hide();
	}
}

function check()
{
	var r = /^[0-9]*[1-9][0-9]*$/;
	if($("#reserve_type").val()=='1'){
		if($("#reserve_date").val()==""){
			alert("请选择预约日期");
			return false;
		}
		return true;
	}
	if($("#reserve_type").val()=='2'){
		if($("#reserve_date2").val()==""){
			alert("请选择预约日期");
			return false;
		}
		if($("#person_number2").val()==""){
			alert("请输入课堂人数");
			return false;
		}
		if(!r.test($("#person_number2").val())){
			alert("课堂人数不是正整数！");
			return false;
		}
		return true;
	}
}

function reserve(){
    if(check()) {
		$.ajax({
			url :'${basePath}/reserveLab',/* 执行controller */
			contentType:"application/x-www-form-urlencoded; charset=utf-8",
			dataType : 'json' , 
			data : $("#form").serialize(),
		    success : function(data){
		    	alert(data.msg);
		    	if(data.success==true){
		    		window.location.href='${basePath}/reserveLabList';
		    	}
			},
			error : function(){
				alert("亲，预约失败了，不开森");
			}
		});
	} 
}
</script>
</head>

<body >
<div class="contentLeftDiv" id="parentDiv">
<h4>修改预约信息</h4>
	<form action="" method="post" id="form" >
	<input type="hidden" name="lab_id" id="lab_id"  value="${lab_id}"></input> 
	<input type="hidden" name="user_id" id="user_id" value="${loginuser.user_id}" ></input>
	<input type="hidden" name="create_time" id="create_time" value="<%=date %>" ></input>
	<div style="width:219px;text-align:right;">
		<c:if test="${loginuser.user_type==1}">
		预约类型：	<select name="reserve_type" id="reserve_type" onchange="changeDiv();">
				<option value ="1">为个人预约</option>
				<option value ="2">为课堂预约</option>
			</select>
		</c:if>
		<c:if test="${loginuser.user_type==2}">
			<input type="hidden" name="reserve_type" id="reserve_type" value="1" ></input><br/>
		</c:if>
	</div><br/>
	<%-- <div id="selectCourse" style="display: none;">
	选择课堂： <button id="btnSelectCourse" type="button"  data-toggle="modal" data-target="#slterBatchModal" onclick="selectCourse()">选择</button>
           <input type="hidden" name="course_id" id="course_id" ></input>
           <input id="courseName" name="courseName" type="text" readOnly="readOnly" placeholder="选择后显示课堂名称" value="${course.courseName }" />
    </div> --%>                             
	<div id="dateDiv1" style="width:300px;text-align:right;">预约日期：<input name="reserve_date" id="reserve_date" class="Wdate" type="text" onfocus="WdatePicker({minDate:'%y-%M-{%d}',maxDate:'%y-%M-{%d+3}'})" placeholder="选择时间"/></div>
	<div id="dateDiv2" style="display: none;width:300px;text-align:right;">预约日期：<input name="reserve_date2" id="reserve_date2" class="Wdate" type="text" onfocus="WdatePicker({minDate:'%y-%M-{%d}',maxDate:'%y-{%M+4}-{%d}'})" placeholder="选择时间"/></div><br/>   
	<div style="width:219px;text-align:right;">
		预约时间段：
		<select name="time_interval" id="time_interval">
				<option value ="1">8:00~10:00</option>
				<option value ="2">10:00~12:00</option>
				<option value ="3">14:00~16:00</option>
				<option value ="4">16:00~18:00</option>
				<option value ="5">19:00~21:00</option>
		</select>
	</div><br/>
	<div id="persondiv1" style="width:158px;text-align:right;">
		人数：
		<select name="person_number" id="person_number">
				<option value ="1">1</option>
				<option value ="2">2</option>
				<option value ="3">3</option>
				<option value ="4">4</option>
				<option value ="5">5</option>
				<option value ="6">6</option>
				<option value ="7">7</option>
				<option value ="8">8</option>
				<option value ="9">9</option>
				<option value ="10">10</option>
		</select>
	</div><br/>
	<div id="persondiv2" style="display: none;width:300px;text-align:right;">
          	 课堂人数： <input type="text" name="person_number2" id="person_number2" placeholder="输入课堂人数"></input>
    </div><br/>
	<div style="width:382px;text-align:right;">备注：<textarea name="description" id="description" cols="35" rows="5"  wrap="hard" placeholder="输入预约详情"></textarea></div><br/>
	<div style="width:220px;text-align:right;">
		<input type="button" value="确定"  id="update" onclick="reserve();"></input> 
		<input type="reset" value="取消" id="canclebtn" onclick="window.location.href='${basePath}/reserveLabList'"></input>  
	</div> 
	</form> 
</div>
</body>
</html>