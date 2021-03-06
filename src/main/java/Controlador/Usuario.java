package Controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Modelo.Usuario.UsuarioDAO;
import Modelo.Usuario.UsuarioDTO;

/**
 * Servlet implementation class Usuario
 */
@WebServlet("/Usuario")
public class Usuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Usuario() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UsuarioDAO userDAO = new UsuarioDAO();

		/* METODO INSERTAR */
		if (request.getParameter("insertar") != null) {
			String email, nombre, pass, usuario;
			int id;
			id = Integer.parseInt(request.getParameter("id"));
			email = request.getParameter("email");
			nombre = request.getParameter("fullname");
			pass = request.getParameter("pass");
			usuario = request.getParameter("user");
			UsuarioDTO user = new UsuarioDTO(id, email, nombre, pass, usuario);

			if (userDAO.Inserta_Usuario(user)) {
				
				response.sendRedirect("CRUD-Usuario.jsp");
			} else {
				
				response.sendRedirect("CRUD-Usuario.jsp");
			}
		}

		/* METODO CONSULTAR */
		if (request.getParameter("consultar") != null) {
			String email, nombre, pass, usuario;
			int id;
			id = Integer.parseInt(request.getParameter("id"));
			UsuarioDTO user = userDAO.Buscar_Usuario(id);

			if (user != null) {
				id = user.getId();
				email = user.getEmail();
				nombre = user.getNombre();
				pass = user.getPass();
				usuario = user.getUsuario();
				response.sendRedirect("CRUD-Usuario.jsp?id=" + id + "&&email=" + email + "&&nombre=" + nombre
						+ "&&pass=" + pass + "&&usuario=" + usuario);
			} else {
				response.sendRedirect("CRUD-Usuario.jsp?men=Usuario no registrado...");
			}
		}

		/* METODO ACTUALIZAR */
		if (request.getParameter("actualizar") != null) {
			String email, nombre, pass, usuario;
			int id;
			id = Integer.parseInt(request.getParameter("id"));
			email = request.getParameter("email");
			nombre = request.getParameter("fullname");
			pass = request.getParameter("pass");
			usuario = request.getParameter("user");
			UsuarioDTO user = new UsuarioDTO(id, email, nombre, pass, usuario);
			if (userDAO.Actualizar_Usuario(user)) {
				
				response.sendRedirect("CRUD-Usuario.jsp?men=Usuario Actualizado Exitosamente.");
			} else {
				
				response.sendRedirect("CRUD-Usuario.jsp?men=El Usuario no se Modifico.");
			}
		}

		/* METODO ELIMINAR */

		if (request.getParameter("eliminar") != null) {
			int id;
			id = Integer.parseInt(request.getParameter("id"));
			int op = 0;
			if (op == 0) {
				if (userDAO.Eliminar_Usuario(id)) {
					response.sendRedirect("CRUD-Usuario.jsp?men=Usuario Eliminado");
				} else {
					response.sendRedirect("CRUD-Usuario.jsp?men=El Usuario no se elimino");
				}
			} else {
				response.sendRedirect("CRUD-Usuario.jsp");
			}
		}
		
		/*CERRAR SESION*/
		if(request.getParameter("salir") != null) {
			HttpSession sesion = request.getSession();
			sesion.removeAttribute("nombre");//Removiendo el atributo del nombre por lo cual sera null
			response.sendRedirect("index.jsp");
		}
		
	}

}
