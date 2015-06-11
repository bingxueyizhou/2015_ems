<!-- 
author:zoubing
date:2015/5/20
 -->
<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="include.ylx_db.ylx_db"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	
	String msg = request.getParameter("msg");
	if (msg == null){
		out.println("{\"code\",\"0\"}");
		return;
	}
	ylx_db db = new ylx_db("ylxdb");
	long now = (new java.util.Date().getTime());
	db.executeUpdate("insert into teach_comment_ems(msg,time) values(" +
			"'"+msg+"',"+
			"'"+(new java.sql.Date(now))+" "+(new java.sql.Time(now))+"')");
	out.println("{\"code\",\"1\"}");
%>
