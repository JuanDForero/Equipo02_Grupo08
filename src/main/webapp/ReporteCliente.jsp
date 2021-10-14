<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>REPORTE DE USUARIOS</title>
<link rel="stylesheet" href="CSS/Reporte.css">
</head>
<body>

	<%
	Connection con;
	String url = "jdbc:mysql://localhost:3306/tienda";
	String Driver = "com.mysql.jdbc.Driver";
	String User = "root";
	String clave = "";

	Class.forName(Driver);

	con = DriverManager.getConnection(url, User, clave);

	PreparedStatement ps;
	ResultSet rs;

	ps = con.prepareStatement("select * from clientes");
	rs = ps.executeQuery();
	%>

	<div>
		<header id=header>
			<img src="Recursos/logo-tienda.png" alt="" class="logo">

			<!-- Menu Header -->
			<ul class="main-menu">
				<li id="usuario"><a class="menu" href="CRUD-Usuario.jsp">Usuarios</a>
				</li>
				<li id="cliente"><a class="menu" href="CRUD-Cliente.jsp">Clientes</a>
				</li>
				<li id="proveedor"><a class="menu" href="CRUD-Proveedor.jsp">Proveedores</a>
				</li>
				<li id="producto"><a class="menu" href="CRUD-Producto.jsp">Productos</a></li>
				<li id="venta"><a class="menu" href="CRUD-Venta.jsp">Ventas</a></li>
				<li id="reporte"><a class="menu" href="CRUD-Reporte.jsp">Reportes</a></li>
				<li class="cta"><a class="menu" href="index.jsp">Sign Out</a></li>
			</ul>
		</header>
	</div>

	<div class="contenedor" id="container">
		<!-- FORM CLIENTE -->
		<div data-content class="all-wrapper" id="clientecontainer">
			<div class="formulario">
				<h3>Consulta de Clientes</h3>
				<table border=1>
					<thead>
						<tr>
							<th>CEDULA CLIENTE</th>
							<th>DIRECCION CLIENTE</th>
							<th>EMAIL CLIENTE</th>
							<th>NOMBRE CLIENTE</th>
							<th>TELEFONO CLIENTE</th>

						</tr>
					</thead>

						<%
						while (rs.next()) {
						%>

						<tr>
							<td><%=rs.getInt("cedula_cliente")%></td>
							<td><%=rs.getString("direccion_cliente")%></td>
							<td><%=rs.getString("email_cliente")%></td>
							<td><%=rs.getString("nombre_cliente")%></td>
							<td><%=rs.getString("telefono_cliente")%></td>
						</tr>
						<%
						}
						%>
					
				</table>
			</div>
			<!-- <div class="usuario-info"></div> -->
		</div>
	</div>
</body>
</html>