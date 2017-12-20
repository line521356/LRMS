<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- //表示jsp页面使用utf-8字符集 -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<!-- //引用jstl标签 -->

<%@ page import="java.text.SimpleDateFormat,java.util.Date " %>  
<!-- //引用date库 -->

<c:set var="basePath" value="${pageContext.request.contextPath }"></c:set>
<!-- //设置项目的根路径 -->



<script type="text/javascript" charset="utf-8"  src="${basePath }/resource/jquery.datetimepicker.js"></script>
<script type="text/javascript" src="${basePath }/resource/jquery.min.js"></script>
<!-- //引用jquery -->

<link type="text/css" rel="stylesheet" href="${basePath }/resource/css/datetimepicker.css">
<link href="${basePath}/resource/css/div.css" rel="stylesheet" type="text/css" />
<link href="${basePath}/resource/css/buttonStyle.css" rel="stylesheet" type="text/css" />
<!-- //引用css文件 -->

<%-- <link href="${basePath }/resource/laydate/need/laydate.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${basePath }/resource/laydate/laydate.js" defer="defer"></script>
 --%>
<script type="text/javascript" src="${basePath }/resource/My97DatePicker/WdatePicker.js" defer="defer"></script>
<!-- 日期控件 -->


<%@ page import="entity.*"  %>
<!-- //引用src目录下的package -->
  
    
<%-- 
<img style="position:absolute;left:0px;top:0px;width:100%;height:100%;z-Index:-1;border:1px solid blue" 
	src="${basePath}/resource/images/background.jpg"> 

<!-- 头部 -->
<div id="head">
	<a href="">${loginuser.user_name}</a>
	<a href="${basePath}/jsp/login.jsp">退出登录</a>
</div>

<!-- 左边栏 -->    
<div class="left"></div>

<!-- 内容栏 -->
<div class="content"></div>

<hr id="hr1"/>

<div id="foot"><center>如有问题请联系xiu-hongc@foxmail.com，所有权归陈秀红所有</center></div>
</img> --%>



<!--以下是模板中的样式导入  -->
<link href="${basePath }/resource/css/style.css" rel="stylesheet" type="text/css" />
<link href="${basePath }/resource/css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${basePath }/resource/js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="${basePath }/resource/js/select-ui.min.js"></script>
<script type="text/javascript" src="${basePath }/resource/editor/kindeditor.js"></script>
<script type="text/javascript" src="${basePath }/resource/js/jquery.js"></script>

