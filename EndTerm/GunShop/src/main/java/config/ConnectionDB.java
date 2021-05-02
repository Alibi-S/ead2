package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionDB {
    private static Connection connection = null;

    public static Connection getConnection(){
        if(connection == null) {
            try {
                Class.forName("org.postgresql.Driver");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            try {
                connection = DriverManager.getConnection(
                        "jdbc:postgresql://localhost:5432/WeaponShop",
                        "postgres",
                        "1234"
                );
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }

        if (connection == null) {
            System.out.println("--------CONNECTION NULL IN DB-----------------");
        }
        return connection;
    }
}
