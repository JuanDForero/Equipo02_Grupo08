package Modelo.Index;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JOptionPane;

import Controlador.Conexion;

public class IndexDAO {

	Conexion cnn = new Conexion();
	Connection con = cnn.Conecta();
	PreparedStatement ps = null;
	ResultSet res = null;

	/* METODO LOGIN */
	public boolean Login(String usuario, String password) {
		boolean log = false;
		try {
			String sql = "select usuario, password from usuarios where usuario= ? and password= ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, usuario);
			ps.setString(2, password);
			res = ps.executeQuery();

			while (res.next()) {
				log = true;
			}
		} catch (SQLException ex) {
			JOptionPane.showMessageDialog(null, "error al iniciar sesion " + ex);
		}
		return log;
	}
}
