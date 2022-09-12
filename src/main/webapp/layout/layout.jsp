<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Hansel & Crumb <sitemesh:write property='title'/></title>
<%@ include file="/common/head.jsp" %>
<sitemesh:write property='head'/>
</head>
<body>
	<div class="mainBody">
		<sitemesh:write property='body'/>
	</div>
	
	<div class="mainFooter">
		<%@ include file="/common/footer.jsp" %>
		<sitemesh:write property='footer'/>
	</div>
</body>
</html>