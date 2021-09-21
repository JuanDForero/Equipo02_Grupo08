package Modelo.Proveedor;

public class ProveedorDTO {

	private int Id;
	private String Ciudad;
	private String Direccion;
	private String Nombre;
	private String Telefono;
	
	public ProveedorDTO(int id, String ciudad, String direccion, String nombre, String telefono) {
		super();
		Id = id;
		Ciudad = ciudad;
		Direccion = direccion;
		Nombre = nombre;
		Telefono = telefono;
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public String getCiudad() {
		return Ciudad;
	}

	public void setCiudad(String ciudad) {
		Ciudad = ciudad;
	}

	public String getDireccion() {
		return Direccion;
	}

	public void setDireccion(String direccion) {
		Direccion = direccion;
	}

	public String getNombre() {
		return Nombre;
	}

	public void setNombre(String nombre) {
		Nombre = nombre;
	}

	public String getTelefono() {
		return Telefono;
	}

	public void setTelefono(String telefono) {
		Telefono = telefono;
	}
	
	
	
}
