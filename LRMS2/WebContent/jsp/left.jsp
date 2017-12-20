<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common-header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>

<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
})	
</script>


</head>

<body style="background:#f0f9fd;">
	<!-- <div class="lefttop"><span></span>通讯录</div> -->
    
    <dl class="leftmenu">
    
    <c:if test="${loginuser.user_type==0}">
    <dd>
    <div class="title">
    <span><img src="${basePath }/resource/images/leftico01.png" /></span>主界面
    </div>
   		<ul class="menuson">
        <li class="active"><cite></cite><a href="${basePath }/AnnouncementList" target="rightFrame">公告</a><i></i></li>
        </ul> 
    </dd>
        
    <dd>
    <div class="title">
    <span><img src="${basePath }/resource/images/user.png" /></span>用户管理
    </div>
    	<ul class="menuson">
        <li class="active"><cite></cite><a href="${basePath }/jsp/personInfo.jsp" target="rightFrame">查看个人信息</a><i></i></li>
        <li><cite></cite><a href="${basePath }/jsp/changePwd.jsp" target="rightFrame">修改个人密码</a><i></i></li>
        <li><cite></cite><a href="${basePath }/userList?user_type=1" target="rightFrame">教师管理</a><i></i></li>
        <li><cite></cite><a href="${basePath }/userList?user_type=2" target="rightFrame">学生管理</a><i></i></li>
        </ul>    
    </dd>
    
    <dd>
    <div class="title">
    <span><img src="${basePath }/resource/images/leftico01.png" /></span>实验室管理
    </div>
    	<ul class="menuson">
        <li class="active"><cite></cite><a href="${basePath }/jsp/addLaboratory.jsp" target="rightFrame">新增实验室</a><i></i></li>
        <li><cite></cite><a href="${basePath }/labList" target="rightFrame">查看实验室</a><i></i></li>
        </ul>    
    </dd>
    
    <%-- <dd>
    <div class="title">
    <span><img src="${basePath }/resource/images/leftico01.png" /></span>学期管理
    </div>
    	<ul class="menuson">
        <li  class="active"><cite></cite><a href="${basePath }/jsp/addTerm.jsp" target="rightFrame">新增学期</a><i></i></li>
        <li><cite></cite><a href="#" target="rightFrame">删除学期</a><i></i></li>
        </ul>    
    </dd> --%>
    
    <dd>
    <div class="title">
    <span><img src="${basePath }/resource/images/leftico03.png" /></span>预约信息管理
    </div>
    	<ul class="menuson">
        <li  class="active"><cite></cite><a href="${basePath }/schedule_table?lab_id=1" target="rightFrame">排期表</a><i></i></li>
        <li><cite></cite><a href="${basePath }/jsp/selectReservation.jsp?a=0" target="rightFrame">高级搜索</a><i></i></li>
        </ul>    
    </dd>
    
    <dd>
    <div class="title">
    <span><img src="${basePath }/resource/images/leftico01.png" /></span>公告管理
    </div>
    	<ul class="menuson">
        <li  class="active"><cite></cite><a href="${basePath }/jsp/addAnnouncement.jsp" target="rightFrame">发布公告</a><i></i></li>
        <li><cite></cite><a href="${basePath }/ManageAnnouncementList" target="rightFrame">删除公告</a><i></i></li>
        </ul>    
    </dd>
    </c:if>
    
	<c:if test="${loginuser.user_type==1}">
	<dd>
    <div class="title">
    <span><img src="${basePath }/resource/images/leftico01.png" /></span>主界面
    </div>
   		<ul class="menuson">
        <li  class="active"><cite></cite><a href="${basePath }/AnnouncementList" target="rightFrame">公告</a><i></i></li>
        </ul> 
    </dd>
        
    <dd>
    <div class="title">
    <span><img src="${basePath }/resource/images/leftico01.png" /></span>用户管理
    </div>
    	<ul class="menuson">
        <li  class="active"><cite></cite><a href="${basePath }/jsp/personInfo.jsp" target="rightFrame">查看个人信息</a><i></i></li>
        <li><cite></cite><a href="${basePath }/jsp/changePwd.jsp" target="rightFrame">修改个人密码</a><i></i></li>
        </ul>    
    </dd>
    
    <dd>
    <div class="title">
    <span><img src="${basePath }/resource/images/leftico01.png" /></span>预约管理
    </div>
    	<ul class="menuson">
        <li  class="active"><cite></cite><a href="${basePath }/reserveLabList" target="rightFrame">预约实验室</a><i></i></li>
        <li ><cite></cite><a href="${basePath }/reservationByUser?user_id=${loginuser.user_id}&&user_type=${loginuser.user_type}" target="rightFrame">查看预约信息</a><i></i></li>
        <li ><cite></cite><a href="${basePath }/schedule_table?lab_id=1" target="rightFrame">实验室排期表</a><i></i></li>
        <li><cite></cite><a href="${basePath }/jsp/selectReservation.jsp" target="rightFrame">高级搜索</a><i></i></li>
        </ul>    
    </dd>
    
    <dd>
    <div class="title">
    <span><img src="${basePath }/resource/images/leftico01.png" /></span>课程管理
    </div>
    	<ul class="menuson">
        <li  class="active"><cite></cite><a href="${basePath }/jsp/addCourse.jsp" target="rightFrame">新增课程</a><i></i></li>
        <li  ><cite></cite><a href="${basePath }/courseList?user_id=${loginuser.user_id}" target="rightFrame">课程列表</a><i></i></li>
        </ul>    
    </dd>
    
    <%-- <dd>
    <div class="title">
    <span><img src="${basePath }/resource/images/leftico01.png" /></span>上传学生花名册
    </div>
    	<ul class="menuson">
        <li  class="active"><cite></cite><a href="${basePath }/jsp/uploadCourse_User.jsp" target="rightFrame">上传学生花名册</a><i></i></li>
        </ul>    
    </dd> --%>
	</c:if>  
	
	<c:if test="${loginuser.user_type==2}">
	<dd>
    <div class="title">
    <span><img src="${basePath }/resource/images/leftico01.png" /></span>主界面
    </div>
   		<ul class="menuson">
        <li  class="active"><cite></cite><a href="${basePath }/AnnouncementList" target="rightFrame">公告</a><i></i></li>
        </ul> 
    </dd>
        
    <dd>
    <div class="title">
    <span><img src="${basePath }/resource/images/leftico01.png" /></span>用户管理
    </div>
    	<ul class="menuson">
        <li  class="active"><cite></cite><a href="${basePath }/jsp/personInfo.jsp" target="rightFrame">查看个人信息</a><i></i></li>
        <li ><cite></cite><a href="${basePath }/jsp/changePwd.jsp" target="rightFrame">修改个人密码</a><i></i></li>
        </ul>    
    </dd>
    
    <dd>
    <div class="title">
    <span><img src="${basePath }/resource/images/leftico01.png" /></span>预约管理
    </div>
    	<ul class="menuson">
        <li  class="active"><cite></cite><a href="${basePath }/reserveLabList" target="rightFrame">预约实验室</a><i></i></li>
        <li ><cite></cite><a href="${basePath }/reservationByUser?user_id=${loginuser.user_id}&&user_type=${loginuser.user_type}" target="rightFrame">查看预约信息</a><i></i></li>
        <li ><cite></cite><a href="${basePath }/schedule_table?lab_id=1" target="rightFrame">实验室排期表</a><i></i></li>
        <li><cite></cite><a href="${basePath }/jsp/selectReservation.jsp" target="rightFrame">高级搜索</a><i></i></li>
        </ul>    
    </dd>
    
	</c:if>  
	  
    </dl>
    
</body>
</html>
