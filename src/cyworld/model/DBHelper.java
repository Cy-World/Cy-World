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
	private ResultSet rs = null;
	static final String URL = "jdbc:mysql://localhost:3306/cyworld";
	static final String DBUSER = "cyworld";
	static final String DBPASSWD = "cigucigu1919";

	// Open SQL
	public void openDB() {
		try {
			// DriverRoad
			Class.forName("com.mysql.jdbc.Driver");
			// JDBC init
			con = DriverManager.getConnection(URL, DBUSER, DBPASSWD);
			stmt = con.createStatement();
			System.out.println("connection : ok");
		} catch (Exception e) {
			System.out.println("connection : no");
		}
	}

	// Close SQL
	public void closeDB() {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// SelectSQL
	public ResultSet selectSQL(String sql) {
		try {
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	// Insert SQL
	public int insertSQL(String sql) {
		int insertCont = 0;
		System.out.println("sql:" + sql);
		try {
			insertCont = stmt.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return insertCont;

	}

	// Update SQL
	public int updateSQL(String sql) {
		int updateCount = 0;
		try {
			updateCount = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return updateCount;
	}

	// Delete SQL
	public int deleteSQL(String sql) {
		int deleteCount = 0;
		try {
			deleteCount = stmt.executeUpdate(sql);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return deleteCount;

	}
}
