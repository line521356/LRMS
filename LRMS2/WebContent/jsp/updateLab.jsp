<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common-header.jsp" %>
<%@ include file="common-ui.jsp" %>
<%-- <%@ include file="index.jsp" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>updateLab</title>
<script type="text/javascript">
function check(){
	var building_name=$("#building_name").val();
	var room_number=$("#room_number");
	var person_number=$("#person_number");
	var is_free=$("#is_free");
	var description=$("#description");
	var r = /^[0-9]*[1-9][0-9]*$/;
	
	if(building_name==""){
		alert("教学楼名字为空！");
		return false;
	}
	if(room_number==""){
		alert("实验室No为空！");
		return false;
	}
	if(person_number==""){
		alert("可容纳人数为空！");
		return false;
	}
	if(r.test(room_number)){
		alert("实验室No不是正整数！");
		return false;
	}
	if(r.test(person_number)){
		alert("可容纳人数不是正整数！");
		return false;
	}
	return true;
}
function updateLab(){
	if(check()){
	$.ajax({
		url:"${basePath}/updateLab",
		data:$("#form").serialize(),
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
function cancle(){
	window.location.href="${basePath}/labList";
}
</script>
</head>

<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">实验室管理</a></li>
    <li><a href="#">更新实验室</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    <div class="formtitle"><span>更新实验室</span></div>
    <form action="" method="post" id="form" >
    <input type="hidden" name="lab_id" id="lab_id" value="${lab.lab_id}" ></input><br/>
    <ul class="forminfo">
    <li><label>教学楼：<b>*</b></label><input type="text" name="building_name" id="building_name" value="${lab.building_name }" placeholder="教学楼名字如：文泰" class="dfinput"  style="width:518px;"></input> </li>
    <li><label>实验室No：<b>*</b></label><input type="text" name="room_number" id="room_number" value="${lab.room_number }" placeholder="实验室编号如：101" class="dfinput"  style="width:518px;"></input> </li> 
    <li><label>容纳人数：<b>*</b></label><input type="text" name="person_number" id="person_number" value="${lab.person_number }" placeholder="请输入整数" class="dfinput"  style="width:518px;"><i>只能为整数</i>  </li>
    <li> 
    <div class="vocation" style="display:none;"> 
    <label>空闲状态：<b>*</b></label>
    	   <select name="is_free" id="is_free" class="select1">
		   <c:if test="${lab.is_free==0 }">	<option value ="0" selected="selected">是</option></c:if>
		   <c:if test="${lab.is_free==1 }">	<option value ="1" selected="selected">否</option></c:if>
		   </select>
	</div>
	</li>
    
    <li><label>描述信息<b>*</b></label>
    <textarea name="description" id="description"  placeholder="实验室备注信息" 
    style="width:400px; height:150px; line-height:32px; border-top:solid 1px #a7b5bc; border-left:solid 1px #a7b5bc; border-right:solid 1px #ced9df; border-bottom:solid 1px #ced9df;"
    >${lab.description}</textarea>
    </li>
    <li><label>&nbsp;</label><input name="" type="button" class="btn" value="确认添加" onclick="updateLab();"/> <input name="" type="button" class="btn" value="取消" onclick="cancle();" /></li>
    </ul>
    </form>
    </div> 

</body>
</html>