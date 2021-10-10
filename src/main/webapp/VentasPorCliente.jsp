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
</head>
<body>

<%
Connection con;
String url = "jdbc:mysql://localhost:3306/tienda";
String Driver ="com.mysql.jdbc.Driver";
String User = "root";
String clave = "";

Class.forName(Driver);

con = DriverManager.getConnection(url,User,clave);


PreparedStatement ps;
ResultSet rs;

ps = con.prepareStatement("select c.cedula_cliente,c.nombre_cliente,sum(v.total_venta) from clientes as c inner join ventas as v on c.cedula_cliente = v.cedula_cliente group by v.cedula_cliente");
rs= ps.executeQuery();
%>

<div>

<h1>
Consulta de ventas por cliente
</h1>

<table border = 1>
	<tr>
		<th>CEDULA CLIENTE</th>
		<th>NOMBRE CLIENTE</th>
		<th>VALOR TOTAL DE LA COMPRA</th>
		
		
	</tr>
	
	<%
		while(rs.next()){
	
	%>
	
	<tr>
		<td> <%= rs.getInt("cedula_cliente")  %> </td>
		<td> <%= rs.getString("nombre_cliente")  %> </td>
		<td> <%= rs.getInt("sum(v.total_venta)")  %> </td>
		
	</tr>
	<% } %>
	
</table>

</div>



</body>
</html>