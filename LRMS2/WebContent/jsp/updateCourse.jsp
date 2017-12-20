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
	var courseName=$("#courseName").val();
	var person_number=$("#person_number").val();
	var r = /^[0-9]*[1-9][0-9]*$/;
	if(courseName==""){
		alert("课程名称为空！");
		return false;
	}
	if(person_number==""){
		alert("课堂人数不能为空！");
		return false;
	}
	if(!r.test(person_number)){
		alert("课堂人数必须为正整数！");
		return false;
	}
	return true;
}
function updateCourse(user_id){
	if(check()){
	$.ajax({
		url:"${basePath}/updateCourse",
		data:$("#form").serialize(),
		dataType:"json",
		type : 'post' ,
		success:function(data){
			 if(data.success){
				alert(data.msg);
				window.location.href="${basePath}/courseList?user_id="+user_id;
			} 
		},
		error:function(data){
			alert(data.msg);
		}		
	});	
	}}
function cancle(user_id){
	window.location.href="${basePath}/courseList?user_id="+user_id;
}
</script>
</head>

<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">课程管理</a></li>
    <li><a href="#">更新课程</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    <div class="formtitle"><span>更新课程</span></div>
    <form action="" method="post" id="form" >
    <input type="hidden" name="js_id" id="js_id" value="${loginuser.user_id}" ></input>
    <input type="hidden" name="course_id" id="course_id" value="${course.course_id}" ></input><br/>
    <ul class="forminfo">
    <li><label>课程编号：<b>*</b></label><input type="text" name="courseNumber" id="courseNumber" placeholder="课程编号 如：C001" class="dfinput"  style="width:400px;" value="${course.courseNumber }" disabled="disabled"></input></li>
    <li><label>课程名称：<b>*</b></label><input type="text" name="courseName" id="courseName" placeholder="课程名称 如：C++" class="dfinput"  style="width:400px;" value="${course.courseName }"></input> </li> 
    <li><label>课堂人数：<b>*</b></label><input type="text" name="person_number" id="person_number" placeholder="请输入整数" class="dfinput"  style="width:400px;" value="${course.person_number }"/><i>只能为整数</i>  </li>
    <li><label>课堂描述：<b>*</b></label>
    <textarea name="courseDescription" id="courseDescription"  placeholder="课堂介绍" class="textarea1" >${course.courseDescription }</textarea>
    </li>
    <li><label>&nbsp;</label><input name="" type="button" class="btn" value="确认修改" onclick="updateCourse('${loginuser.user_id}');"/> <input name="" type="button" class="btn" value="取消" onclick="cancle('${loginuser.user_id}');" /></li>
    </ul>
    </form>
    </div> 

</body>
</html>