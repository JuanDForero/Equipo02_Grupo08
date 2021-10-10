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

ps = con.prepareStatement("select * from clientes");
rs= ps.executeQuery();
%>

<div>

<h1>
Consulta de Clientes
</h1>

<table border = 1>
	<tr>
		<th>CEDULA CLIENTE</th>
		<th>DIRECCION CLIENTE</th>
		<th>EMAIL CLIENTE</th>
		<th>NOMBRE CLIENTE</th>
		<th>TELEFONO CLIENTE</th>
		
	</tr>
	
	<%
		while(rs.next()){
	
	%>
	
	<tr>
		<td> <%= rs.getInt("cedula_cliente")  %> </td>
		<td> <%= rs.getString("direccion_cliente")  %> </td>
		<td> <%= rs.getString("email_cliente")  %> </td>
		<td> <%= rs.getString("nombre_cliente")  %> </td>
		<td> <%= rs.getString("telefono_cliente")  %> </td>
	</tr>
	<% } %>
	
</table>

</div>



</body>
</html>