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
out.println(rs.getString("unit_db_name")+"<br>");
out.println(session.getAttribute("USERC"));
out.println(session.getValue("usernamec"));
out.println(session.getValue("human_IDD"));
out.println(session.getValue("tagc"));
out.println(session.getValue("realeditorc"));
out.println(session.getValue("idc"));
out.println(session.getValue("unit_db_name"));
out.println(session.getValue("language"));
%>