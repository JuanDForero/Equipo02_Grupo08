package Modelo.Venta;

public class VentaDTO {
	
	private int cod_venta;
	private int id_cliente;
	private int id_usuario;
	private double iva;
	private double total_venta;
	private double valor_venta;
	
	public VentaDTO(int cod_venta, int id_cliente, int id_usuario, double iva, double total_venta, double valor_venta) {
		super();
		this.cod_venta = cod_venta;
		this.id_cliente = id_cliente;
		this.id_usuario = id_usuario;
		this.iva = iva;
		this.total_venta = total_venta;
		this.valor_venta = valor_venta;
	}

	public int getCod_venta() {
		return cod_venta;
	}

	public void setCod_venta(int cod_venta) {
		this.cod_venta = cod_venta;
	}

	public int getId_cliente() {
		return id_cliente;
	}

	public void setId_cliente(int id_cliente) {
		this.id_cliente = id_cliente;
	}

	public int getId_usuario() {
		return id_usuario;
	}

	public void setId_usuario(int id_usuario) {
		this.id_usuario = id_usuario;
	}

	public double getIva() {
		return iva;
	}

	public void setIva(double iva) {
		this.iva = iva;
	}

	public double getTotal_venta() {
		return total_venta;
	}

	public void setTotal_venta(double total_venta) {
		this.total_venta = total_venta;
	}

	public double getValor_venta() {
		return valor_venta;
	}

	public void setValor_venta(double valor_venta) {
		this.valor_venta = valor_venta;
	}
	
	
}
