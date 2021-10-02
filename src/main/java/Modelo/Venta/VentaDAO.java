package Modelo.Venta;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JOptionPane;

import Controlador.Conexion;

public class VentaDAO {
	Conexion cnn = new Conexion();
	Connection con = cnn.Conecta();
	PreparedStatement ps = null;
	ResultSet res = null;
	
	public boolean Inserta_venta(VentaDTO ven) {
		boolean resul = false;
		try {
			String sql = "inset into ventas (cedula_cliente,cedula_usuario) values(?,?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, ven.getId_cliente());
			ps.setInt(2, ven.getId_usuario());
			resul = ps.executeUpdate() > 0;
		}catch (SQLException ex) {
			JOptionPane.showMessageDialog(null, "Error al insertar venta" + ex);
		}
		return resul;
	}
}
