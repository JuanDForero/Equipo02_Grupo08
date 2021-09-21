<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Menu Principal</title>
<link rel="stylesheet" href="CSS/Menu.css">
</head>
<body>
	<div>
		<header id=header>
			<img src="Recursos/logo-tienda.png" alt="" class="logo">

			<!-- Menu Header -->
			<ul class="main-menu">
				<li id="usuario"><a class="menu" href="CRUD-Usuario.jsp" >Usuarios</a>
				</li>
				<li id="cliente"><a class="menu" href="CRUD-Cliente.jsp" >Clientes</a>
				</li>
				<li id="proveedor"><a class="menu" href="CRUD-Proveedor.jsp" >Proveedores</a>
				</li>
				<li id="producto"><a class="menu" href="" >Productos</a></li>
				<li id="venta"><a class="menu" href="" >Ventas</a></li>
				<li id="reporte"><a class="menu" href="" >Reportes</a></li>
				<li class="cta">Sign Out</li>
			</ul>
		</header>
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