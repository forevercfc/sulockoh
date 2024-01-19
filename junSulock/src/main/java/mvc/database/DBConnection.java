package mvc.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


public class DBConnection {
	public static Connection getConnection() throws Exception, ClassNotFoundException{
		Connection conn = null;
		PreparedStatement psmt = null;
//		Result rs = null;
		
		try{
			String url ="jdbc:oracle:thin:@localhost:1521:xe";
			String user= "C##dbexam";
			String password ="m1234";
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("드라이버 등록 성공");
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("접속 성공");
			System.out.println("접속 성공");
		}catch(ClassNotFoundException e){
			System.out.println("드라이버 등록 실패");
		}
		return conn;
	}
}
