<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CRUD-Venta</title>
<link rel="stylesheet" href="CSS/Venta.css">
</head>
<body>
	<%!String id = "", name = "", consec = "", cod_prod = "", name_prod = "", cant = "", valor = "", venta = "",
			total = "", iva = "";%>

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
				<form action="" method="POST">
					<div class="cliente">
						<p>
						<label>Cédula</label> <input type="text" name="id"
							value="<%=id%>" required>
						</p>
	
						<p class="block">
							<button name="consultar">Consultar</button>
						</p>
	
						<p>
							<label>Cliente</label> <input type="text" name="name"
								value="<%=name%>" required>
						</p>
	
						<p>
							<label>Consec</label> <input type="text" name="consec"
								value="<%=consec%>">
						</p>
					</div>
					
					<div class="producto">
						<p>
							<label>Cod.Producto</label> <input type="text" name="cod_prod"
								value="<%=cod_prod%>">
						</p>
	
						<p class="block">
							<button name="consultar">Consultar</button>
						</p>
	
						<p>
							<label>Nombre Producto</label> <input type="text"
								name="name_prod" value="<%=name_prod%>">
						</p>
	
						<p>
							<label>Cant</label> <input type="text" name="cant"
								value="<%=cant%>">
						</p>
	
						<p>
							<label>Valor Total</label> <input type="text" name="valor"
								value="<%=valor%>">
						</p>
						
						<p>
							<label>Cod.Producto</label> <input type="text" name="cod_prod"
								value="<%=cod_prod%>">
						</p>
	
						<p class="block">
							<button name="consultar">Consultar</button>
						</p>
	
						<p>
							<label>Nombre Producto</label> <input type="text"
								name="name_prod" value="<%=name_prod%>">
						</p>
	
						<p>
							<label>Cant</label> <input type="text" name="cant"
								value="<%=cant%>">
						</p>
	
						<p>
							<label>Valor Total</label> <input type="text" name="valor"
								value="<%=valor%>">
						</p>
						
						<p>
							<label>Cod.Producto</label> <input type="text" name="cod_prod"
								value="<%=cod_prod%>">
						</p>
	
						<p class="block">
							<button name="consultar">Consultar</button>
						</p>
	
						<p>
							<label>Nombre Producto</label> <input type="text"
								name="name_prod" value="<%=name_prod%>">
						</p>
	
						<p>
							<label>Cant</label> <input type="text" name="cant"
								value="<%=cant%>">
						</p>
	
						<p>
							<label>Valor Total</label> <input type="text" name="valor"
								value="<%=valor%>">
						</p>
	
						<p class="block-input">
							<label>Total Venta</label> <input type="text" name="venta"
								value="<%=venta%>">
						</p>
	
						<p class="block-input">
							<label>Total IVA</label> <input type="text" name="total"
								value="<%=total%>">
						</p>
						
						<p class="block">
							<button type="submit" name="insertar">Confirmar</button>
						</p>
	
						<p class="block-input">
							<label>Total con IVA</label> <input type="text" name="iva"
								value="<%=iva%>">
						</p>
	
					</div>
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