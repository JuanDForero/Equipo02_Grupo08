package Controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Modelo.Detalle.DetalleDAO;
import Modelo.Detalle.DetalleDTO;
import Modelo.Producto.ProductoDAO;
import Modelo.Producto.ProductoDTO;

/**
 * Servlet implementation class Detalle
 */
@WebServlet("/Detalle")
public class Detalle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Detalle() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("consultar")!=null) {
			int cod= Integer.parseInt(request.getParameter("cod_prod"));
			ProductoDAO prodDAO=new ProductoDAO();
			ProductoDTO prod= prodDAO.Buscar_Producto(cod);
			
			if(prod!=null) {
				String name=prod.getNombre_Producto();
				cod=prod.getCodigo();
				response.sendRedirect("CRUD-Venta.jsp?cod_prod=" + cod + "&&name=" + name);
				
			}else {
				response.sendRedirect("CRUD-Venta.jsp?men=El Cliente no se encontro");
			}
		}
		
		if(request.getParameter("registrar")!=null) {
			int cantidad,id_producto,id_venta;
			id_producto=Integer.parseInt(request.getParameter("cod_prod"));
			id_venta=Integer.parseInt(request.getParameter("consec"));
			cantidad=Integer.parseInt(request.getParameter("cant"));
			DetalleDTO prodDTO=new DetalleDTO(cantidad,id_producto,id_venta);
			DetalleDAO prodDAO= new DetalleDAO();
			
			if(prodDAO.Inserta_Factura(prodDTO)) {
				response.sendRedirect("CRUD-Venta.jsp?men=Factura Registrada Correctamente");
			}else {
				response.sendRedirect("CRUD-Venta.jsp?men=Factura no se Registro");
			}
		}
	}

}
