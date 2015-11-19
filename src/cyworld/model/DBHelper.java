package cyworld.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.sun.org.apache.xml.internal.security.Init;

public class DBHelper {
	/*
	 * VPS Server[cywrold.pgw.jp]にて [tail -f /var/log/message] で
	 * コンソールメッセージを確認することができます。 デバッグ用に活用してくださいね
	 */
	private Connection con = null;
	private Statement stmt = null;
	static final String URL = "jdbc:mysql://localhost:3306/cyworld";
	static final String DBUSER = "cyworld";
	static final String DBPASSWD = "cigucigu1919";

	public DBHelper() {

	}

	public boolean DBinit() {
		try {
			// DriverRoad
			Class.forName("com.mysql.jdbc.Driver");
			// JDBC init
			con = DriverManager.getConnection(URL, DBUSER, DBPASSWD);
			stmt = con.createStatement();
			System.out.println("connection : ok");
		} catch (Exception e) {
			System.out.println("connection : no");
			return false;
		}
		return true;
	}

	public void register(String username, String mail, String passwd) {
		if (DBinit()) {
			System.out.println("insert start");
			// String sql2 = "INSERT INTO User
			// VALUES('0001','passwd','example@com','Cygure','0','0');";
			String sql = String.format("INSERT INTO User VALUES('x13g10','%s','%s','%s','0','0');", passwd, mail,
					username);
			System.out.println("sql:" + sql);
			try {
				int insert = stmt.executeUpdate(sql);
				System.out.println("Complete");
			} catch (Exception e) {
				try {
					con.close();
				} catch (SQLException e1) {
					System.out.println("close : bad");
				}
			} finally {
				try {
					con.close();
				} catch (SQLException e1) {
					System.out.println("close : bad");
				}
			}
		}

	}

	public void select() {
		if (DBinit()) {
			String sql = "SELECT * FROM User;";
			System.out.println(sql);
			try {
				ResultSet rs = stmt.executeQuery(sql);
				while (rs.next()) {
					System.out.println("name: " + rs.getString("MailAddress"));
				}
			} catch (SQLException e) {
				try {
					con.close();
				} catch (SQLException e1) {
					System.out.println("close : bad");
				}
			} finally {
				try {
					con.close();
					System.out.println("close : ok");
				} catch (SQLException e1) {
					System.out.println("close : bad");
				}
			}
		}

	}

}
