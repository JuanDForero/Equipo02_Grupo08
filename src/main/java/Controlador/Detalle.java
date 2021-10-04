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
import Modelo.Venta.VentaDAO;
import Modelo.Venta.VentaDTO;

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
				Double iva = prod.getIva();
				cod=prod.getCodigo();
				
				
				response.sendRedirect("CRUD-Venta.jsp?cod_prod=" + cod + "&&name_prod=" + name + "&&prec=" + prec +"&&iva=" +iva);
				
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
				Double iva = prod.getIva();
				cod=prod.getCodigo();
				
				
				response.sendRedirect("CRUD-Venta.jsp?cod_prod2=" + cod + "&&name_prod2=" + name + "&&prec2=" + prec +"&&iva2="+iva);
				
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
				Double iva = prod.getIva();
				cod=prod.getCodigo();
				
				
				response.sendRedirect("CRUD-Venta.jsp?cod_prod3=" + cod + "&&name_prod3=" + name + "&&prec3=" + prec + "&&iva3="+iva);
				
			}else {
				response.sendRedirect("CRUD-Venta.jsp?men=El Cliente no se encontro");
			}
		}
		
		
		
		
		if(request.getParameter("confirmar")!=null) {
			
		double valor=0,valor2=0,valor3=0,precio,precio2,precio3,venta,iva,iva2,iva3;
		int cant,cant2,cant3;
		String nombre;
		int cod_usuario=123, cod_cliente,cod_prod,cod_prod2,cod_prod3;
		
		precio = Double.parseDouble(request.getParameter("prec")) ;
		cant = Integer.parseInt(request.getParameter("cant")) ;	
		valor = cant * precio;
		iva = Double.parseDouble(request.getParameter("iva"));
		cod_prod = Integer.parseInt(request.getParameter("cod_prod"));
		
		precio2 = Double.parseDouble(request.getParameter("prec2")) ;
		cant2 = Integer.parseInt(request.getParameter("cant2")) ;	
		valor2 = cant2 * precio2;
		iva2 = Double.parseDouble(request.getParameter("iva2"));
		cod_prod2 = Integer.parseInt(request.getParameter("cod_prod2"));
		
		precio3 = Double.parseDouble(request.getParameter("prec3")) ;
		cant3 = Integer.parseInt(request.getParameter("cant3")) ;	
		valor3 = cant3 * precio3;
		iva3 = Double.parseDouble(request.getParameter("iva3"));
		//Integer.parseInt(request.getParameter("id"));
		cod_cliente = 134;
		//nombre = request.getParameter("name");
		cod_prod3 = Integer.parseInt(request.getParameter("cod_prod3"));
		venta = valor + valor2 + valor3;
		
		
		VentaDAO venDAO	= new VentaDAO();
		DetalleDAO detDAO = new DetalleDAO();
		
		if(cod_prod != 0  || cod_prod2 != 0  || cod_prod3 != 0 ) 
		{
			DetalleDTO det = new DetalleDTO(cant,cod_prod);
			VentaDTO ven = new VentaDTO(cod_cliente,cod_usuario,cod_prod);
			venDAO.Inserta_venta(ven);
			detDAO.Inserta_Factura(det);
			
			DetalleDTO det2 = new DetalleDTO(cant2,cod_prod2);
			VentaDTO ven2 = new VentaDTO(cod_cliente,cod_usuario,cod_prod2);
			venDAO.Inserta_venta(ven2);
			detDAO.Inserta_Factura(det2);
			
			DetalleDTO det3 = new DetalleDTO(cant3,cod_prod3);
			VentaDTO ven3 = new VentaDTO(cod_cliente,cod_usuario,cod_prod3);
			venDAO.Inserta_venta(ven3);
			detDAO.Inserta_Factura(det3);
			
			response.sendRedirect("CRUD-Venta.jsp?valor=" +valor+"&&cant="+cant+ "&&valor2="+valor2+"&&cant2="+cant2+"&&valor3="+valor3+"&&cant3="+cant3+"&&venta="+venta);
			
			}
		
		
		
		else 
		
		{
			
			response.sendRedirect("CRUD-Venta.jsp?men=venta no Registrada");
			
		}
		
		
		
		}
	}

}