<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="sql.*"%>
<%	
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	
	String str_type = request.getParameter("type");
	String str_data = request.getParameter("data");
	String str_time = request.getParameter("time");
	String str_sid = request.getParameter("sid");
	
	/**adujust the params is effective**/
	if (str_type == null||
		str_data == null||
		str_sid == null||
		str_time == null){

		out.println(""+2);
		return;
	}
	
	if (!str_type.equals("pm2_5")&&
		!str_type.equals("wet")&&
		!str_type.equals("tem")&&
		!str_type.equals("noiser")){
		
		out.println(""+2);
		return;
	}
	
	/*整合为系统时间*/
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	str_time = formatter.format(new java.util.Date());

	/**连接数据库**/
	int state  = 0;
	EMSSql db = new EMSSql();
	
	/*数据库语句拼接*/
	String sql = "insert into `"+str_type+"`(time,data,mark) values(" +
					"'"+str_time+"',"+
					"'"+str_data+"'," +
					"'"+str_sid+"')";
					
	
	/*SQL语句操作*/
	if (db.ModifyQuery(sql)){
		state = 1;
	}
	
	out.println(""+state);
	/*
	<!--
	String user = "root";
	String password = ;
	[java]
	byte[] bytes=name.getBytes("ISO-8859-1");//将请求忏悔书用ISO-8859-1分解成字节数组
	name=new String(bytes,"utf-8");//将字节数组重新解码成字符串
	2、使用URLDecoder解码字符串
	[java] 
	String name=request.getQueryString();//获取请求参数  
	name1=URLDecoder.decode(name,"utf-8");//重新解码 -->
	
	try {
		statement.executeUpdate(sql);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	*/
%>
