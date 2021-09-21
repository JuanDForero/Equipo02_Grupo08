package Controlador;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.swing.JOptionPane;

public class Conexion {

	private String bd = "tienda";
	private String url = "jdbc:mysql://localhost:3306/" + bd;
	private String user = "root";
	private String pass = "";
	Connection con = null;

	public Connection Conecta() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, user, pass);
			JOptionPane.showMessageDialog(null, "Conexion OK...");
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, "Error al Conectar BD" + e);
		}
		return con;
	}
}
