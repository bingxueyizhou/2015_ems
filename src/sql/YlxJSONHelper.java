package sql;

import java.util.ArrayList;

import atg.taglib.json.util.JSONArray;
import atg.taglib.json.util.JSONException;
import atg.taglib.json.util.JSONObject;

public class YlxJSONHelper {
	/**
	 * 把double的ArrayList转化为"data"的json数组
	 * @param d double的Arraylist
	 * @return String of Json
	 */
	public static String Java2Json(ArrayList<Double> d){
		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray(d);
		try {
			json.put("data",jarray);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return json.toString();
	}
	
	/**
	 * 把json中data内容转化为Arraylist
	 * @param json json值
	 * @return ArrayList<double>
	 */
	public static ArrayList<Double> Json2Java(JSONObject json){
		ArrayList<Double> list = new ArrayList<Double>();
		JSONArray jsonArray = new JSONArray();
		try {
			jsonArray = json.getJSONArray("data");
			for(int i=0;i<jsonArray.size();i++){
				list.add(jsonArray.getDouble(i));
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public static String Json2JavaSingleValue(JSONObject json,String val){
		try {
			return json.getString(val);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return "";
	}
}
