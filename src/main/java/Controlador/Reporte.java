package Controlador;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/Reporte")
public class Reporte extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Reporte() {
        super();
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("listaU") != null) {
			
				
				response.sendRedirect("ReporteUsuario.jsp");
			
		}
		if (request.getParameter("listac") != null) {
			
			
			response.sendRedirect("CRUD-Reporte.jsp");
		
	}
		if (request.getParameter("ventasC") != null) {
			
			
			response.sendRedirect("CRUD-Reporte.jsp");
		
	}
	}

	
}
