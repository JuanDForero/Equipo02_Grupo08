<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CRUD-Cliente</title>
<link rel="stylesheet" href="CSS/Menu.css">
</head>
<body>
	<%!String direccion = "", email = "", nombre = "", telefono = "";
	int id;%>

	<%
	if (request.getParameter("id") != null) {
		id = Integer.parseInt(request.getParameter("id"));
		direccion = request.getParameter("direccion");
		email = request.getParameter("email");
		nombre = request.getParameter("nombre");
		telefono = request.getParameter("telefono");
	}

	if (request.getParameter("men") != null) {
		String mensaje = request.getParameter("men");
		out.print("<script type='text/javascript'>alert('" + mensaje + "');</script>");
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
				<li id="venta"><a class="menu" href="">Ventas</a></li>
				<li id="reporte"><a class="menu" href="">Reportes</a></li>
				<li class="cta">Sign Out</li>
			</ul>
		</header>
	</div>

	<div class="contenedor" id="container">
		<!-- FORM CLIENTE -->
		<div data-content class="all-wrapper" id="clientecontainer">
			<div class="formulario">
				<h3>CRUD Clientes</h3>
				<form action="Cliente" method="POST">
					<p>
						<label>Cédula</label> <input type="text" name="id" value="<%=id%>"
							required>
					</p>
					<p>
						<label>Teléfono</label> <input type="tel" name="cellphone"
							value="<%=telefono%>">
					</p>
					<p>
						<label>Nombre Completo</label> <input type="text" name="fullname"
							value="<%=nombre%>">
					</p>
					<p>
						<label>Correo Electrónico</label> <input type="email" name="email"
							value="<%=email%>">
					</p>
					<p>
						<label>Dirección</label> <input type="text" name="direccion"
							value="<%=direccion%>">
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