package Modelo.Detalle;

public class DetalleDTO {
	
	private int cod_detalle;
	private int cantidad;
	private int cod_producto;
	private int cod_venta;
	private int valor_total;
	private int valor_venta;
	private int iva;
	
	public DetalleDTO(int cantidad, int cod_producto, int cod_venta) {
		super();
		this.cantidad = cantidad;
		this.cod_producto = cod_producto;
		this.cod_venta = cod_venta;
	}

	public int getCod_detalle() {
		return cod_detalle;
	}

	public void setCod_detalle(int cod_detalle) {
		this.cod_detalle = cod_detalle;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public int getCod_producto() {
		return cod_producto;
	}

	public void setCod_producto(int cod_producto) {
		this.cod_producto = cod_producto;
	}

	public int getCod_venta() {
		return cod_venta;
	}

	public void setCod_venta(int cod_venta) {
		this.cod_venta = cod_venta;
	}

	public int getValor_total() {
		return valor_total;
	}

	public void setValor_total(int valor_total) {
		this.valor_total = valor_total;
	}

	public int getValor_venta() {
		return valor_venta;
	}

	public void setValor_venta(int valor_venta) {
		this.valor_venta = valor_venta;
	}

	public int getIva() {
		return iva;
	}

	public void setIva(int iva) {
		this.iva = iva;
	}
	
	
}
