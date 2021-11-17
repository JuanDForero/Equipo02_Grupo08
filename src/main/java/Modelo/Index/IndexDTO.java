package Modelo.Index;

public class IndexDTO {

	private String Usuario;
	private String Password;
	
	public IndexDTO(String usuario, String password) {
		super();
		Usuario = usuario;
		Password = password;
	}

	public String getUsuario() {
		return Usuario;
	}

	public void setUsuario(String usuario) {
		Usuario = usuario;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}
	
	
}
