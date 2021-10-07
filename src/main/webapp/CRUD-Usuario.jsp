<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CRUD-Usuario</title>
<link rel="stylesheet" href="CSS/Menu.css">
</head>
<body>
	<%!String email = "", nombre = "", pass = "", usuario = "";
	int id = 0;%>

	<%
	if (request.getParameter("id") != null) {
		id = Integer.parseInt(request.getParameter("id"));
		email = request.getParameter("email");
		nombre = request.getParameter("nombre");
		pass = request.getParameter("pass");
		usuario = request.getParameter("usuario");
	}

	if (request.getParameter("men") != null) {
		String mensaje = request.getParameter("men");
		out.print("<script type='text/javascript'>alert('" + mensaje + "');</script>");
		String email = "", nombre = "", pass = "", usuario = "";
		int id = 0;
	}
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
		<!-- FORM USUARIO -->
		<div data-content class="all-wrapper" id="usuariocontainer">
			<div class="formulario">
				<h3>CRUD Usuarios</h3>
				<form action="Usuario" method="post">
					<p>
						<label>Cédula</label> <input type="text" name="id" value="<%=id%>"
							required>
					</p>
					<p>
						<label>Usuario</label> <input type="text" name="user"
							value="<%=usuario%>">
					</p>
					<p>
						<label>Nombre Completo</label> <input type="text" name="fullname"
							value="<%=nombre%>">
					</p>
					<p>
						<label>Contraseña</label> <input type="password" name="pass"
							value="<%=pass%>">
					</p>
					<p>
						<label>Correo Electrónico</label> <input type="email" name="email"
							value="<%=email%>">
					</p>
					<p class="block-cons">
						<button name="consultar">Consultar</button>
					</p>
					<p class="block">
						<button type="submit" name="insertar">Crear</button>
					</p>
					<p class="block">
						<button name="actualizar">Actualizar</button>
					</p>
					<p class="block">
						<button type="" name="eliminar">Borrar</button>
					</p>
				</form>
			</div>
			<!-- <div class="usuario-info"></div> -->
		</div>
	</div>

	<script>
        /*Header fijo*/
        var header = document.getElementById('Header')

        window.addEventListener('scroll', ()=>{
            var scroll = window.scrollY
            if(scroll>10){
                header.style.backgroundColor = '#121212'
            }else{
                header.style.backgroundColor = 'transparent'
            }
        })
    </script>
</body>
</html>