package db;
import java.sql.*;

public class DBConnection{
    private String server_domain;
    private String port;
    private String username;
    private String password;
    private boolean encrypt = true;
    private boolean trustCertificate = true;
    private int timeout = 30;
    private static Connection connection;
    private DatabaseMetaData metadata;
    private static DBConnection instance;

    private DBConnection(){
        this.server_domain = "127.0.0.1";
        this.port = "1433";
        this.username = "username";
        this.password = "password";
    }

    public static DBConnection getInstance(){
        if (instance == null){
            try{
                //load of driver
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                System.out.println("Driver class loaded ok");
              
            }
            catch(Exception e){
                System.out.println("Cannot find the driver");
                System.out.println(e.getMessage());
            }
            instance = new DBConnection();
        }
        return instance;
    }

    public void pointToServer(String server_domain, String port, String username, String password){
        this.server_domain = server_domain;
        this.port = port;
        this.username = username;
        this.password = password;
    }

    public void pointToServer(String server_domain, String port, String username, String password, boolean encrypt, boolean trustCertificate, int loginTimeout){
        this.server_domain = server_domain;
        this.port = port;
        this.username = username;
        this.password = password;
        this.encrypt = encrypt;
        this.trustCertificate = trustCertificate;
        this.timeout = loginTimeout;
    }

    public void connect(String database) throws SQLException {
        String url = "jdbc:sqlserver://"+server_domain+":"+port+";database="+database+";user="+username+";password="+password+";encrypt="+encrypt+";trustServerCertificate="+trustCertificate+";loginTimeout="+timeout+";";
        System.out.println("Connection string: "+url);
        connection = DriverManager.getConnection(url);
        connection.setAutoCommit(true);
        metadata = connection.getMetaData();
        System.out.println("Connection to " + metadata.getURL());
        System.out.println("Driver " + metadata.getDriverName());
    }
    
    public static PreparedStatement prepareStatement (String statement) throws SQLException {
        return DBConnection.connection.prepareStatement(statement);
    }
    
    public static boolean getOpenStatus() {
        boolean isOpen = false;
        try {
            isOpen = (!connection.isClosed());
        } catch (Exception sclExc) {
            isOpen = false;
        }
        return isOpen;
    }
}

