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
				<li id="reporte"><a class="menu" href="CRUD-Reporte.jsp">Reportes</a></li>
				<li class="cta"><a class="menu" href="index.jsp"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="0.9rem" fill="currentColor" class="bi bi-box-arrow-right" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z"/>
  <path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
</svg>  Sign Out</a></li>
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
							<button name="consultarcli"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="0.9rem" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
</svg>  Consultar</button>
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
							<button name="consultar"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="0.9rem" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
</svg>  Consultar</button>
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
							<button name="consultar2"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="0.9rem" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
</svg>  Consultar</button>
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
							<button name="consultar3"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="0.9rem" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
</svg>  Consultar</button>
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
							<button type="submit" name="confirmar"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/>
</svg>  Confirmar</button>
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