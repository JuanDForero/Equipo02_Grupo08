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
	<%!String nombre="", name_prod = "",name_prod2 = "",name_prod3 = "";
    int id=0, consec=0, cod_prod=0,cod_prod2=0,cod_prod3=0, cant=0, cant2=0, cant3=0;
    double valor=0,valor2=0,valor3=0,venta=0,iva=0,iva2=0,iva3=0,total=0,prec=0,prec2=0,prec3=0,totalconiva=0;
    %>
	<%
	if(request.getParameter("nombre")!=null){
		id=Integer.parseInt(request.getParameter("id"));
		nombre=request.getParameter("nombre");
	}
	
	if(request.getParameter("name_prod")!=null )
	{
		cod_prod=Integer.parseInt(request.getParameter("cod_prod"));
		name_prod=request.getParameter("name_prod");
		prec = Double.parseDouble(request.getParameter("prec"));
		iva = Double.parseDouble(request.getParameter("iva"));
	}
	
	if(request.getParameter("name_prod2")!=null )
	{
		cod_prod2=Integer.parseInt(request.getParameter("cod_prod2"));
		name_prod2=request.getParameter("name_prod2");
		prec2 = Double.parseDouble(request.getParameter("prec2"));
		iva2 = Double.parseDouble(request.getParameter("iva2"));
						
	}
	
	if(request.getParameter("name_prod3")!=null )
	{
		cod_prod3=Integer.parseInt(request.getParameter("cod_prod3"));
		name_prod3=request.getParameter("name_prod3");
		prec3 = Double.parseDouble(request.getParameter("prec3"));
		iva3 = Double.parseDouble(request.getParameter("iva3"));
						
	}
	
	if(request.getParameter("valor")!=null ){
		valor = Double.parseDouble(request.getParameter("valor"));
	}

	if(request.getParameter("valor")!=null || request.getParameter("valor2")!=null || request.getParameter("valor3")!=null){
		
		cant =Integer.parseInt(request.getParameter("cant"));
		valor =Double.parseDouble(request.getParameter("valor"));
		
		cant2 =Integer.parseInt(request.getParameter("cant2"));
		valor2 =Double.parseDouble(request.getParameter("valor2"));
		
		cant3 =Integer.parseInt(request.getParameter("cant3"));
		valor3 =Double.parseDouble(request.getParameter("valor3"));
		
		venta=Double.parseDouble(request.getParameter("venta"));
		
		total = Double.parseDouble(request.getParameter("total"));
        totalconiva = Double.parseDouble(request.getParameter("totalconiva"));
        
        consec = Integer.parseInt(request.getParameter("consec")) ;
	}
	
	if(request.getParameter("men")!=null){
	String mensaje=request.getParameter("men");
	out.print("<script type='text/javascript'>alert('"+mensaje+"');</script>");	
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
				<form action="Detalle" method="POST">
					<div class="cliente">
						<p>
						<label>Cédula</label> <input type="text" name="id"
							value="<%=id%>" required>
						</p>
	
						<p class="block">
							<button name="consultarcli">Consultar</button>
						</p>
	
						<p>
							<label>Cliente</label> <input type="text" name="name"
								value="<%=nombre%>">
						</p>
	
						<p>
							<label>Consec</label> <input type="text" name="consec"
								value="<%=consec%>">
						</p>
					</div>
					
					<div class="producto">
					<!--11111111111111111111111111111111111111111111111111111111111111111111111111111111-->
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
							<label>Precio</label> <input type="text" name="prec"
								value="<%=prec%>">
						</p>
						
						<p>
							<label>Iva</label> <input type="text" name="iva"
								value="<%=iva%>">
						</p>
						
						<p>
							<label>Valor Total</label> <input type="text" name="valor"
								value="<%=valor%>">
						</p>
						
					<!--222222222222222222222222222222222222222222222222222222222222222222222222-->
						<p>
							<label>Cod.Producto</label> <input type="text" name="cod_prod2"
								value="<%=cod_prod2%>">
						</p>
	
						<p class="block">
							<button name="consultar2">Consultar</button>
						</p>
	
						<p>
							<label>Nombre Producto</label> <input type="text"
								name="name_prod2" value="<%=name_prod2%>">
						</p>
	
						<p>
							<label>Cant</label> <input type="text" name="cant2"
								value="<%=cant2%>">
						</p>
						
						<p>
							<label>Precio</label> <input type="text" name="prec2"
								value="<%=prec2%>">
						</p>
						
						<p>
							<label>Iva</label> <input type="text" name="iva2"
								value="<%=iva2%>">
						</p>
	
						<p>
							<label>Valor Total</label> <input type="text" name="valor2"
								value="<%=valor2%>">
						</p>
				<!--333333333333333333333333333333333333333333333333333333333333333333333333333333333-->
						<p>
							<label>Cod.Producto</label> <input type="text" name="cod_prod3"
								value="<%=cod_prod3%>">
						</p>
	
						<p class="block">
							<button name="consultar3">Consultar</button>
						</p>
	
						<p>
							<label>Nombre Producto</label> <input type="text"
								name="name_prod3" value="<%=name_prod3%>">
						</p>
	
						<p>
							<label>Cant</label> <input type="text" name="cant3"
								value="<%=cant3%>">
						</p>
	
						<p>
							<label>Precio</label> <input type="text" name="prec3"
								value="<%=prec3%>">
						</p>
						
						<p>
							<label>Iva</label> <input type="text" name="iva3"
								value="<%=iva3%>">
						</p>
						
						<p>
							<label>Valor Total</label> <input type="text" name="valor3"
								value="<%=valor3%>">
						</p>
	
						<p class="block-input">
							<label>Total Venta</label> <input type="text" name="venta"
								value="<%=venta%>">
						</p>
						
						<p class="block">
							<button type="reset" name="limpiar">Limpiar Casillas</button>
						</p>
	
						<p class="block-input">
							<label>Total IVA</label> <input type="text" name="total"
								value="<%=total%>">
						</p>
					
						<p class="block">
							<button type="submit" name="confirmar">Confirmar</button>
						</p>
						
						<p class="block-input">
							<label>Total con IVA</label> <input type="text" name="totalconiva"
								value="<%=totalconiva%>">
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