<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="sql.EMSSql"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	
	EMSSql db    = new EMSSql();
	ResultSet rs = null;
	String[] sql = new String[]{
					"select `data` from `pm2_5` order by id desc limit 1",
					"select `data` from `wet` order by id desc limit 1",
					"select `data` from `tem` order by id desc limit 1",
					"select `data` from `noiser` order by id desc limit 1"
				};
	String[] name= new String[]{"pm2_5","wet","tem","noiser"};
	String[] res = new String[name.length];
	try{
		for(int i=0;i<sql.length;i++){
			rs = db.SelectQuery(sql[i]);
			rs.next();
			res[i] = rs.getString("data");
		}
		out.println("{\"code\":1,\"msg\":\"success\""+
					",\"place\":\"<a href='http://cdylx.3322.org:9998/ylx/ems/function/maps.jsp?x=104.003323&y=30.557691'>四川大学(江安校区)</a>\""+
					",\""+name[0]+"\":\""+res[0]+"\""+
					",\""+name[1]+"\":\""+res[1]+"\""+
					",\""+name[2]+"\":\""+res[2]+"\""+
					",\""+name[3]+"\":\""+res[3]+"\""+
					"}");
	}catch(Exception e){
		out.println("{\"code\":0,\"msg\":\""+e.toString()+"\"}");
	}
 %>