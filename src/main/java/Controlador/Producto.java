package Controlador;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.swing.JOptionPane;

import Modelo.Producto.ProductoDAO;
import Modelo.Producto.ProductoDTO;


/**
 * Servlet implementation class Producto
 */
@WebServlet("/Producto")
public class Producto extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Producto() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductoDAO prodDAO = new ProductoDAO();

		/* METODO CONSULTAR */
		if (request.getParameter("consultar") != null) {
			String nombre;
			int codigo,id;
			double iva,venta,compra;
			codigo = Integer.parseInt(request.getParameter("codigo"));
			ProductoDTO prod = prodDAO.Buscar_Producto(codigo);

			if (prod != null) {
				codigo = prod.getCodigo();
				iva = prod.getIva();
				id = prod.getId_Proveedor();
				nombre = prod.getNombre_Producto();
				compra = prod.getPrecio_Compra();
				venta = prod.getPrecio_Venta();
				response.sendRedirect("CRUD-Producto.jsp?codigo=" + codigo + "&&iva=" + iva + "&&id=" + id
						+ "&&nombre=" + nombre + "&&compra=" + compra + "&&venta=" + venta);
			} else {
				response.sendRedirect("CRUD-Producto.jsp?men=Producto no registrado...");
			}
		}

		/* METODO ACTUALIZAR */
		if (request.getParameter("actualizar") != null) {
			String nombre;
			int codigo,id;
			double iva,venta,compra;
			codigo = Integer.parseInt(request.getParameter("codigo"));
			iva = Double.parseDouble(request.getParameter("iva"));
			id = Integer.parseInt(request.getParameter("id"));
			nombre = request.getParameter("nombre");
			compra = Double.parseDouble(request.getParameter("compra"));
			venta = Double.parseDouble(request.getParameter("venta"));
			ProductoDTO prod = new ProductoDTO(codigo,iva,id,nombre,compra,venta);
			if (prodDAO.Actualizar_Producto(prod)) {
				response.sendRedirect("CRUD-Producto.jsp?men=Producto Actualizado Exitosamente.");
			} else {
				JOptionPane.showMessageDialog(null, "El Producto no se Modifico.");
				response.sendRedirect("CRUD-Producto.jsp?men=El Producto no se Modifico.");
			}
		}

		/* METODO ELIMINAR */

		if (request.getParameter("eliminar") != null) {
			int codigo;
			codigo = Integer.parseInt(request.getParameter("codigo"));
			int op = JOptionPane.showConfirmDialog(null, "Desea Eliminar el Producto Codigo: " + codigo);
			if (op == 0) {
				if (prodDAO.Eliminar_Producto(codigo)) {
					response.sendRedirect("CRUD-Producto.jsp?men=Producto Eliminado");
				} else {
					response.sendRedirect("CRUD-Producto.jsp?men=Producto no se elimino");
				}
			} else {
				response.sendRedirect("CRUD-Producto.jsp");
			}
		}

		/* METODO CARGAR */
		if (request.getParameter("cargar") != null) {
			Part archivo = request.getPart("archivo");

			// String tipo= archivo.getContentType();
			String Url = "C:/Users/yazo_/eclipse-workspace/TiendaGenerica/src/main/webapp/Documentos/";
			 //String Url="C:\\Users\\yazo_\\eclipse-workspace\\TiendaGenerica\\src\\main\\webapp\\Documentos";

			if (archivo.getContentType().equals("application/vnd.ms-excel")) {
				try {
					InputStream file = archivo.getInputStream();
					File copia = new File(Url + "prueba08.csv");
					FileOutputStream escribir = new FileOutputStream(copia);
					int num = file.read();
					while (num != -1) {
						escribir.write(num);
						num = file.read();
					}
					file.close();
					escribir.close();

					JOptionPane.showMessageDialog(null, "Se cargo el archivo correctamente");
					if (prodDAO.Cargar_Producto(Url + "prueba08.csv")) {
						// JOptionPane.showMessageDialog(null, "Se registro los Producto Correctamente");
						response.sendRedirect("CRUD-Producto.jsp?men=Se registro los Productos Correctamente");
					} else {
						response.sendRedirect("CRUD-Producto.jsp?men=No se registraron Productos");
					}

				} catch (Exception e) {
					JOptionPane.showMessageDialog(null, "Error al cargar el archivo" + e);
					response.sendRedirect("CRUD-Producto.jsp?men=Error al cargar el archivo");
				}
			} else {
				// JOptionPane.showMessageDialog(null, "Formato de archivo no permitido");
				response.sendRedirect("CRUD-Producto.jsp?men=Formato de archivo no permitido");
			}

		}
	}

}
