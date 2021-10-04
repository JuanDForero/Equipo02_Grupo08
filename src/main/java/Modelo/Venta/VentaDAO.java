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
            String sql = "insert into ventas (cedula_cliente,cedula_usuario) values(?,?)";
            ps = con.prepareStatement(sql);
            ps.setInt(1, ven.getId_cliente());
            ps.setInt(2, ven.getId_usuario());
            resul = ps.executeUpdate() > 0;
            
            
            if(resul) 
            
            {
            
            	sql = "select codigo_venta from ventas order by codigo_venta desc limit 1";
            	 ps = con.prepareStatement(sql);
             
                 res = ps.executeQuery();
                
                 int cod_ven = 0;
                 while (res.next()) {
					
					cod_ven = res.getInt(1);
				}
                 
                 sql = " select precio_venta from productos where  ";
            }
            
        }catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Error al insertar venta" + ex);
        }
        return resul;
    }


    
}
	
	
