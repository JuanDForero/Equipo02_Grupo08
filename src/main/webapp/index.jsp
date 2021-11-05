<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bienvenida</title>
<link rel="stylesheet" href="CSS/Login.css">
</head>
<body>
	<section></section>
	<section class="login">
		<form action="Control" class="login-form" method="POST">
			<h1>
				Bienvenidos a la <br> Tienda Genérica
			</h1>
			
			<span> <label  for="usuario" > <svg xmlns="http://www.w3.org/2000/svg" width="16" height="3 rem" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
</svg> Usuario</label> <input  type="text"
				name="user" class="text-body" autofocus id="usuario" 
				autocomlete="off" required >
			</span> <span> <label for="contraseña"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-lock2" viewBox="0 0 16 16">
  <path d="M10 7v1.076c.54.166 1 .597 1 1.224v2.4c0 .816-.781 1.3-1.5 1.3h-3c-.719 0-1.5-.484-1.5-1.3V9.3c0-.627.46-1.058 1-1.224V7a2 2 0 1 1 4 0zM7 7v1h2V7a1 1 0 0 0-2 0z"/>
  <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5v2z"/>
</svg>  Contraseña</label> <input
				type="password" name="pass" class="text-body" id="contraseña"
				autocomlete="off" required>
			</span> <input type="submit" name="enviar" class="submit" value="Aceptar">
			<input type="reset" class="cancel" value="Cancelar">
		</form>
	</section>
	<!-- pr1 -->
	<script>
		/*Despliegue del "placehoplder"*/
		var inputs = document
				.querySelectorAll('input[type=text], input[type=password]');

		for (i = 0; i < inputs.length; i++) {
			var input = inputs[i];
			if (input.value.trim() !== '') {
				input.parentNode.classList.add('input-filled');
			}

			input.addEventListener('focus', onFocus);
			input.addEventListener('blur', onBlur);

		}

		function onFocus(e) {
			e.target.parentNode.classList.add('input-filled');
		}

		function onBlur(e) {
			if (e.target.value.trim() === '') {
				e.target.parentNode.classList.remove('input-filled');
			} else {
				if (e.target.value.length > 1) {
					e.target.parentNode.classList.add('input-filled');
				}
			}
		}
	</script>

</body>
</html>