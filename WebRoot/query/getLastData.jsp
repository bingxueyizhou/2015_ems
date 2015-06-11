<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="sql.EMSSql"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	
	String str_type = request.getParameter("type");
	
	/**adujust the params is effective**/
	if (str_type == null){
		out.print("null");
		return;
	}
	
	if (!str_type.equals("pm2_5")&&
		!str_type.equals("tem")&&
		!str_type.equals("noiser")&&
		!str_type.equals("wet")){
		
		out.print("null");
		return;
	}
	
	EMSSql db = new EMSSql();
	String sql = "select `data` from `"+str_type+"` order by id desc limit 1";
	ResultSet rs = db.SelectQuery(sql);
	rs.next();
	out.print(rs.getString("data"));
 %>