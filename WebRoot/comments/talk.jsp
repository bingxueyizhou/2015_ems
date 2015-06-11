<!-- 
author:zoubing
date:2015/5/20
 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="sql.EMSSql" import="java.sql.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
String sql;
ResultSet rs = null;
EMSSql db = new EMSSql();
sql = "select * from talk";
rs = db.SelectQuery(sql);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
    <base href="<%=basePath%>">
    <title>PM2.5讨论</title>
  </head>
  
  <body>
  <p>
  	<table>
    <tr>
		<td>地点</td>
		<td>温度(℃)</td>
		<td>湿度</td>
		<td>PM2.5（μg/m3）</td>
	</tr>
	<tr> 
		<td>一基楼 </td>
		<td>32</td>
		<td>32%</td>
		<td>41</td>
	</tr>
	<tr> 
		<td>建环学院 </td>
		<td>33 </td>
		<td>33% </td>
		<td>37 </td>
	</tr>
	<tr>
		<td>西南门 </td>
		<td>32</td>
		<td>32%</td>
		<td>83 </td>
	</tr>
	<tr>
		<td>明远湖</td>
		<td>33</td>
		<td>33%</td>
		<td>37 </td>
	</tr>
	<tr>
		<td>图书馆</td>
		<td>30</td>
		<td>34%</td>
		<td>78 </td>
	</tr>
	<tr>
		<td>东门</td>
		<td>32</td>
		<td>31%</td>
		<td>85 </td>
	</tr>
	<tr>
		<td>不高山 </td>
		<td>31</td>
		<td>31%</td>
		<td>75 </td>
	</tr>
	<tr>
		<td>青广</td>
		<td>34</td>
		<td>30%</td>
		<td>75</td>
	</tr>
	
	</table>
	<p>
	实验数据仅用户学习和研究
	by XM16&XM17
	</p>
  </p>
  <p>
  <form method="post" action="./qtalk.jsp">
  	<textarea name='msg' value=""></textarea>
  	<input type="submit"/>
  </form>
  </p>
  <hr>
  <p>累计评论</p>
  <%
  while(rs.next()){
  String str_msg  = rs.getString("msg");
  String str_time = rs.getString("time");
  %>
  <p>
  <%=str_time %>:&nbsp;&nbsp;
  <%=str_msg %>
  </p>
  <br>
  <%}%>
  </body>
</html>
