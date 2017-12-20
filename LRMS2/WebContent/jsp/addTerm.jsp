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
		var term_name=$("#term_name").val();
		var from=$("#from").val();
		var end=$("#end").val();
		var description=$("#description").val();
		var r = /^[0-9]*[1-9][0-9]*$/;
		
		if(term_name==""){
			alert("学期名称为空！");
			return false;
		}
		if(from==""){
			alert("请选择开始日期！");
			return false;
		}
		if(end==""){
			alert("请选择结束日期！");
			return false;
		}
		return true;
	}
	function addTerm(){
		if(check()){
			$.ajax({
				url :'${basePath}/addTerm',/* 执行controller */
				contentType:"application/x-www-form-urlencoded; charset=utf-8",
				dataType : 'json' , 
				data : $("#form").serialize(),
			    success : function(data){
			    	alert(data.msg);
			    	if(data.success){
			    		window.location.href='${basePath}/labList';
			    	}
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
    <li><a href="#">学期管理</a></li>
    <li><a href="#">新增学期</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    <div class="formtitle"><span>新增学期</span></div>
    <form action="" method="post" id="form" >
    <ul class="forminfo">
    <li><label>学期名称：<b>*</b></label><input type="text" name="term_name" id="term_name" placeholder="学期名称 如：2016-2017下学期" class="dfinput"  style="width:345px"></input> </li>
    <li><label>开始日期：<b>*</b></label><input name="from" id="from" class="Wdate" type="text" onfocus="WdatePicker({minDate:'%y-{%M-3}-%d',maxDate:'%y-{%M+3}-{%d-1}'})" placeholder="开始日期" style="width:345px; height:32px; line-height:32px; border-top:solid 1px #a7b5bc; border-left:solid 1px #a7b5bc; border-right:solid 1px #ced9df; border-bottom:solid 1px #ced9df;"/> </li> 
    <li><label>结束日期：<b>*</b></label><input name="end" id="end" class="Wdate" type="text" onfocus="WdatePicker({minDate:'%y-{%M+3}-%d',maxDate:'%y-{%M+9}-%d'})" placeholder="结束日期" style="width:345px; height:32px; line-height:32px; border-top:solid 1px #a7b5bc; border-left:solid 1px #a7b5bc; border-right:solid 1px #ced9df; border-bottom:solid 1px #ced9df;"/></li>
    <li><label>描述信息：<b>*</b></label>
    <textarea name="description" id="description"   wrap="hard" placeholder="备注信息" style="width:400px; height:150px; line-height:32px; border-top:solid 1px #a7b5bc; border-left:solid 1px #a7b5bc; border-right:solid 1px #ced9df; border-bottom:solid 1px #ced9df;"></textarea>
    </li>
    <li><label>&nbsp;</label><input name="" type="reset" class="btn" value="确认添加" onclick="addTerm();"/> <input name="" type="reset" class="btn" value="取消" /></li>
    </ul>
    </form>
    </div>


</body>
</html>