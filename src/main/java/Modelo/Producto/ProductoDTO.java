package Modelo.Producto;

public class ProductoDTO {

	private int Codigo;
	private double Iva;
	private int Id_Proveedor;
	private String Nombre_Producto;
	private double Precio_Compra;
	private double Precio_Venta;

	public ProductoDTO(int codigo, double iva, int id_Proveedor, String nombre_Producto, double precio_Compra,
			double precio_Venta) {
		super();
		Codigo = codigo;
		Iva = iva;
		Id_Proveedor = id_Proveedor;
		Nombre_Producto = nombre_Producto;
		Precio_Compra = precio_Compra;
		Precio_Venta = precio_Venta;
	}

	public int getCodigo() {
		return Codigo;
	}

	public void setCodigo(int codigo) {
		Codigo = codigo;
	}

	public double getIva() {
		return Iva;
	}

	public void setIva(double iva) {
		Iva = iva;
	}

	public int getId_Proveedor() {
		return Id_Proveedor;
	}

	public void setId_Proveedor(int id_Proveedor) {
		Id_Proveedor = id_Proveedor;
	}

	public String getNombre_Producto() {
		return Nombre_Producto;
	}

	public void setNombre_Producto(String nombre_Producto) {
		Nombre_Producto = nombre_Producto;
	}

	public double getPrecio_Compra() {
		return Precio_Compra;
	}

	public void setPrecio_Compra(double precio_Compra) {
		Precio_Compra = precio_Compra;
	}

	public double getPrecio_Venta() {
		return Precio_Venta;
	}

	public void setPrecio_Venta(double precio_Venta) {
		Precio_Venta = precio_Venta;
	}

}
