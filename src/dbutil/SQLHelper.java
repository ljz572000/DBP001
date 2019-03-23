package dbutil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class SQLHelper {
    private static String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private static String url = "jdbc:sqlserver://localhost\\MYLAPTOP:1433;database=db_BigPro", uid = "sa", pwd = "qqq123";
    private static Connection conn = null;

    static {
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static void closeConnection() {
        try {
            if (conn != null && !conn.isClosed())
                conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public static ResultSet executeQuery(String sql) {
        ResultSet rs = null;
        try {
            conn = DriverManager.getConnection(url, uid, pwd);
            Statement cmd = conn.createStatement();
            rs = cmd.executeQuery(sql);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return rs;
    }

    public static int executeUpdate(String sql) {
        int r = 0;
        try {
            conn = DriverManager.getConnection(url, uid, pwd);
            Statement cmd = conn.createStatement();
            r = cmd.executeUpdate(sql);
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return r;
    }
}
