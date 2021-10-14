package Controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Modelo.Cliente.ClienteDAO;
import Modelo.Cliente.ClienteDTO;

/**
 * Servlet implementation class Cliente
 */
@WebServlet("/Cliente")
public class Cliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Cliente() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ClienteDAO cliDAO = new ClienteDAO();
		
		/*METODO INSERTAR*/
		if (request.getParameter("insertar") != null) {
			String direccion, email, nombre, telefono;
			int id;
			id = Integer.parseInt(request.getParameter("id"));
			direccion = request.getParameter("direccion");
			email = request.getParameter("email");
			nombre = request.getParameter("fullname");
			telefono = request.getParameter("cellphone");
			ClienteDTO cli = new ClienteDTO(id, direccion, email, nombre, telefono);

			if (cliDAO.Inserta_Cliente(cli)) {
				
				response.sendRedirect("CRUD-Cliente.jsp");
			} else {
				
				response.sendRedirect("CRUD-Cliente.jsp");
			}
		}
		
		/* METODO CONSULTAR */
		if (request.getParameter("consultar") != null) {
			String direccion, email, nombre, telefono;
			int id;
			id = Integer.parseInt(request.getParameter("id"));
			ClienteDTO cli = cliDAO.Buscar_Cliente(id);

			if (cli != null) {
				id = cli.getCedula();
				direccion = cli.getDireccion();
				email = cli.getEmail();
				nombre = cli.getNombre();
				telefono = cli.getTelefono();
				response.sendRedirect("CRUD-Cliente.jsp?id=" + id + "&&direccion=" + direccion + "&&email=" + email
						+ "&&nombre=" + nombre + "&&telefono=" + telefono);
			} else {
				response.sendRedirect("CRUD-Cliente.jsp?men=Cliente no registrado...");
			}
		}
		
		/* METODO ACTUALIZAR */
		if (request.getParameter("actualizar") != null) {
			String direccion, email, nombre, telefono;
			int id;
			id = Integer.parseInt(request.getParameter("id"));
			direccion = request.getParameter("direccion");
			email = request.getParameter("email");
			nombre = request.getParameter("fullname");
			telefono = request.getParameter("cellphone");
			ClienteDTO cli = new ClienteDTO(id, direccion, email, nombre, telefono);
			if (cliDAO.Actualizar_Cliente(cli)) {
				response.sendRedirect("CRUD-Cliente.jsp?men=Cliente Actualizado Exitosamente.");
			} else {
				
				response.sendRedirect("CRUD-Cliente.jsp?men=El Cliente no se Modifico.");
			}
		}

		/* METODO ELIMINAR */

		if (request.getParameter("eliminar") != null) {
			int id;
			id = Integer.parseInt(request.getParameter("id"));
			int op = 0;
			if (op == 0) {
				if (cliDAO.Eliminar_Cliente(id)) {
					response.sendRedirect("CRUD-Cliente.jsp?men=Cliente Eliminado");
				} else {
					response.sendRedirect("CRUD-Cliente.jsp?men=Cliente no se elimino");
				}
			} else {
				response.sendRedirect("CRUD-Cliente.jsp");
			}
		}
	}

}
