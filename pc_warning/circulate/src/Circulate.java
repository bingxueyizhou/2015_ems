import java.text.SimpleDateFormat;
import java.util.Date;

import theLearn.TestAlert;

public class Circulate {
	
	private static final String host="http://cdylx.3322.org:9998";
	
	public static String getTime(){
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//new Date()为获取当前系统时间
		return formatter.format(new Date());
	}
	
	public static double getPM2_5(){
		try {
			return Double.parseDouble(
					HttpRequest.sendGet(host+"/ylx/ems/query/getLastData.jsp",
							"type=pm2_5")
					);
		} catch (Exception e) {
			return 0;
		}
	}
	
	public static double getTem(){
		try{
			return Double.parseDouble(
					HttpRequest.sendGet(host+"/ylx/ems/query/getLastData.jsp",
							"type=tem")
					);
		} catch (Exception e) {
			return 0;
		}
	}
	
	public static double getWet(){
		try{
			return Double.parseDouble(
					HttpRequest.sendGet(host+"/ylx/ems/query/getLastData.jsp",
							"type=wet")
					);
		} catch (Exception e) {
			return 0;
		}
	}
	
	public static double getNoiser(){
		try{
			return Double.parseDouble(
					HttpRequest.sendGet(host+"/ylx/ems/query/getLastData.jsp",
							"type=noiser")
					);
		} catch (Exception e) {
			return 0;
		}
	}
	
	public static void main (String[] args ){
		System.out.println("Hello\n");
		///*
		while(true){
			String w=getTime();
			double PM2_5=getPM2_5();
			double noiser=getNoiser();
			double tem=getTem();
			double wet=getWet();
			
			if(PM2_5<=200&&PM2_5>100){
				TestAlert t = new TestAlert("提示","PM2_5",w,"已达到轻微污染");
				new Thread(t).start();
			}else if(PM2_5>200){
				TestAlert t = new TestAlert("警告","PM2_5",w,"已达重度污染");
				new Thread(t).start();
			}
			
			if(noiser>55&&noiser<=90){
				TestAlert t = new TestAlert("提示","噪音",w,"人体感觉烦躁");
				new Thread(t).start();
			}else if(noiser>90){
				TestAlert t = new TestAlert("警告","噪音",w,"对耳朵有损害");
				new Thread(t).start();
			}
			
			if(tem>35&&tem<=40){
				TestAlert t = new TestAlert("提示","温度",w,"天气燥热");
				new Thread(t).start();
			}else if(tem>40){
				TestAlert t = new TestAlert("警告","温度",w,"天气酷热，不宜出行");
				new Thread(t).start();
			}
			
			if(wet>70&wet<=85){
				TestAlert t = new TestAlert("提示","湿度",w,"空气闷");
				new Thread(t).start();
			}else if(wet>85){
				TestAlert t = new TestAlert("警告","湿度",w,"可能要下雨");
				new Thread(t).start();
			}
			try {
				Thread.sleep(1000*60);
			} catch (Exception e) {}
		}//*/
	}
	
	

}
