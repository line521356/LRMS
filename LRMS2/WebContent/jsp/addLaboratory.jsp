<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common-header.jsp" %>
<%@ include file="common-ui.jsp" %>
<%-- <%@ include file="index.jsp" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>addLaboratory</title>
<script type="text/javascript">
	function check(){
		var building_name=$("#building_name").val();
		var room_number=$("#room_number").val();
		var person_number=$("#person_number").val();
		var is_free=$("#is_free").val();
		var description=$("#description").val();
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
		if(!r.test(room_number)){
			alert("实验室No不是正整数！");
			return false;
		}
		if(!r.test(person_number)){
			alert("可容纳人数不是正整数！");
			return false;
		}
		return true;
	}
	function addLab(){
		if(check()){
			$.ajax({
				url :'${basePath}/addLab',/* 执行controller */
				contentType:"application/x-www-form-urlencoded; charset=utf-8",
				dataType : 'json' , 
				data : $("#form").serialize(),
			    success : function(data){
						window.location.href='${basePath}/labList';
				},
				error : function(){
					alert("亲，添加失败了，不开森");
				}
			});
		}
	}
</script>

</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">实验室管理</a></li>
    <li><a href="#">新增实验室</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    <div class="formtitle"><span>新增实验室</span></div>
    <form action="" method="post" id="form" >
    <ul class="forminfo">
    <li><label>教学楼：<b>*</b></label><input type="text" name="building_name" id="building_name" placeholder="教学楼名字如：文泰" class="dfinput"  style="width:518px;"></input> </li>
    <li><label>实验室No：<b>*</b></label><input type="text" name="room_number" id="room_number" placeholder="实验室编号如：101" class="dfinput"  style="width:518px;"></input> </li> 
    <li><label>容纳人数：<b>*</b></label><input type="text" name="person_number" id="person_number" placeholder="请输入整数" class="dfinput"  style="width:518px;"><i>只能为整数</i>  </li>
    <li> 
    <div class="vocation" style="display:none;"> 
    		<label>空闲状态：<b>*</b></label>
    		<select name="is_free" id="is_free" class="select1">
					<option value ="0" selected="selected">是</option>
					<option value ="1">否</option>
			</select>
	
	</div>
	</li>
    <li><label>描述信息<b>*</b></label>
    <textarea name="description" id="description"   wrap="hard" placeholder="实验室备注信息" style="width:400px; height:150px; line-height:32px; border-top:solid 1px #a7b5bc; border-left:solid 1px #a7b5bc; border-right:solid 1px #ced9df; border-bottom:solid 1px #ced9df;"></textarea>
   
    <!-- <textarea name="description" id="description" style="width:700px;height:250px;visibility:hidden;" placeholder="实验室备注信息"></textarea>
     -->
    </li>
    <li><label>&nbsp;</label><input name="" type="button" class="btn" value="确认添加" onclick="addLab();"/> <input name="" type="reset" class="btn" value="取消" /></li>
    </ul>
    </form>
    </div> 

</body>
</html>