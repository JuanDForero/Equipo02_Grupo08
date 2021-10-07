package Modelo.Cliente;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JOptionPane;

import Controlador.Conexion;

public class ClienteDAO {
	
	Conexion cnn = new Conexion();
	Connection con = cnn.Conecta();
	PreparedStatement ps = null;
	ResultSet res=null;
	
	/*METODO INSERTAR*/
	public boolean Inserta_Cliente(ClienteDTO cli) {
		boolean resul=false;
		try {
			String sql="insert into clientes values(?,?,?,?,?)";
			ps=con.prepareStatement(sql);
			ps.setInt(1, cli.getCedula());
			ps.setString(2, cli.getDireccion());
			ps.setString(3, cli.getEmail());
			ps.setString(4, cli.getNombre());
			ps.setString(5, cli.getTelefono());
			resul=ps.executeUpdate()>0;
			con.close();
		}catch(SQLException ex) {
			JOptionPane.showMessageDialog(null, "No se registro el Cliente"+ ex);
		}
		return resul;
	}
	
	/*METODO CONSULTAR*/
	public ClienteDTO Buscar_Cliente(int id) {
		ClienteDTO cli=null;
		try {
			String sql="select * from clientes where cedula_cliente = ?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			res=ps.executeQuery();
			
			while(res.next()) {
				cli = new ClienteDTO(res.getInt(1),res.getString(2),res.getString(3),res.getString(4),res.getString(5));
			}
		}catch(SQLException ex) {
			JOptionPane.showMessageDialog(null, "Error al Consultar el Cliente..."+ ex);
		}
		return cli;
	}
	
	/* METODO ACTUALIZAR */
	public boolean Actualizar_Cliente(ClienteDTO cli) {
		boolean resul = false;
		try {
			String sql = "update clientes set direccion_cliente=?, email_cliente=?, nombre_cliente=?, telefono_cliente=? where cedula_cliente=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, cli.getDireccion());
			ps.setString(2, cli.getEmail());
			ps.setString(3, cli.getNombre());
			ps.setString(4, cli.getTelefono());
			ps.setInt(5, cli.getCedula());
			resul = ps.executeUpdate() > 0;
		} catch (SQLException ex) {
			JOptionPane.showMessageDialog(null, "error al actualizar: " + ex);
		}
		return resul;
	}

	/* METODO ELIMINAR */
	public boolean Eliminar_Cliente(int id) {
		boolean resul = false;
		try {
			String sql = "delete from clientes where cedula_cliente=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			resul = ps.executeUpdate() > 0;
		} catch (SQLException ex) {
			JOptionPane.showMessageDialog(null, "error al eliminar: " + ex);
		}
		return resul;
	}
}
