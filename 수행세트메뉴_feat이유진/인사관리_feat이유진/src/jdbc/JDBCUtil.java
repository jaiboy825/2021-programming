package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBCUtil {

	public static Connection getConn() throws Exception {
		Connection conn = null;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
		System.out.println("오라클 연결 성공");
		return conn;
	}
}
