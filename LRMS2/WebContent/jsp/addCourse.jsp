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
		var courseNumber=$("#courseNumber").val();
		var courseName=$("#courseName").val();
		var person_number=$("#person_number").val();
		var description=$("#courseDescription").val();
		var r = /^[0-9]*[1-9][0-9]*$/;
		 var reg = /^\w+$/;
		if(courseNumber==""){
			alert("课程编号不能为空！");
			return false;
		}
		if(courseName==""){
			alert("课程名称为空！");
			return false;
		}
		if(person_number==""){
			alert("课堂人数不能为空！");
			return false;
		}
		if(!reg.test(courseNumber)){
			alert("课程编号只能为字符数字或者下划线！");
			return false;
		}
		if(!r.test(person_number)){
			alert("课堂人数必须为正整数！");
			return false;
		}
		return true;
	}
	function addCourse(user_id){
		if(check()){
			$.ajax({
				url :'${basePath}/addCourse',/* 执行controller */
				contentType:"application/x-www-form-urlencoded; charset=utf-8",
				dataType : 'json' , 
				data : $("#form").serialize(),
			    success : function(data){
						window.location.href='${basePath}/courseList?user_id='+user_id;
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
    <li><a href="#">课程管理</a></li>
    <li><a href="#">新增课程</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    <div class="formtitle"><span>新增课程</span></div>
    <form action="" method="post" id="form" >
    <input type="hidden" name="js_id" id="js_id" value="${loginuser.user_id}" ></input>
    <ul class="forminfo">
    <li><label>课程编号：<b>*</b></label><input type="text" name="courseNumber" id="courseNumber" placeholder="课程编号 如：C001" class="dfinput"  style="width:400px;"></input><i>只能为字符数字或者下划线</i> </li>
    <li><label>课程名称：<b>*</b></label><input type="text" name="courseName" id="courseName" placeholder="课程名称 如：C++" class="dfinput"  style="width:400px;"></input> </li> 
    <li><label>课堂人数：<b>*</b></label><input type="text" name="person_number" id="person_number" placeholder="请输入整数" class="dfinput"  style="width:400px;"><i>只能为整数</i>  </li>
    <li><label>课堂描述：<b>*</b></label>
    <textarea name="courseDescription" id="courseDescription"  placeholder="课堂介绍" class="textarea1"></textarea>
    </li>
    <li><label>&nbsp;</label><input name="" type="button" class="btn" value="确认添加" onclick="addCourse('${loginuser.user_id}');"/> <input name="" type="reset" class="btn" value="取消" /></li>
    </ul>
    </form>
    </div> 

</body>
</html>