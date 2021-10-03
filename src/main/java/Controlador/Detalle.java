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
				Double prec=prod.getPrecio_Venta();
				cod=prod.getCodigo();
				
				
				response.sendRedirect("CRUD-Venta.jsp?cod_prod=" + cod + "&&name_prod=" + name + "&&prec=" + prec);
				
			}else {
				response.sendRedirect("CRUD-Venta.jsp?men=El Cliente no se encontro");
			}
		}
		
		if(request.getParameter("consultar2")!=null) {
			int cod= Integer.parseInt(request.getParameter("cod_prod2"));
			ProductoDAO prodDAO=new ProductoDAO();
			ProductoDTO prod= prodDAO.Buscar_Producto(cod);
			
			if(prod!=null) {
				String name=prod.getNombre_Producto();
				Double prec=prod.getPrecio_Venta();
				cod=prod.getCodigo();
				
				
				response.sendRedirect("CRUD-Venta.jsp?cod_prod2=" + cod + "&&name_prod2=" + name + "&&prec2=" + prec);
				
			}else {
				response.sendRedirect("CRUD-Venta.jsp?men=El Cliente no se encontro");
			}
		}
		
		if(request.getParameter("consultar3")!=null) {
			int cod= Integer.parseInt(request.getParameter("cod_prod3"));
			ProductoDAO prodDAO=new ProductoDAO();
			ProductoDTO prod= prodDAO.Buscar_Producto(cod);
			
			if(prod!=null) {
				String name=prod.getNombre_Producto();
				Double prec=prod.getPrecio_Venta();
				cod=prod.getCodigo();
				
				
				response.sendRedirect("CRUD-Venta.jsp?cod_prod3=" + cod + "&&name_prod3=" + name + "&&prec3=" + prec);
				
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
		
		
		if(request.getParameter("confirmar")!=null) {
			
		double valor=0,valor2=0,valor3=0,precio,precio2,precio3,venta;
		int cant,cant2,cant3;
		
		precio = Double.parseDouble(request.getParameter("prec")) ;
		cant = Integer.parseInt(request.getParameter("cant")) ;	
		valor = cant * precio;
		
		precio2 = Double.parseDouble(request.getParameter("prec2")) ;
		cant2 = Integer.parseInt(request.getParameter("cant2")) ;	
		valor2 = cant2 * precio2;
		
		precio3 = Double.parseDouble(request.getParameter("prec3")) ;
		cant3 = Integer.parseInt(request.getParameter("cant3")) ;	
		valor3 = cant3 * precio3;
		
		venta = valor + valor2 + valor3;
		
		response.sendRedirect("CRUD-Venta.jsp?valor=" +valor+"&&cant="+cant+ "&&valor2="+valor2+"&&cant2="+cant2+"&&valor3="+valor3+"&&cant3="+cant3+"&&venta="+venta);
		
		}
	}

}