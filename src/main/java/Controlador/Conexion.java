package Controlador;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.swing.JOptionPane;

public class Conexion {

	private String bd = "Grupo8_Equipo_2";
	private String url = "jdbc:mariadb://prestamosvf.czo3ixoe3xoe.us-east-1.rds.amazonaws.com/" + bd;
	private String user = "admin";
	private String pass = "Ciclo3_admi123";
	Connection con = null;

	public Connection Conecta() {
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(url, user, pass);
			JOptionPane.showMessageDialog(null, "Conexion OK...");
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, "Error al Conectar BD" + e);
		}
		return con;
	}
}
