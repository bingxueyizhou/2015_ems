<!-- 
author:zoubing
date:2015/5/20
 -->
<%@ page language="java" import="java.util.*" import="java.io.IOException" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"
		+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
  	<% 
  		response.setCharacterEncoding("utf-8"); 
		request.setCharacterEncoding("utf-8");
	%>
	<jsp:forward page="main.html"/>
	<%//response.setHeader("Refresh","1;url=http://www.baidu.com");%>
  </body>
</html>
