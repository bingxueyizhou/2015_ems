package sql;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class EMSSql {
	private Connection conn = null;
	private Statement statement = null;
	ResultSet rs = null;
	
	/*database params*/
	String DRIVER 	= "";
	String URL 		= "";
	String USER 	= "";
	String PASSWD 	= "";
	
	
	public EMSSql(){
		try {
			setProperty();
			// 加载驱动程序
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, USER, PASSWD);
			if(!conn.isClosed())
				System.out.println("<Succeeded>:connecting to the ems!");
		} catch(ClassNotFoundException e) {
			System.out.println("Sorry,can`t find the Driver!");   
			e.printStackTrace();   
		} catch(SQLException e) {   
			e.printStackTrace(); 
		} catch(Exception e) {
			e.printStackTrace();   
		}
	}
	
	public EMSSql(String u,String p){
		try {
			DRIVER 	= "com.mysql.jdbc.Driver";
			// URL指向要访问的数据库名
			URL 	= "jdbc:mysql://127.0.0.1:3306/ems";
			USER 	= u;
			PASSWD 	= p;
			
			// 加载驱动程序
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, USER, PASSWD);
			if(!conn.isClosed())
				System.out.println("<Succeeded>:connecting to the ems!");
		} catch(ClassNotFoundException e) {
			System.out.println("Sorry,can`t find the Driver!");   
			e.printStackTrace();   
		} catch(SQLException e) {   
			System.out.println("Sorry,sql connecnt exception");  
			e.printStackTrace(); 
		} catch(Exception e) {
			System.out.println("Sorry,other exception happened");  
			e.printStackTrace();   
		}
	}
	
	public boolean ModifyQuery(String sql){
		PreparedStatement ps;
		System.out.println("SQL:"+sql);
		try {
			ps = conn.prepareStatement(sql);
			if (ps.executeUpdate() > 0){
				System.out.println("SQL:success");
				return true;
			}else return false;
		} catch (SQLException e) {
			System.out.println(e.toString());
			e.printStackTrace();
		}
		return false;
	}
	
	public ResultSet SelectQuery(String sql){
		System.out.println("SQL:"+sql);
		try {
			statement = conn.createStatement();
			rs = statement.executeQuery(sql);
			System.out.println("SQL:success");
		} catch (SQLException e) {
			System.out.println(e.toString());
			e.printStackTrace();
		}
		return rs;
	}
	
	public void close(){
		try {
			rs.close();
			conn.close();
		} catch (SQLException e) {
			System.out.println("db closed fail!");
			e.printStackTrace();
		}
	}
	
	private void setProperty() {
		Properties properties = new Properties();
		try {
			InputStream inputstream = getClass().getClassLoader().
					getResourceAsStream("/conf/ems_db.properties");
			properties.load(inputstream);
			if (inputstream != null)
				inputstream.close();
		}catch (IOException ex) {
			System.err.println("Open Propety File Error");
		}
		DRIVER   = properties.getProperty("DRIVER");
		URL      = properties.getProperty("MAINURL") + 
			  			properties.getProperty("IP") +
			  			":3306/ems?" +
			  			"useUnicode=true&characterEncoding=UTF-8";
		USER     = properties.getProperty("USER");
		PASSWD	 = properties.getProperty("PASSWD");
	}
}
