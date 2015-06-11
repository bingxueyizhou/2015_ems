<!-- 
author:zoubing
date:2015/5/20
 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="include.ylx_db.*" import="java.sql.*"%>
<%
ylx_db db=new ylx_db("mysql");
String sql="select * from unit_info where active_tag='1' and unit_id='ylx'";
ResultSet rs=db.executeQuery(sql);
rs.next();
String sql_name = rs.getString("unit_db_name");
if (session.getValue("unit_db_name") != null){
	String session_name = session.getValue("unit_db_name").toString();
	if (!session_name.equals(sql_name)) {
		out.println("<script type=\"text/javascript\">window.location.href=\"/ylx/home/login.jsp\";</script>");
	}
}else{
	out.println("<script type=\"text/javascript\">window.location.href=\"/ylx/home/login.jsp\";</script>");
}
%>
