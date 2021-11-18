<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<!doctype html>
	<html lang="en">

	<head>
		<!-- Required meta tags -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css"
			integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I" crossorigin="anonymous">
		<link href="https://fonts.googleapis.com/css2?family=Spartan:wght@300;600&display=swap" rel="stylesheet">
		<script src="https://kit.fontawesome.com/ffec4ec2ed.js" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="CSS/Login.css">

		<title>Login</title>
		<%
			response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");//Borrar directivas de memoria cache y anular algoritmos predeterminados para almacenar cache
			response.setHeader("Pragma", "no-cache");//Directivas compatibles con memorias cache
			response.setDateHeader("Expires", 0);//Proporciona Fecha y Hora para decir el tiempo de respuesta caduco
		%>
	</head>

	<body class="bg-dark">
		<!-- <c:if test="${success == 0}">
			<p id="error">Usuario o Contraseña Incorrecto</p>
		</c:if> -->
		<section>
			<!--g-0 quita el scroll de x-->
			<div class="row g-0">
				<div class="col-lg-7 d-none d-lg-block">
					<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
							<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
							<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
							<li data-target="#carouselExampleCaptions" data-slide-to="3"></li>
							<li data-target="#carouselExampleCaptions" data-slide-to="4"></li>
							<li data-target="#carouselExampleCaptions" data-slide-to="5"></li>
							<li data-target="#carouselExampleCaptions" data-slide-to="6"></li>
						</ol>
						<div class="carousel-inner">
							<div class="carousel-item img-1 min-vh-100 active">
							<img src="Recursos\img-1.jpg " width="1100" height="830" />
								<div class="carousel-caption d-none d-md-block">
									<h5 class="font-weight-bold">La más potente del mercado</h5>
									<a class="text-muted text-decoration-none">Visita nuestra tienda</a>
								</div>
							</div>
							<div class="carousel-item img-2 min-vh-100">
							<img src="Recursos\img-2.jpg" width="1100"height="830">
								<div class="carousel-caption d-none d-md-block">
									<h5 class="font-weight-bold">Descubre la nueva generación</h5>
									<a class="text-muted text-decoration-none">Visita nuestra tienda</a>
								</div>
							</div>
							<div class="carousel-item img-3 min-vh-100">
							<img src="Recursos\img-3.jpg" width="1100" height="830">
								<div class="carousel-caption d-none d-md-block">
									<h5 class="font-weight-bold">La más potente del mercado</h5>
									<a class="text-muted text-decoration-none">Visita nuestra tienda</a>
								</div>
							</div>
							<div class="carousel-item img-4 min-vh-100">
							<img src="Recursos\img-4.jpg" width="1100" height="830">
								<div class="carousel-caption d-none d-md-block">
									<h5 class="font-weight-bold">Descubre la nueva generación</h5>
									<a class="text-muted text-decoration-none">Visita nuestra tienda</a>
								</div>
							</div>
						</div>
						<a class="carousel-control-prev" href="#carouselExampleCaptions" role="button"
							data-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a>
						<a class="carousel-control-next" href="#carouselExampleCaptions" role="button"
							data-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div>
				<div class="col-lg-5 d-flex flex-column align-items-end min-vh-100">
					<div class="px-lg-5 pt-lg-4 pb-lg-3 p-4 w-100 mb-auto">
						<img src="Recursos\logo-tienda.png" class="img-fluid logo">
					</div>
					<div class="px-lg-5 py-lg-4 p-4 w-100 align-items-self-center">
						<h1 class="font-weight-bold mb-4">Bienvenido de vuelta</h1>
						<form class="mb-5" action="Control" method="POST">
							<div class="mb-4">
								<label for="exampleInputEmail1" class="form-label font-weight-bold">Usuario</label>
								<input type="text" name="user" class="form-control bg-dark-x border-0"
									placeholder="Ingresa tu usuario" id="exampleInputEmail1"
									aria-describedby="emailHelp" required>
								<!--<div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>-->
							</div>
							<div class="mb-4">
								<label for="exampleInputPassword1"
									class="form-label font-weight-bold">Contraseña</label>
								<input type="password" name="pass" class="form-control bg-dark-x border-0 mb-2"
									placeholder="Ingresa tu contraseña" id="exampleInputPassword1" required>
							</div>
							<!--<div class="mb-3 form-check">
                          <input type="checkbox" class="form-check-input" id="exampleCheck1">
                          <label class="form-check-label" for="exampleCheck1">Check me out</label>
                        </div>-->
							<button type="submit" name="enviar" class="btn btn-primary w-100">Iniciar sesión</button>
						</form>

						<!--<p class="font-weight-bold text-center text-muted">O inicia sesión con</p>
                    <div class="d-flex justify-content-around">
                        <button type="submit" class="btn btn-outline-light flex-grow-1 mr-2"><i
                                class="fab fa-google lead mr-2"></i>Google</button>
                        <button type="submit" class="btn btn-outline-light flex-grow-1 ml-2"><i
                                class="fab fa-facebook-f lead mr-2"></i>Facebook</button>
                    </div>-->
					</div>
					<div class="text-center px-lg-5 pt-lg-3 pb-lg-4 p-4 w-100 mt-auto">
						<p class="d-inline-block mb-0">&copy; 2021 Copyright: Technical System</p>
						<!--<a href=""
                        class="text-light font-weight-bold text-decoration-none">Crea una ahora</a>-->
					</div>
				</div>
			</div>
		</section>

		<!-- Optional JavaScript; choose one of the two! -->

		<!-- Option 1: Bootstrap Bundle with Popper -->
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
			integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
			crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"
			integrity="sha384-oesi62hOLfzrys4LxRF63OJCXdXDipiYWBnvTl9Y9/TRlw5xlKIEHpNyvvDShgf/"
			crossorigin="anonymous"></script>

		<!-- Option 2: Separate Popper and Bootstrap JS -->
		<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
	</body>

	</html>