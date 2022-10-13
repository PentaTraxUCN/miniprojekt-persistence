package controller;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import db.DBConnection;
import environment.Env;

public class DBController {
    private DBConnection db = DBConnection.getInstance();
    private PreparedStatement ps;
    
    public boolean connect(String server, String port, String database, String username, String password) {
        boolean success = false;
        try {
            db.pointToServer(server, port, username, password, Env.DB_ENCRYPTION, Env.DB_TRUST_CERTIFICATE, Env.DB_TIMEOUT);
            db.connect(database);
            success = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }
    
    public boolean prepareStatement(String statement) {
        boolean success = false;
        try {
            ps = DBConnection.prepareStatement(statement);
            success = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }
    
    public PreparedStatement getPreparedStatement() {
        return ps;
    }
    
    public boolean executeStatement() {
        boolean success = false;
        try {
            ps.execute();
            success = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }
    
}
