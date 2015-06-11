
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.ServerSocket;
import java.net.Socket;
import java.text.SimpleDateFormat;
import java.util.Date;
  
public class LoginClient { 
	
	private static String host="http://cdylx.3322.org:9998";
	private static final int port = 17001;
	private static String[] str_data = new String[11];
	
	
	public static boolean getAll(String in){
		str_data = new String[11];
		//String test = "243,234,22,334,55,34,3,a,b,c,d";
		
		str_data = in.split(",");
		if (str_data.length < 11) return false;
		return true;
	}
	
	public static String getTime(){
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd+HH:mm:ss");
		//new Date()为获取当前系统时间
		return formatter.format(new Date());
	}
	
	public static boolean dealPM2_5(){
		
		//发送数据
		String p = "data="+str_data[3]+
					"&type=pm2_5"+
					"&sid="+str_data[9]+
					"&time="+getTime();
		//System.out.println(p);
		String rs = HttpRequest.sendGet(host+"/ylx/ems/query/sendData.jsp", p);
		if (rs.substring(rs.length()-1,rs.length()).equals("1")){
			System.out.println("pm2.5数据发送成功");
		}else{
			System.out.println("pm2.5数据发送失败");
		}
		return true;
	}
	
	public static boolean dealWet(){
		
		//发送数据
		String p = "data="+str_data[1]+
					"&type=wet"+
					"&sid="+str_data[8]+
					"&time="+getTime();
		//System.out.println(p);
		String rs = HttpRequest.sendGet(host+"/ylx/ems/query/sendData.jsp", p);
		if (rs.substring(rs.length()-1,rs.length()).equals("1")){
			System.out.println("湿度数据发送成功");
		}else
			System.out.println("湿度数据发送失败");
		}
		return true;
	}
	
	public static boolean dealTem(){
		
		//发送数据
		String p = "data="+str_data[0]+
					"&type=tem"+
					"&sid="+str_data[7]+
					"&time="+getTime();
		//System.out.println(p);
		String rs = HttpRequest.sendGet(host+"/ylx/ems/query/sendData.jsp", p);
		if (rs.substring(rs.length()-1,rs.length()).equals("1")){
			System.out.println("温度数据发送成功");
		}else{
			System.out.println("温度数据发送失败");
		}
		return true;
	}
	
	public static boolean dealNoiser(){
		
		//发送数据
		String p = "data="+str_data[6]+
					"&type=noiser"+
					"&sid="+str_data[10]+
					"&time="+getTime();
		//System.out.println(p);
		String rs = HttpRequest.sendGet(host+"/ylx/ems/query/sendData.jsp", p);
		if (rs.substring(rs.length()-1,rs.length()).equals("1")){
			System.out.println("噪音数据发送成功");
		}else{
			System.out.println("噪音数据发送失败");
		}
		return true;
	}
	
    public static void main(String[] args) {
    	//初始化
    	ServerSocket server=null;
		try{
			server=new ServerSocket(port);
			System.out.println("程序在["+port+"]监听");
			Socket socket=null;
			
	    	while(true){
				socket=server.accept();
	    		try{
					BufferedReader is=new BufferedReader(new InputStreamReader(socket.getInputStream()));
					System.out.println(socket.toString());
					String str_in = is.readLine();
					System.out.println(str_in);
					if (str_in.equals(null)) continue;
		    		if (getAll(str_in)){
						is.close();
			    		dealPM2_5();
			    		dealWet();
			    		dealTem();
			    		dealNoiser();
		    		}else{
						is.close();
		    			throw new Exception("data format error");
		    		}
				}catch(Exception e) {
					System.out.println("Error."+e);
				}
	    	}
		}catch(Exception e) {
			System.out.println("can not listen to:"+e);
		}
    }  
}  

/*
 * 
        try {  
            //1.建立客户端socket连接，指定服务器位置及端口  
            Socket socket =new Socket("localhost",8800);  
            //2.得到socket读写流  
            OutputStream os=socket.getOutputStream();  
            PrintWriter pw=new PrintWriter(os);  
            //输入流  
            InputStream is=socket.getInputStream();  
            BufferedReader br=new BufferedReader(new InputStreamReader(is));  
            //3.利用流按照一定的操作，对socket进行读写操作  
            String info="用户名：Tom,用户密码：123456";  
            pw.write(info);  
            pw.flush();  
            socket.shutdownOutput();  
            //接收服务器的相应  
            String reply=null;  
            while(!((reply=br.readLine())==null)){  
                System.out.println("接收服务器的信息："+reply);  
            }  
            //4.关闭资源  
            br.close();  
            is.close();  
            pw.close();  
            os.close();  
            socket.close();  
        } catch (UnknownHostException e) {  
            e.printStackTrace();  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  */
