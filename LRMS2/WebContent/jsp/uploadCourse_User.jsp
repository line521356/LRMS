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
		var fileName=$("#file").val();
		if(courseNumber==""){
			alert("课程编号不能为空！");
			return false;
		}
		if(courseName==""){
			alert("课程名称为空！");
			return false;
		}
		return true;
	}
	function uploadCourse_User(user_id){
		if(check()){
			var courseNumber=$("#courseNumber").val();
			var courseName=$("#courseName").val();
			var fileName=$("#file").val();
			$.ajax({
				url :'${basePath}/uploadCourse_User',/* 执行controller */
				contentType:"application/x-www-form-urlencoded; charset=utf-8",
				dataType : 'json' , 
				data : {"js_id":user_id,"courseNumber":courseNumber,"courseName":courseName,"fileName":fileName},
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
    <li><a href="#">花名册</a></li>
    <li><a href="#">上传学生花名册</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    <div class="formtitle"><span>新增课程</span></div>
    <form action="" method="post" id="form"  enctype="multipart/form-data">
    <input type="hidden" name="js_id" id="js_id" value="${loginuser.user_id}" ></input>
    <ul class="forminfo">
    <li><label>课程编号：<b>*</b></label><input type="text" name="courseNumber" id="courseNumber" placeholder="课程编号 如：C001" class="dfinput"  style="width:400px;"></input><i>只能为字符数字或者下划线</i> </li>
    <li><label>课程名称：<b>*</b></label><input type="text" name="courseName" id="courseName" placeholder="课程名称 如：C++" class="dfinput"  style="width:400px;"></input> </li> 
    <li><label>上传花名册：<b>*</b></label><input type="file" name="file" id="file" placeholder="花名册" class="dfinput"  style="width:400px;"></li>
    </li>
    <li><label>&nbsp;</label><input name="" type="button" class="btn" value="提交" onclick="uploadCourse_User('${loginuser.user_id}');"/> <input name="" type="reset" class="btn" value="取消" /></li>
    </ul>
    </form>
    </div> 

</body>
</html>