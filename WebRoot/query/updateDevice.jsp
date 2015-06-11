<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="sql.*"%>
<%	
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	
	String str_id 		= request.getParameter("id");
	String str_type 	= request.getParameter("type");
	String str_name 	= request.getParameter("name");
	String str_op_code 	= request.getParameter("op");
	
	/**adujust the params is effective**/
	if (str_op_code == null||
		str_id 	 == null
		){

		out.println("{\"code\":0,\"msg\":\"major data is null\"}");
		return;
	}
	
	/**连接数据库**/
	EMSSql db = new EMSSql();
	
	/*数据库语句拼接*/
	String sql = "";
	if (str_op_code.equals("update")){
		if (str_type == null||str_name == null){
			out.println("{\"code\":0,\"msg\":\"major data is null\"}");
			return;
		}
		
		if (!str_type.equals("pm2_5")&&
			!str_type.equals("wet")&&
			!str_type.equals("tem")&&
			!str_type.equals("noiser")&&
			!str_type.equals("center")&&
			!str_type.equals("videor")){
			
			out.println("{\"code\":0,\"msg\":\"type isn't right\"}");
			return;
		}
	
		sql = "update `sensor` set "+ 
					"`name`='"+str_name+"', "+
					"`type`='"+str_type+"' "+
					"where `id`='"+str_id+"'";
	}else if(str_op_code.equals("delete")){
		sql = "delete from `sensor`" +
					"where id='"+str_id+"'";
	}else{
		out.println("{\"code\":0,\"msg\":\"operation is undefined\"}");
		return;
	}
					
	
	/*SQL语句操作*/
	out.println(sql);
	///*
	if (db.ModifyQuery(sql)){
		out.println("{\"code\":1,\"msg\":\"success\"}");
	}else{
		out.println("{\"code\":0,\"msg\":\"mistake in updating\"}");
	}//*/
%>

