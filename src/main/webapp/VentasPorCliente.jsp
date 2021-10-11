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

	ps = con.prepareStatement(
			"select c.cedula_cliente,c.nombre_cliente,sum(v.total_venta) from clientes as c inner join ventas as v on c.cedula_cliente = v.cedula_cliente group by v.cedula_cliente");
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
				<li class="cta">Sign Out</li>
			</ul>
		</header>
	</div>


	<div class="contenedor" id="container">
		<!-- FORM CLIENTE -->
		<div data-content class="all-wrapper" id="clientecontainer">
			<div class="formulario">
				<h3>Consulta de ventas por cliente</h3>
				<table border=1>
					<thead>
						<tr>
							<th>CEDULA CLIENTE</th>
							<th>NOMBRE CLIENTE</th>
							<th>VALOR TOTAL DE LA COMPRA</th>


						</tr>
					</thead>

					<%
					while (rs.next()) {
					%>

					<tr>
						<td><%=rs.getInt("cedula_cliente")%></td>
						<td><%=rs.getString("nombre_cliente")%></td>
						<td><%=rs.getInt("sum(v.total_venta)")%></td>

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