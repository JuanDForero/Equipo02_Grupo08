package Controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import Modelo.Cliente.ClienteDAO;
import Modelo.Cliente.ClienteDTO;

/**
 * Servlet implementation class Venta
 */
@WebServlet("/Venta")
public class Venta extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Venta() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("consultar")!=null) {
			int id= Integer.parseInt(request.getParameter("id"));
			ClienteDAO cliDAO=new ClienteDAO();
			ClienteDTO cli= cliDAO.Buscar_Cliente(id);
			
			
			try {
				
				if(cli!=null) {
					String nombre=cli.getNombre();
					id=cli.getCedula();
					response.sendRedirect("CRUD-Venta.jsp?id=" + id + "&&nombre=" + nombre);
					
				}
				
			} catch (Exception e) {
				response.sendRedirect("CRUD-Usuario.jsp?men=El Cliente no se encontro");
				
				JOptionPane.showMessageDialog(null, "El Cliente no se encontro.");
			}
			
		}
		
		
		
	}

}
