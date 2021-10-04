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

	public boolean Inserta_Venta(VentaDTO ven) {
		boolean resul = false;
		try {
			String sql = "insert into ventas (cedula_cliente,cedula_usuario) values(?,?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, ven.getId_cliente());
			ps.setInt(2, ven.getId_usuario());
			resul = ps.executeUpdate() > 0;
		} catch (SQLException ex) {
			JOptionPane.showMessageDialog(null, "Error al insertar venta" + ex);
		}
		return resul;
	}

	public boolean Actualizar_Venta(VentaDTO ven) {
		boolean resul = false;
		try {
			String sql = "select codigo_venta from ventas order by codigo_venta desc limit 1";
			ps = con.prepareStatement(sql);
			res = ps.executeQuery();

			int cod_ven = 0;
			while (res.next()) {
				cod_ven = res.getInt(1);
			}

			sql = "update ventas set cedula_usuario=? where codigo_venta=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, ven.getId_usuario());
			ps.setDouble(2, cod_ven);
			resul = ps.executeUpdate() > 0;

			if (resul) {
				sql = "select sum(valoriva) from detalle_ventas where codigo_venta=?";
				ps = con.prepareStatement(sql);
				ps.setInt(1, cod_ven);

				double ivaventa = 0;
				while (res.next()) {

					ivaventa = res.getDouble(1);
				}

				sql = "update ventas set ivaventa=? where codigo_venta=?";
				ps = con.prepareStatement(sql);
				ps.setDouble(1, ivaventa);
				ps.setInt(2, cod_ven);
				resul = ps.executeUpdate() > 0;

				sql = "select sum(valor_venta) from detalle_ventas where codigo_venta=?";
				ps = con.prepareStatement(sql);
				ps.setInt(1, cod_ven);

				double totalventa = 0;
				while (res.next()) {

					totalventa = res.getDouble(1);
				}

				sql = "update ventas set total_venta=? where codigo_venta=?";
				ps = con.prepareStatement(sql);
				ps.setDouble(1, totalventa);
				ps.setInt(2, cod_ven);
				resul = ps.executeUpdate() > 0;

				sql = "update ventas set valor_venta=(?+?) where codigo_venta=?";
				ps = con.prepareStatement(sql);
				ps.setDouble(1, ivaventa);
				ps.setDouble(2, totalventa);
				ps.setInt(3, cod_ven);
				resul = ps.executeUpdate() > 0;
			}

		} catch (

		SQLException ex) {
			JOptionPane.showMessageDialog(null, "Error al insertar venta" + ex);
		}
		return resul;
	}

}
