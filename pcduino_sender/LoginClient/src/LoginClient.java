
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
		//new Date()Ϊ��ȡ��ǰϵͳʱ��
		return formatter.format(new Date());
	}
	
	public static boolean dealPM2_5(){
		
		//��������
		String p = "data="+str_data[3]+
					"&type=pm2_5"+
					"&sid="+str_data[9]+
					"&time="+getTime();
		//System.out.println(p);
		String rs = HttpRequest.sendGet(host+"/ylx/ems/query/sendData.jsp", p);
		if (rs.substring(rs.length()-1,rs.length()).equals("1")){
			System.out.println("pm2.5���ݷ��ͳɹ�");
		}else{
			System.out.println("pm2.5���ݷ���ʧ��");
		}
		return true;
	}
	
	public static boolean dealWet(){
		
		//��������
		String p = "data="+str_data[1]+
					"&type=wet"+
					"&sid="+str_data[8]+
					"&time="+getTime();
		//System.out.println(p);
		String rs = HttpRequest.sendGet(host+"/ylx/ems/query/sendData.jsp", p);
		if (rs.substring(rs.length()-1,rs.length()).equals("1")){
			System.out.println("ʪ�����ݷ��ͳɹ�");
		}else
			System.out.println("ʪ�����ݷ���ʧ��");
		}
		return true;
	}
	
	public static boolean dealTem(){
		
		//��������
		String p = "data="+str_data[0]+
					"&type=tem"+
					"&sid="+str_data[7]+
					"&time="+getTime();
		//System.out.println(p);
		String rs = HttpRequest.sendGet(host+"/ylx/ems/query/sendData.jsp", p);
		if (rs.substring(rs.length()-1,rs.length()).equals("1")){
			System.out.println("�¶����ݷ��ͳɹ�");
		}else{
			System.out.println("�¶����ݷ���ʧ��");
		}
		return true;
	}
	
	public static boolean dealNoiser(){
		
		//��������
		String p = "data="+str_data[6]+
					"&type=noiser"+
					"&sid="+str_data[10]+
					"&time="+getTime();
		//System.out.println(p);
		String rs = HttpRequest.sendGet(host+"/ylx/ems/query/sendData.jsp", p);
		if (rs.substring(rs.length()-1,rs.length()).equals("1")){
			System.out.println("�������ݷ��ͳɹ�");
		}else{
			System.out.println("�������ݷ���ʧ��");
		}
		return true;
	}
	
    public static void main(String[] args) {
    	//��ʼ��
    	ServerSocket server=null;
		try{
			server=new ServerSocket(port);
			System.out.println("������["+port+"]����");
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
            //1.�����ͻ���socket���ӣ�ָ��������λ�ü��˿�  
            Socket socket =new Socket("localhost",8800);  
            //2.�õ�socket��д��  
            OutputStream os=socket.getOutputStream();  
            PrintWriter pw=new PrintWriter(os);  
            //������  
            InputStream is=socket.getInputStream();  
            BufferedReader br=new BufferedReader(new InputStreamReader(is));  
            //3.����������һ���Ĳ�������socket���ж�д����  
            String info="�û�����Tom,�û����룺123456";  
            pw.write(info);  
            pw.flush();  
            socket.shutdownOutput();  
            //���շ���������Ӧ  
            String reply=null;  
            while(!((reply=br.readLine())==null)){  
                System.out.println("���շ���������Ϣ��"+reply);  
            }  
            //4.�ر���Դ  
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
