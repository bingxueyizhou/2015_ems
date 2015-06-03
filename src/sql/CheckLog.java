package sql;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class CheckLog {
	
	public FileInputStream getSTDOUT_LOG(){

		Properties properties = new Properties();
		try {
			InputStream inputstream = getClass().getClassLoader().
					getResourceAsStream("/conf/file_path.properties");
			properties.load(inputstream);
			if (inputstream != null)
				inputstream.close();
		}catch (IOException ex) {
			System.err.println("Open Propety File Error");
		}
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(new File(properties.getProperty("STDOUT")));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		
		return fis;
	}
}
