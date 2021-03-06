package Modelo.Detalle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JOptionPane;

import Controlador.Conexion;
import Modelo.Cliente.ClienteDTO;
import Modelo.Producto.ProductoDTO;

public class DetalleDAO {

	Conexion cnn = new Conexion();
	Connection con = cnn.Conecta();
	PreparedStatement ps = null;
	ResultSet res = null;
	
	public boolean Inserta_Factura(DetalleDTO det) {
		boolean resul = false;
		try {
			
			String sql = "select codigo_venta from ventas order by codigo_venta desc limit 1";
       	 	ps = con.prepareStatement(sql);
       	 	
            res = ps.executeQuery();
           
            int cod_ven = 0;
            while (res.next()) {
				
				
            	cod_ven = res.getInt(1);
            //	det.setCod_venta(cod_ven); 
				
			}
            
            sql = "insert into detalle_ventas (cantidad_producto,codigo_producto,codigo_venta) values(?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, det.getCantidad());
			ps.setInt(2, det.getCod_producto());
			ps.setInt(3, cod_ven);
	
			resul = ps.executeUpdate() > 0;
            
			
			
			if(resul) 
			{
					
                sql = "select codigo_detalle_venta from detalle_ventas order by codigo_venta desc limit 1";
           	 	ps = con.prepareStatement(sql);
            
                res = ps.executeQuery();
               
                int cod_det = 0;
                while (res.next()) {
					
					cod_det = res.getInt(1);
				}
                   
                sql = "select precio_venta from productos where codigo_producto=?";
           	 	ps = con.prepareStatement(sql);
           	 	ps.setInt(1, det.getCod_producto());
                res = ps.executeQuery();
               
                double precio = 0;
                while (res.next()) {
					
					precio = res.getDouble(1);
				}
                
                sql="update detalle_ventas set valor_venta=?*? where codigo_detalle_venta=?";
                ps = con.prepareStatement(sql);
                ps.setDouble(1, precio);
                ps.setInt(2, det.getCantidad());
                ps.setInt(3, cod_det);
                resul = ps.executeUpdate()>0;
                
                sql = "select ivacompra from productos where codigo_producto=?";
           	 	ps = con.prepareStatement(sql);
           	 	ps.setInt(1, det.getCod_producto());
                res = ps.executeQuery();
               
                double iva = 0;
                while (res.next()) {
					
					iva = res.getDouble(1);
				}
                
                sql = "select valor_venta from detalle_ventas where codigo_detalle_venta=?";
           	 	ps = con.prepareStatement(sql);
           	 	ps.setInt(1, cod_det);
                res = ps.executeQuery();
               
                double valor = 0;
                while (res.next()) {
					
					valor = res.getDouble(1);
				}
                
                sql="update detalle_ventas set valoriva=?*? where codigo_detalle_venta=?";
                ps = con.prepareStatement(sql);
                ps.setDouble(1, valor);
                ps.setDouble(2, iva);
                ps.setInt(3, cod_det);
                resul = ps.executeUpdate()>0;
                
                sql = "select valoriva from detalle_ventas where codigo_detalle_venta=?";
           	 	ps = con.prepareStatement(sql);
           	 	ps.setInt(1, cod_det);
                res = ps.executeQuery();
               
                double valoriva = 0;
                while (res.next()) {
					
					valoriva = res.getDouble(1);
				}
                
                sql="update detalle_ventas set valor_total=(?+?) where codigo_detalle_venta=?";
                ps = con.prepareStatement(sql);
                ps.setDouble(1, valoriva);
                ps.setDouble(2, valor);
                ps.setInt(3, cod_det);
                resul = ps.executeUpdate()>0;
			}
			
		}catch (SQLException ex) {
			JOptionPane.showMessageDialog(null, "Error al insertar Factura" + ex);
		}
		return resul;
	}
}
