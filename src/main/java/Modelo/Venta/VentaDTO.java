package Modelo.Venta;

public class VentaDTO {
	
	private int cod_venta;
	private int id_cliente;
	private int id_usuario;
	private double iva;
	private double total_venta;
	private double valor_venta;
	private int cod_prod;
	
	public VentaDTO(int id_cliente, int id_usuario, int cod_prod) {
		super();
		
		this.id_cliente = id_cliente;
		this.id_usuario = id_usuario;
		this.cod_prod = cod_prod;
		
	}

//	public VentaDTO(int cod_venta, int id_cliente, int id_usuario) {
		
//	}


	

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

	public int getCod_prod() {
		return cod_prod;
	}

	public void setCod_prod(int cod_prod) {
		this.cod_prod = cod_prod;
	}
	
	

	
	
}
