package sql;

import java.sql.ResultSet;

public class getAllDevice {
	EMSSql db;
	public getAllDevice(){
		db = new EMSSql();
	}
	
	public ResultSet getResult(){
        String sql = "select * from sensor";
        return db.SelectQuery(sql);
	}
}
