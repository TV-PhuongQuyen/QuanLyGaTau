package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static String jdbcURL = "jdbc:mysql://localhost:3306/quanlygatau";
    private static String jdbcUsername = "root";
    private static String jdbcPassword = "";

    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
    public static void main(String[] args) {
        Connection cn = getConnection();
        if(cn != null){
            System.out.println("Thanh cong");
        }else{
            System.err.println("That bai");
        }
        
    }
}
