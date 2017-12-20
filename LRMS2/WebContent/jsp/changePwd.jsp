<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common-header.jsp" %>
<%@ include file="common-ui.jsp" %>
<%-- <%@ include file="index.jsp" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>changePwd</title>
<script type="text/javascript">
	function checkPwd(){
		var password=$("#password").val();
		var repassword=$("#repassword").val();
		if(password==""){
			alert("请输入新密码");
			return false;
		}
		if(repassword==""){
			alert("请再次输入新密码");
			return false;
		}
		if(password!=repassword){
			alert("亲，两次密码输入不一致哟");
			return false;
		}
		if(password.length<6 || repassword.length>10){
			alert("密码长度限制为6~12！！！");
			return false;
		}
		return true;
	}
	function changePwd(){
		if(checkPwd()){
			$.ajax({
				url : '${basePath}/changePwd',/* 执行controller */
				dataType : 'json' , 
				data : $("#form").serialize(),
				success : function(data){
					if(data.success){
						alert(data.msg);
						window.location.href='${basePath}/jsp/AnnouncementList.jsp';
					}else{
						alert(data.msg);
					}
				},
				error : function(){
					alert("亲，密码修改失败了，不开森");
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
    <li><a href="#">用户管理</a></li>
    <li><a href="#">修改密码</a></li>
    </ul>
</div>
    
<div class="formbody">
    
    <div class="formtitle"><span>修改密码</span></div>
    <form action="changePwd" method="post" id="form" >
    <input type="hidden" name="user_id" id="user_id" value="${loginuser.user_id }"></input><br/>
    <ul class="forminfo">
    <li><label>&nbsp;&nbsp;&nbsp;新密码：<b>*</b></label><input type="password" name="password" id="password" class="dfinput"/><i>密码长度限制为6~12</i></li>
    <li><label>再次输入：<b>*</b></label><input type="password" name="repassword" id="repassword" class="dfinput"/><i>两次密码格式需要一致！</i></li>
    <li class="click"><label>&nbsp;</label><input name="" type="button" class="btn" value="确认修改" onclick="changePwd();"/> &nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="取消" /></li>
    </ul>
    </form>
</div>
    
 <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="${basePath }/resource/images/ticon.png" /></span>
        <div class="tipright">
        <p>是否确认提交 ？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    
    </div>
</body>
</html>