package sql;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;

public class GetChartData {
	EMSSql db;
	String tables;
	DecimalFormat df = new DecimalFormat("######0.00"); 
	
	public GetChartData(String u,String p,String tb){
		this.db = new EMSSql(u,p);
		this.tables = tb;
	}
	
	public GetChartData(String tb){
		this.db = new EMSSql();
		this.tables = tb;
	}
	
	/**
	 * 获得数据库中年初到指定【年月】的每日的统计数据
	 * @author 邹兵
	 * @param year 公历年
	 * @param month 月1-12
	 * @param eday 这个月的天数
	 * @return ArrayList of month data from 1 to month
	 */
	private ArrayList<Double> getMonthPerYear(int year,int month,int endday){
		ArrayList<Double> list = new ArrayList<Double>();

		//System.out.println(str_time_b+"\n"+str_time_a);
		String sql;
		ResultSet rs = null;
		for(int i=1;i<=month;i++){
			
			String str_time_b = year+"-"+i+"-1 0:0:0";
			String str_time_a = year+"-"+i+"-"+endday+" 23:59:59";
			sql = "select * from "+this.tables+" where time>='"+str_time_b+
				"'and time<= '"+str_time_a+"' order by time asc";
			//System.out.println(sql);
			rs = db.SelectQuery(sql);
			try {
				String data = null;
				double iSum   = 0f;
				int    iNum   = 0;
				while(rs.next()){
					data = rs.getString("data");
					iSum += Double.parseDouble(data);
					iNum ++;
				}
				if (iSum == 0){
					list.add(iSum);
				}else{
					list.add(Double.parseDouble(df.format(iSum/iNum)));
				}
			}catch(SQLException e){e.printStackTrace();}
		}
		try {
			db.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//System.out.println(LabelListDayOfMonth);
		//System.out.println(list.toString());
		//System.out.println(list.size());
		return list;
	}

	/**
	 * 获得数据库中年初到本月的每日的统计数据
	 * @author 邹兵
	 * @return ArrayList of month data from 1 to now month
	 */
	public ArrayList<Double> getMonthPerYear() {
		/*初始化要查询的时间段*/
		Calendar cal = Calendar.getInstance();
		int year  = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		int now_day = cal.get(Calendar.DAY_OF_MONTH);
		return getMonthPerYear(year,month,now_day);
	}
	
	/**
	 * 
	 * 获得数据库中指定年初到年末（本月）的每日的统计数据
	 * @author 邹兵
	 * @param mon the aim of month
	 * @return ArrayList of month data from 1 to mon
	 */
	public ArrayList<Double> getMonthPerYear(int year) {
		/*初始化要查询的时间段*/
		Calendar cal = Calendar.getInstance();
		int now_day = cal.get(Calendar.DAY_OF_MONTH);
		return getMonthPerYear(year,12,now_day);
	}
	
	/**
	 * 获得数据库中2014年到指定年的数据的List
	 * @author 邹兵
	 * @param year 公历年
	 * @param month 月1-12
	 * @param now_day 天1-28,29,30,31
	 * @return ArrayList of data year from 2014 to now
	 */
	public ArrayList<Double> getYearOfAll(int year){
		ArrayList<Double> list = new ArrayList<Double>();

		//System.out.println(str_time_b+"\n"+str_time_a);
		String sql;
		ResultSet rs = null;
		for(int i=2014;i<=year;i++){
			
			String str_time_b = i+"-1-1 0:0:0";
			String str_time_a = i+"-12-31 23:59:59";
			sql = "select * from "+this.tables+" where time>='"+str_time_b+
				"'and time<= '"+str_time_a+"' order by time asc";
			//System.out.println(sql);
			rs = db.SelectQuery(sql);
			try {
				String data = null;
				double iSum   = 0f;
				int    iNum   = 0;
				while(rs.next()){
					data = rs.getString("data");
					iSum += Double.parseDouble(data);
					iNum ++;
				}
				if (iSum == 0){
					list.add(iSum);
				}else{
					list.add(Double.parseDouble(df.format(iSum/iNum)));
				}
			}catch(SQLException e){e.printStackTrace();}
		}
		try {
			db.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//System.out.println(LabelListDayOfMonth);
		//System.out.println(list.toString());
		//System.out.println(list.size());
		return list;
	}

	/**
	 * 获得数据库中2014年到今年的数据的List
	 * @author 邹兵
	 * @return ArrayList of data year from 2014 to now
	 */
	public ArrayList<Double> getYearOfAll() {
		/*初始化要查询的时间段*/
		Calendar cal = Calendar.getInstance();
		int year  = cal.get(Calendar.YEAR);
		return getYearOfAll(year);
	}
	
	/**
	 * 获得数据库中本月月初到指定【日】的数据的List
	 * @author 邹兵
	 * @param year 公历年
	 * @param month 月1-12
	 * @param now_day 天1-28,29,30,31
	 * @return ArrayList of day from 1 to now
	 */
	private ArrayList<Double> getDayPerMonth(int year,int month,int now_day){
		ArrayList<Double> list = new ArrayList<Double>();

		//System.out.println(str_time_b+"\n"+str_time_a);
		String sql;
		ResultSet rs = null;
		for(int i=1;i<=now_day;i++){
			
			String str_time_b = year+"-"+month+"-"+i+" 0:0:0";
			String str_time_a = year+"-"+month+"-"+i+" 23:59:59";
			sql = "select * from "+this.tables+" where time>='"+str_time_b+
				"'and time<= '"+str_time_a+"' order by time asc";
			//System.out.println(sql);
			rs = db.SelectQuery(sql);
			try {
				String data = null;
				double iSum   = 0f;
				int    iNum   = 0;
				while(rs.next()){
					data = rs.getString("data");
					iSum += Double.parseDouble(data);
					iNum ++;
				}
				if (iSum == 0){
					list.add(iSum);
				}else{
					list.add(Double.parseDouble(df.format(iSum/iNum)));
				}
			}catch(SQLException e){e.printStackTrace();}
		}
		try {
			db.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//System.out.println(LabelListDayOfMonth);
		//System.out.println(list.toString());
		//System.out.println(list.size());
		return list;
	}

	/**
	 * 获得数据库中本月的数据的List
	 * @author 邹兵
	 * @return ArrayList of day from 1 to now
	 */
	public ArrayList<Double> getDayPerMonth() {
		/*初始化要查询的时间段*/
		Calendar cal = Calendar.getInstance();
		int year  = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		int now_day = cal.get(Calendar.DAY_OF_MONTH);
		return getDayPerMonth(year,month,now_day);
	}
	
	/**
	 * 
	 * 获得数据库中指定月的天数据统计的List
	 * @author 邹兵
	 * @param mon the aim of month
	 * @return ArrayList of data from 1 to now
	 */
	public ArrayList<Double> getDayPerMonth(int mon) {
		/*初始化要查询的时间段*/
		Calendar cal = Calendar.getInstance();
		int year  = cal.get(Calendar.YEAR);
		return getDayPerMonth(year,mon,getNumOfMonth(mon));
	}
	/**
	 * 返回month的天数
	 * @param mon the month
	 * @return the days of the month
	 */
	private int getNumOfMonth(int mon){
		if (mon == 2){
			return 28;
		}else if (mon == 1||mon==3||mon==5||mon==7||mon==8||mon==10||mon==12){
			return 31;
		}else {
			return 30;
		}
	}
	
	/*
	public static void main(String args[]){
		GetChartData pm = new GetChartData("root","","pm2_5");
		JSONObject json = null;
		try {
			json = new JSONObject(Java2Json(pm.getDayPerMonth()));
			System.out.println(json.toString());
		} catch (JSONException e) {
			e.printStackTrace();
		}

		System.out.println(Json2Java(json));
	}//*/
}
