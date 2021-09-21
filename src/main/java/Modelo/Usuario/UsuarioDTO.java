package Modelo.Usuario;

public class UsuarioDTO {

	private int Id;
	private String Email;
	private String Nombre;
	private String Pass;
	private String Usuario;
	
	public UsuarioDTO(int id, String email, String nombre, String pass, String usuario) {
		super();
		Id = id;
		Email = email;
		Nombre = nombre;
		Pass = pass;
		Usuario = usuario;
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getNombre() {
		return Nombre;
	}

	public void setNombre(String nombre) {
		Nombre = nombre;
	}

	public String getPass() {
		return Pass;
	}

	public void setPass(String pass) {
		Pass = pass;
	}

	public String getUsuario() {
		return Usuario;
	}

	public void setUsuario(String usuario) {
		Usuario = usuario;
	}
	
	
	
}
