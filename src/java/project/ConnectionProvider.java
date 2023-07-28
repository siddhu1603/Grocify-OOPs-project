/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author USER
 */
public class ConnectionProvider {

    public static Connection getCon() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            //System.out.print("driver loaded");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/XE", "eshop", "*******");
            return con;
        } catch (ClassNotFoundException | SQLException e) {
            System.out.print("error"+e.toString());
            return null;
        }

    }
}
