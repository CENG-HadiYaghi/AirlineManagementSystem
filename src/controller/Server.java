package controller;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.mysql.cj.jdbc.MysqlDataSource;
public class Server {
    public Connection createConnection() {
        Connection connection = null;
        MysqlDataSource mds = new MysqlDataSource();
        mds.setServerName("mysql-hadiyaghi.alwaysdata.net");
        mds.setPortNumber(3306);
        mds.setUser("hadiyaghi");
        mds.setPassword("G@6sGiKj5pSEThh"); // Put your password here if you have one
        mds.setDatabaseName("hadiyaghi_airlinemanagementsystem");
        
        try {
            connection = mds.getConnection();
        } catch (SQLException ex) {
            Logger.getLogger(Server.class.getName()).log(Level.SEVERE, null, ex);
             
        }
        
        return connection;
    }
    
}
