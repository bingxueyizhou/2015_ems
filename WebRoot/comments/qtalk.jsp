<!-- 
author:zoubing
date:2015/5/20
 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="sql.EMSSql"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	
	String msg = request.getParameter("msg");
	if (msg == null){
		out.println("评论成功");
		return;
	}
	EMSSql db = new EMSSql();
	long now = (new java.util.Date().getTime());
	db.ModifyQuery("insert into talk(msg,time) values(" +
			"'"+msg+"',"+
			"'"+(new java.sql.Date(now))+" "+(new java.sql.Time(now))+"')");
	out.println("评论成功");
%>
