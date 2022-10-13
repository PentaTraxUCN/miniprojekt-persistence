package gui;

import java.awt.EventQueue;

import javax.swing.JFrame;

import controller.DBController;
import environment.Env;

public class AppWindow {
    
    private DBController dbc = new DBController();
    
    private JFrame frame;

    /**
     * Launch the application.
     */
    public static void main(String[] args) {
        EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    AppWindow window = new AppWindow();
                    window.frame.setVisible(true);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }

    /**
     * Create the application.
     */
    public AppWindow() {
        initialize();
    }

    /**
     * Initialize the contents of the frame.
     */
    private void initialize() {
        dbc.connect(Env.DB_SERVER, Env.DB_PORT, Env.DB_DATABASE, Env.DB_USERNAME, Env.DB_PASSWORD);
        frame = new JFrame();
        frame.setBounds(100, 100, 450, 300);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }

}
