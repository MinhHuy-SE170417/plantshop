/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Minh Huy
 */
public class DBUtils implements Serializable{

    public static Connection makeConnection() throws ClassNotFoundException, SQLException {
        //1. Load driver
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        //2. Prepare create url connection 
        String url = "jdbc:sqlserver://localhost:1433;"
                + "databaseName=master;instanceName=localhost";
        //3. Open Connection
        Connection con = DriverManager.getConnection(url, "sa", "12345");
        return con;
    }

    public static void main(String[] args) throws Exception {
        try {
            Connection cn = makeConnection();

            if (cn != null) {
                String s = "select userID, fullName, roleID, password  from tblUsers;";
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(s);
                if (rs != null) {
                    while (rs.next()) {
                        String id = rs.getString("userID");
                        String name = rs.getString("fullName");
                        String role = rs.getString("roleID");
                        String password = rs.getString("password");
                        System.out.println(id + ", " + name + ", " + role + ", " + password);
                    }
                } else {
                    System.out.println("Loi ket noi");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
