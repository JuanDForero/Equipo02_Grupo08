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

ps = con.prepareStatement("select * from usuarios");
rs= ps.executeQuery();
%>

<div>

<h1>
Consulta de usuarios
</h1>

<table border = 1>
	<tr>
		<th>CEDULA USUARIO</th>
		<th>EMAIL USUARIO</th>
		<th>NOMBRE USUARIO</th>
		<th>PASSWORD</th>
		<th>USUARIO</th>
		
	</tr>
	
	<%
		while(rs.next()){
	
	%>
	
	<tr>
		<td> <%= rs.getInt("cedula_usuario")  %> </td>
		<td> <%= rs.getString("email_usuario")  %> </td>
		<td> <%= rs.getString("nombre_usuario")  %> </td>
		<td> <%= rs.getString("password")  %> </td>
		<td> <%= rs.getString("usuario")  %> </td>
	</tr>
	<% } %>
	
</table>

</div>



</body>
</html>