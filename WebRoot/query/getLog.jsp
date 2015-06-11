<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="sql.CheckLog"%>
<%@page import="java.io.FileInputStream"%>
<html>
<head>
<title>log查看器-冰雪一舟出品</title>
</head>
<body>
<p>author:冰雪一舟<br>方便查看logs/stdout.log文件</p><hr>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	
	CheckLog log = new CheckLog();
	FileInputStream fis = log.getSTDOUT_LOG();
	
	byte[] buf = new byte[1024];
	while(fis.read(buf) > 0){
		out.println(new String(buf).replace("\n","\n<br>"));
		buf = new byte[1024];
	}
	fis.close();
 %>
 </body>
 </html>