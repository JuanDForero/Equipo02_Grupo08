package Modelo.Producto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JOptionPane;

import Controlador.Conexion;


public class ProductoDAO {

	Conexion cnn = new Conexion();
	Connection con = cnn.Conecta();
	PreparedStatement ps = null;
	ResultSet res=null;
	
	/*METODO CONSULTAR*/
	public ProductoDTO Buscar_Producto(int id) {
		ProductoDTO prod=null;
		try {
			String sql="select * from productos where codigo_producto = ?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			res=ps.executeQuery();
			
			while(res.next()) {
				prod = new ProductoDTO(res.getInt(1),res.getDouble(2),res.getInt(3),res.getString(4),res.getDouble(5),res.getDouble(6));
			}
		}catch(SQLException ex) {
			JOptionPane.showMessageDialog(null, "Error al Consultar el Producto..."+ ex);
		}
		return prod;
	}
	
	/* METODO ACTUALIZAR */
	public boolean Actualizar_Producto(ProductoDTO prod) {
		boolean resul = false;
		try {
			String sql = "update productos set ivacompra=?, nitproveedor=?, nombre_producto=?, precio_compra=?, precio_venta=? where codigo_producto=?";
			ps = con.prepareStatement(sql);
			ps.setDouble(1, prod.getIva());
			ps.setInt(2, prod.getId_Proveedor());
			ps.setString(3, prod.getNombre_Producto());
			ps.setDouble(4, prod.getPrecio_Compra());
			ps.setDouble(5, prod.getPrecio_Venta());
			ps.setInt(6, prod.getCodigo());
			resul = ps.executeUpdate() > 0;
		} catch (SQLException ex) {
			JOptionPane.showMessageDialog(null, "error al actualizar: " + ex);
		}
		return resul;
	}

	/* METODO ELIMINAR */
	public boolean Eliminar_Producto(int codigo) {
		boolean resul = false;
		try {
			String sql = "delete from productos where codigo_producto=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, codigo);
			resul = ps.executeUpdate() > 0;
		} catch (SQLException ex) {
			JOptionPane.showMessageDialog(null, "error al eliminar: " + ex);
		}
		return resul;
	}
	
	
/*METODO INSERTAR ARCHIVOS*/
	
	public boolean Cargar_Producto(String URL) {
		boolean resul = false;
		try {
			String sql="load data infile '"+URL+"' into table productos fields terminated by ',' lines terminated by '\r\n'";
			ps = con.prepareStatement(sql);
			resul=ps.executeUpdate()>0;
			
		}catch(SQLException ex) {
			JOptionPane.showMessageDialog(null, "Error al registrar los Productos: "+ ex);
			
		}
		return resul;
	}
}
