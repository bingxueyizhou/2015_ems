<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="java.util.UUID" import="sql.*"%>
<%	
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	
	UUID uuid = UUID.randomUUID();
	String str_name = request.getParameter("name");
	String str_x 	= request.getParameter("x");
	String str_y 	= request.getParameter("y");
	String str_type = request.getParameter("type");
	String str_info = request.getParameter("info");
	//out.println(str_info);
	String str_mark = uuid.toString().toUpperCase();
	
	/**adujust the params is effective**/
	if (str_name == null||
		str_x 	 == null||
		str_y 	 == null||
		str_type == null){

		out.println(""+2);
		return;
	}
	
	
	
	/**连接数据库**/
	int state  = 0;
	EMSSql db = new EMSSql();
	
	/*数据库语句拼接*/
	String sql = new String();
	if (str_info == null){
		sql = "insert into sensor(name,x,y,mark,type) values(" +
				"'"+str_name+"',"+
				"'"+str_x+"'," +
				"'"+str_y+"',"+
				"'"+str_mark+"'," +
				"'"+str_type+"')";
	}else{
		sql = "insert into sensor(name,x,y,mark,type,info_else) values(" +
				"'"+str_name+"',"+
				"'"+str_x+"'," +
				"'"+str_y+"',"+
				"'"+str_mark+"'," +
				"'"+str_type+"'," +
				"'"+str_info+"')";
	}
					
	/*SQL语句操作*/
	if (db.ModifyQuery(sql)){
		state = 1;
	}
	
	if (state == 1){
		out.println(str_mark);
		out.println("<script type=\"text/javascript\">window.location.href=\"../function/adddevice.jsp?sid="+str_mark+"\";</script>");
	}else {
		out.println(""+state);
	}//*/
%>
