<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="sql.GetChartData"%>
<%@page import="sql.YlxJSONHelper"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	
	String str_type = request.getParameter("type");
	String str_date = request.getParameter("date");
	String str_det = request.getParameter("detail");
	
	/**adujust the params is effective**/
	if (str_type == null||
		str_date == null){

		out.println("{\"code\":0,\"msg\":\"major data is null\"}");
		return;
	}
	
	if (!str_type.equals("pm2_5")&&
		!str_type.equals("wet")&&
		!str_type.equals("tem")&&
		!str_type.equals("noiser")){
		
		out.println("{\"code\":0,\"msg\":\"type isn't right\"}");
		return;
	}
	
	GetChartData pm = new GetChartData(str_type);
	ArrayList<Double> listData = new ArrayList<Double>();
	if (str_det == null){
		if (str_date.equals("day") ){
			listData = pm.getDayPerMonth();
		}else if(str_date.equals("month") ){
			listData = pm.getMonthPerYear();
		}else if(str_date.equals("year") ){
			listData = pm.getYearOfAll();
		}
	}else{
		if (str_date.equals("day") ){
			listData = pm.getDayPerMonth(Integer.parseInt(str_det));
		}else if(str_date.equals("month") ){
			listData = pm.getMonthPerYear(Integer.parseInt(str_det));
		}else if(str_date.equals("year") ){
			listData = pm.getYearOfAll(Integer.parseInt(str_det));
		}
	}
	
	String str_res = YlxJSONHelper.Java2Json(listData);
	if (str_res.length() < 12){
		out.println("{\"code\":0,\"msg\":\"mistake in geting data\"}");
	}else{
		out.println("{\"code\":1,"+str_res.substring(1));
	}
 %>