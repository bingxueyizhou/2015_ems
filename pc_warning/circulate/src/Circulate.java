import java.text.SimpleDateFormat;
import java.util.Date;

import theLearn.TestAlert;

public class Circulate {
	
	private static final String host="http://cdylx.3322.org:9998";
	
	public static String getTime(){
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//new Date()Ϊ��ȡ��ǰϵͳʱ��
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
				TestAlert t = new TestAlert("��ʾ","PM2_5",w,"�Ѵﵽ��΢��Ⱦ");
				new Thread(t).start();
			}else if(PM2_5>200){
				TestAlert t = new TestAlert("����","PM2_5",w,"�Ѵ��ض���Ⱦ");
				new Thread(t).start();
			}
			
			if(noiser>55&&noiser<=90){
				TestAlert t = new TestAlert("��ʾ","����",w,"����о�����");
				new Thread(t).start();
			}else if(noiser>90){
				TestAlert t = new TestAlert("����","����",w,"�Զ�������");
				new Thread(t).start();
			}
			
			if(tem>35&&tem<=40){
				TestAlert t = new TestAlert("��ʾ","�¶�",w,"��������");
				new Thread(t).start();
			}else if(tem>40){
				TestAlert t = new TestAlert("����","�¶�",w,"�������ȣ����˳���");
				new Thread(t).start();
			}
			
			if(wet>70&wet<=85){
				TestAlert t = new TestAlert("��ʾ","ʪ��",w,"������");
				new Thread(t).start();
			}else if(wet>85){
				TestAlert t = new TestAlert("����","ʪ��",w,"����Ҫ����");
				new Thread(t).start();
			}
			try {
				Thread.sleep(1000*60);
			} catch (Exception e) {}
		}//*/
	}
	
	

}
