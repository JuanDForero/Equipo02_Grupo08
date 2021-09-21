package Modelo.Proveedor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JOptionPane;

import Controlador.Conexion;

public class ProveedorDAO {

	Conexion cnn = new Conexion();
	Connection con = cnn.Conecta();
	PreparedStatement ps = null;
	ResultSet res=null;
	
	/*METODO INSERTAR*/
	public boolean Inserta_Proveedor(ProveedorDTO pro) {
		boolean resul=false;
		try {
			String sql="insert into proveedores values(?,?,?,?,?)";
			ps=con.prepareStatement(sql);
			ps.setInt(1, pro.getId());
			ps.setString(2, pro.getCiudad());
			ps.setString(3, pro.getDireccion());
			ps.setString(4, pro.getNombre());
			ps.setString(5, pro.getTelefono());
			resul=ps.executeUpdate()>0;
			con.close();
		}catch(SQLException ex) {
			JOptionPane.showMessageDialog(null, "No se registro el Proveedor"+ ex);
		}
		return resul;
	}
	
	/*METODO CONSULTAR*/
	public ProveedorDTO Buscar_Proveedor(int id) {
		ProveedorDTO pro=null;
		try {
			String sql="select * from proveedores where nitproveedor = ?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			res=ps.executeQuery();
			
			while(res.next()) {
				pro = new ProveedorDTO(res.getInt(1),res.getString(2),res.getString(3),res.getString(4),res.getString(5));
			}
		}catch(SQLException ex) {
			JOptionPane.showMessageDialog(null, "Error al Consultar el Usuario..."+ ex);
		}
		return pro;
	}
	
	/* METODO ACTUALIZAR */
	public boolean Actualizar_Proveedor(ProveedorDTO pro) {
		boolean resul = false;
		try {
			String sql = "update proveedores set ciudad_proveedor=?, direccion_proveedor=?, nombre_proveedor=?, telefono_proveedor=? where nitproveedor=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, pro.getCiudad());
			ps.setString(2, pro.getDireccion());
			ps.setString(3, pro.getNombre());
			ps.setString(4, pro.getTelefono());
			ps.setInt(5, pro.getId());
			resul = ps.executeUpdate() > 0;
		} catch (SQLException ex) {
			JOptionPane.showMessageDialog(null, "error al actualizar: " + ex);
		}
		return resul;
	}

	/* METODO ELIMINAR */
	public boolean Eliminar_Proveedor(int id) {
		boolean resul = false;
		try {
			String sql = "delete from proveedores where nitproveedor=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			resul = ps.executeUpdate() > 0;
		} catch (SQLException ex) {
			JOptionPane.showMessageDialog(null, "error al eliminar: " + ex);
		}
		return resul;
	}
}
