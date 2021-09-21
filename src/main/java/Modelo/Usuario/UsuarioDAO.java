package Modelo.Usuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JOptionPane;

import Controlador.Conexion;

public class UsuarioDAO {

	Conexion cnn = new Conexion();
	Connection con = cnn.Conecta();
	PreparedStatement ps = null;
	ResultSet res = null;

	/* METODO INSERTAR */
	public boolean Inserta_Usuario(UsuarioDTO user) {
		boolean resul = false;
		try {
			String sql = "insert into usuarios values(?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, user.getId());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getNombre());
			ps.setString(4, user.getPass());
			ps.setString(5, user.getUsuario());
			resul = ps.executeUpdate() > 0;
			con.close();
		} catch (SQLException ex) {
			JOptionPane.showMessageDialog(null, "No se registro el Usuario" + ex);
		}
		return resul;
	}

	/* METODO CONSULTAR */
	public UsuarioDTO Buscar_Usuario(int id) {
		UsuarioDTO user = null;
		try {
			String sql = "select * from usuarios where cedula_usuario = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			res = ps.executeQuery();

			while (res.next()) {
				user = new UsuarioDTO(res.getInt(1), res.getString(2), res.getString(3), res.getString(4),
						res.getString(5));
			}
		} catch (SQLException ex) {
			JOptionPane.showMessageDialog(null, "Error al Consultar el Usuario..." + ex);
		}
		return user;
	}

	/* METODO ACTUALIZAR */
	public boolean Actualizar_Usuario(UsuarioDTO user) {
		boolean resul = false;
		try {
			String sql = "update usuarios set email_usuario=?, nombre_usuario=?, password=?, usuario=? where cedula_usuario=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, user.getEmail());
			ps.setString(2, user.getNombre());
			ps.setString(3, user.getPass());
			ps.setString(4, user.getUsuario());
			ps.setInt(5, user.getId());
			resul = ps.executeUpdate() > 0;
		} catch (SQLException ex) {
			JOptionPane.showMessageDialog(null, "error al actualizar: " + ex);
		}
		return resul;
	}

	/* METODO ELIMINAR */
	public boolean Eliminar_Usuario(int id) {
		boolean resul = false;
		try {
			String sql = "delete from usuarios where cedula_usuario=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			resul = ps.executeUpdate() > 0;
		} catch (SQLException ex) {
			JOptionPane.showMessageDialog(null, "error al eliminar: " + ex);
		}
		return resul;
	}
}
