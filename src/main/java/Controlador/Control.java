package Controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

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
		if(request.getParameter("enviar")!=null) {
			String usuario,password;
			usuario=request.getParameter("user");
			password=request.getParameter("pass");
			
			if(usuario.equals("admininicial") && password.equals("admin123456")) {
				JOptionPane.showMessageDialog(null, "Bienvenido!! Administrador");
				response.sendRedirect("Menu.jsp");
			}else {
				JOptionPane.showMessageDialog(null, "Datos Incorrectos");
				response.sendRedirect("Login.jsp");
			}
		}
	}

}
