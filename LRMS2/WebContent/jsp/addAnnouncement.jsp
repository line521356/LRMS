<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common-header.jsp" %>
<%@ include file="common-ui.jsp" %>
<%-- <%@ include file="index.jsp"%>  --%>
<%
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //HH24小时制  hh12小时制
	String date=sdf.format(new Date());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>addAnnouncement</title>
<script type="text/javascript">
	function check(){
		var title=$("#title").val();
		var content=$("#content").val();
		if(title==""){
			alert("请输入标题！");
			return false;
		}
		if(content==""){
			alert("请输入公告内容！");
			return false;
		}
		return true;
	}
	function addAnnouncement(){
		if(check()){
			$.ajax({
				url :'${basePath}/addAnnouncement',/* 执行controller */
				contentType:"application/x-www-form-urlencoded; charset=utf-8",
				dataType : 'json' , 
				data : $("#form").serialize(),
			    success : function(data){
			    	alert(data.msg);
					window.location.href='${basePath}/index';
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
    <li><a href="#">公告管理</a></li>
    <li><a href="#">发布公告</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    <div class="formtitle"><span>发布公告</span></div>
    <form action="" method="post" id="form" >
    <input type="hidden" name="create_time" id="create_time" value="<%=date %>" ></input>
    <ul class="forminfo">
    <li><label>公告标题：<b>*</b></label><input type="text" name="title" id="title" placeholder="公告标题" class="dfinput"  style="width:345px"></input> </li>
    <li><label>公告内容：<b>*</b></label>
    <textarea name="content" id="content"   wrap="hard" placeholder="公告内容。。。" style="width:400px; height:150px; line-height:32px; border-top:solid 1px #a7b5bc; border-left:solid 1px #a7b5bc; border-right:solid 1px #ced9df; border-bottom:solid 1px #ced9df;"></textarea>
    </li>
    <li><label>&nbsp;</label><input name="" type="reset" class="btn" value="确认添加" onclick="addAnnouncement();"/> <input name="" type="reset" class="btn" value="取消" /></li>
    </ul>
    </form>
    </div>

</body>
</html>