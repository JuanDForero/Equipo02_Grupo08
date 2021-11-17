package Controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Modelo.Index.IndexDAO;
import Modelo.Index.IndexDTO;



/**
 * Servlet implementation class Control
 */
@WebServlet("/Control")
public class Control extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Control() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sesion = request.getSession();
		IndexDAO logDAO = new IndexDAO();
		if(request.getParameter("enviar")!=null) {
			String usuario,password;
			usuario=request.getParameter("user");
			password=request.getParameter("pass");
			
			boolean log = logDAO.Login(usuario,password);
			
			if(log == true) {
				response.sendRedirect("Menu.jsp?men=Bienvenido...");
				String nombre = usuario;
				
				sesion.setAttribute("nombre", nombre);
			
			/*if(usuario.equals("admininicial") && password.equals("admin123456")) {
				
				response.sendRedirect("Menu.jsp");}*/
			
			}else {
				request.setAttribute("success",0);
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		}
		
	}

}
