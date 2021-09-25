<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CRUD_Producto</title>
<link rel="stylesheet" href="CSS/Menu.css">
</head>
<body>
	<%!String nombre="";
	int codigo,id;
	double iva,venta,compra;%>

	<%
	if (request.getParameter("codigo") != null) {
		codigo = Integer.parseInt(request.getParameter("codigo"));
		iva = Double.parseDouble(request.getParameter("iva"));
		id = Integer.parseInt(request.getParameter("id"));
		nombre = request.getParameter("nombre");
		compra = Double.parseDouble(request.getParameter("compra"));
		venta = Double.parseDouble(request.getParameter("venta"));
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
				<li id="usuario"><a class="menu" href="CRUD-Usuario.jsp">Usuarios</a></li>
				<li id="cliente"><a class="menu" href="CRUD-Cliente.jsp">Clientes</a></li>
				<li id="proveedor"><a class="menu" href="CRUD-Proveedor.jsp">Proveedores</a></li>
				<li id="producto"><a class="menu" href="CRUD-Producto.jsp">Productos</a></li>
				<li id="venta"><a class="menu" href="">Ventas</a></li>
				<li id="reporte"><a class="menu" href="">Reportes</a></li>
				<li class="cta" href="Menu.jsp">Sign Out</li>
			</ul>
		</header>
	</div>

	<div class="contenedor" id="container">
		<!-- FORM CLIENTE -->
		<div data-content class="all-wrapper" id="clientecontainer">
			<div class="formulario">
				<h3>CRUD Clientes</h3>
				<form action="Producto" method="POST">
					<p>
						<label>Codigo</label> <input type="text" name="codigo"
							value="<%=codigo%>" required>
					</p>
					<p>
						<label>IVA</label> <input type="text" name="iva"
							value="<%=iva%>">
					</p>
					<p>
						<label>NIT Proveedor</label> <input type="text" name="id"
							value="<%=id%>">
					</p>
					<p>
						<label>Nombre</label> <input type="text" name="nombre"
							value="<%=nombre%>">
					</p>
					<p>
						<label>Precio Compra</label> <input type="text" name="compra"
							value="<%=compra%>">
					</p>
					<p>
						<label>Precio Venta</label> <input type="text" name="venta"
							value="<%=venta%>">
					</p>
					<form action="Producto" method="POST" enctype="multipart/form-data">
						<p>
							<label>Nombre del Archivo</label> <input type="file"
								name="archivo" value="Examinar"
								accept="application/vnd.ms-excel">
						</p>
						<p class="block-cons">
							<button name="consultar">Consultar</button>
						</p>
						<p class="block">
							<input type="submit" name="cargar" value="Cargar Archivo">
							<button type="submit" name="cargar">Cargar</button>
						</p>
						<p class="block">
							<button name="actualizar">Actualizar</button>
						</p>
						<p class="block">
							<button type="" name="eliminar">Borrar</button>
						</p>
					</form>
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