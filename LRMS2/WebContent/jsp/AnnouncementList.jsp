<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common-header.jsp" %>
<%@ include file="common-ui.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">公告</a></li>
    </ul>
</div>
    
<div class="formbody">
<c:forEach var="list" items="${requestScope.list}">
<div class="formtitle"><span style="width:150px;"><fmt:formatDate value="${list.create_time }" pattern="yyyy-MM-dd HH:mm"/></span></div>
<b>Title:${list.title }</b><br/><br/>
Content:${list.content }<br/><br/><br/><br/>
</c:forEach>
</div>
</body>
</html>