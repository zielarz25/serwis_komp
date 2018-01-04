package app.util;

import com.sun.rowset.CachedRowSetImpl;

import javax.sql.rowset.CachedRowSet;
import java.sql.*;

public class DBUtils {
    // Declare JDBC Driver
    private static final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";

    // Connection
    private static Connection conn = null;

    // Login data
    private static final String username = "serwis";
    private static final String pass = "serwis";
    private static final String ip = "localhost";
    private static final String port = "1521";
    private static final String sid = "serwis";

    //Connection String
    //String connStr = "jdbc:oracle:thin:Username/Password@IP:Port/SID";  - oracle
    //       jdbc:mysql://localhost:3306/carpark
    private static final String connStr = String.format("jdbc:oracle:thin:%s/%s@%s:%s/%s",username, pass, ip, port, sid);

    // That format is needed for calling stored procedures
    //private static final String connStrLogin = String.format("jdbc:mysql://%s:%s/%s?user=%s&password=%s", ip, port, sid, username, pass);
    // Connect to DB
    public static void dbConnect() throws SQLException {
        // setting Oracle driver
        try {
            Class.forName(JDBC_DRIVER);
            System.out.println(connStr);
        } catch (ClassNotFoundException e) {
            System.err.printf("Where is your Oracle JDBC driver?");
            e.printStackTrace();
        }
        System.out.println("Oracle JDBC Driver Registered!");

        // Establish the Oracle Connection
        try {
            conn = DriverManager.getConnection(connStr);
            System.out.println("Connected!");
        } catch (SQLException e) {
            System.err.println("Connection failed!");
            e.printStackTrace();
        }

    }

    // Close connection
    public static void dbDisconnect() throws SQLException {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
                System.out.println("Disconnected!");
            }
        } catch (SQLException e) {
            System.err.println("Error while closing the connection!");
            e.printStackTrace();
        }
    }

    // DB Execute Query Operation (select)
    public static ResultSet dbExecuteQuery(String queryStmt) throws SQLException {
        Statement stmt = null;
        ResultSet resultSet = null;
        CachedRowSet cachedRowSet = null;

        try {
            // Connect to DB
            dbConnect();
            System.out.println("Select statement: " + queryStmt);

            // Create statement
            stmt = conn.createStatement();

            // Execute operation
            resultSet = stmt.executeQuery(queryStmt);

            // Cached Row Set Implementation
            // In order to prevent "java.sql.SQLRecoverableException: Closed Connection: next error
            cachedRowSet = new CachedRowSetImpl();
            cachedRowSet.populate(resultSet);


        } catch (SQLException e) {
            System.err.println("Error at executing query");
            e.printStackTrace();
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }

            if (stmt != null) {
                stmt.close();
            }

            // Close connection
            conn.close();
        }
        return cachedRowSet;
    }
    public static void dbExecuteUpdate(String sqlStmt) throws SQLException {
        Statement stmt = null;

        try {
            dbConnect();
            System.out.println(sqlStmt);
            stmt = conn.createStatement();
            stmt.executeUpdate(sqlStmt);
        } catch (SQLException e) {
            System.err.println("Error while executing update statement");
            e.printStackTrace();
        } finally {
            if(stmt != null) {
                stmt.close();
            }
            dbDisconnect();
        }
    }

}