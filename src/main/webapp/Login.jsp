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
            <h1>Bienvenidos a la <br> Tienda Genérica</h1>
            <span>
                <label for="usuario">Usuario</label>
                <input type="text" name="user" class="text-body" autofocus id="usuario" autocomlete="off" required>
            </span>
            <span>
                <label for="contraseña">Contraseña</label>
                <input type="password" name="pass" class="text-body" id="contraseña" autocomlete="off" required>
            </span>

            <input type="submit" name="enviar" class="submit" value="Aceptar">
            <input type="reset" class="cancel" value="Cancelar">
        </form>
    </section>

    <script>
    	/*Despliegue del "placehoplder"*/
        var inputs = document.querySelectorAll('input[type=text], input[type=password]');

        for (i = 0; i < inputs.length; i++){
            var input = inputs[i];
            if(input.value.trim() !== ''){
                input.parentNode.classList.add('input-filled');
            }

            input.addEventListener('focus', onFocus);
            input.addEventListener('blur', onBlur);

        }
        
            function onFocus(e){
                e.target.parentNode.classList.add('input-filled');
            }

            function onBlur(e){
                if(e.target.value.trim() === ''){
                    e.target.parentNode.classList.remove('input-filled');
                }else{
                    if(e.target.value.length > 1){
                        e.target.parentNode.classList.add('input-filled');
                    }
                }
            }

    </script>

</body>
</html>