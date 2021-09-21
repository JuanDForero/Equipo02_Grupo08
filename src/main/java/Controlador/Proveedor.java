package Controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import Modelo.Proveedor.ProveedorDAO;
import Modelo.Proveedor.ProveedorDTO;

/**
 * Servlet implementation class Proveedor
 */
@WebServlet("/Proveedor")
public class Proveedor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Proveedor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProveedorDAO proDAO=new ProveedorDAO();
		
		/* METODO INSERTAR */
		if(request.getParameter("insertar")!=null) {
			String ciudad,direccion,nombre,telefono;
			int id;
			id=Integer.parseInt(request.getParameter("id"));
			ciudad=request.getParameter("city");
			direccion=request.getParameter("direccion");
			nombre=request.getParameter("fullname");
			telefono=request.getParameter("cellphone");
			ProveedorDTO pro= new ProveedorDTO(id,ciudad,direccion,nombre,telefono);
			
			if(proDAO.Inserta_Proveedor(pro)) {
				JOptionPane.showMessageDialog(null, "Registro exitoso");
				response.sendRedirect("CRUD-Proveedor.jsp");
			}else {
				JOptionPane.showMessageDialog(null, "Registro fallido");
				response.sendRedirect("CRUD-Proveedor.jsp");
			}
		}
		
		/* METODO CONSULTAR */
		if (request.getParameter("consultar") != null) {
			String ciudad,direccion,nombre,telefono;
			int id;
			id = Integer.parseInt(request.getParameter("id"));
			ProveedorDTO user = proDAO.Buscar_Proveedor(id);

			if (user != null) {
				id = user.getId();
				ciudad = user.getCiudad();
				direccion = user.getDireccion();
				nombre = user.getNombre();
				telefono = user.getTelefono();
				response.sendRedirect("CRUD-Proveedor.jsp?id=" + id + "&&ciudad=" + ciudad + "&&direccion=" + direccion
						+ "&&nombre=" + nombre + "&&telefono=" + telefono);
			} else {
				response.sendRedirect("CRUD-Proveedor.jsp?men=Usuario no registrado...");
			}
		}
		
		/* METODO ACTUALIZAR */
		if (request.getParameter("actualizar") != null) {
			String ciudad,direccion,nombre,telefono;
			int id;
			id=Integer.parseInt(request.getParameter("id"));
			ciudad=request.getParameter("city");
			direccion=request.getParameter("direccion");
			nombre=request.getParameter("fullname");
			telefono=request.getParameter("cellphone");
			ProveedorDTO pro= new ProveedorDTO(id,ciudad,direccion,nombre,telefono);
			if (proDAO.Actualizar_Proveedor(pro)) {
				JOptionPane.showMessageDialog(null, "El Proveedor se Actualizo Exitosamente.");
				response.sendRedirect("CRUD-Proveedor.jsp?men=Proveedor Actualizado Exitosamente.");
			} else {
				JOptionPane.showMessageDialog(null, "El Proveedor no se Modifico.");
				response.sendRedirect("CRUD-Proveedor.jsp?men=El Proveedor no se Modifico.");
			}
		}

		/* METODO ELIMINAR */

		if (request.getParameter("eliminar") != null) {
			int id;
			id = Integer.parseInt(request.getParameter("id"));
			int op = JOptionPane.showConfirmDialog(null, "Desea Eliminar al Proveedor NIT: " + id);
			if (op == 0) {
				if (proDAO.Eliminar_Proveedor(id)) {
					response.sendRedirect("CRUD-Proveedor.jsp?men=Proveedor Eliminado");
				} else {
					response.sendRedirect("CRUD-Proveedor.jsp?men=El Proveedor no se elimino");
				}
			} else {
				response.sendRedirect("CRUD-Proveedor.jsp");
			}
		}
	}

}
