<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard</title>
        <%
            response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");//Borrar directivas de memoria cache y anular algoritmos predeterminados para almacenar cache
            response.setHeader("Pragma", "no-cache");//Directivas compatibles con memorias cache
            response.setDateHeader("Expires", 0);//Proporciona Fecha y Hora para decir el tiempo de respuesta caduco
        %>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="CSS/dash.css">
        <link rel="stylesheet" href="CSS/style.css">
    </head>

    <body>

        <!-- <%=request.getSession().getAttribute("nombre")%> -->
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
        <div class="container-fluid">
            <div class="row justify-content-center align-content-center">
                <div class="col-8 barra">
                    <!--<h4 class="text-light">Logo</h4>-->
                    <img src="Recursos/logo-tienda.png" class="logo">
                </div>
                <div class="col-4 text-end barra">
                    <ul class="navbar-nav mr-auto">
                        <li>
                            <a href="#" class="px-3 text-light perfil dropdown-toogle" id="navbarDropdown" role="button"
                                data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-user-circle user"></i>
                            </a>

                            <div class="dropdown-menu" aria-labelledby="navbar-dropdown">
                                <a class="dropdown-item menuperfil cerrar" href="index.jsp">
                                    <i class="fas fa-sign-out-alt m-1"></i>Salir
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row">
                <div class="barra-lateral col-12 col-sm-auto">
                    <nav class="menu d-flex d-sm-block justify-content-center flex-wrap">
                        <a href="CRUD-Usuario.jsp"><i class="fas fa-users"></i><span>Usuarios</span></a>
                        <a href="CRUD-Cliente.jsp"><i class="fas fa-hand-holding-usd"></i><span>Clientes</span></a>
                        <a href="CRUD-Proveedor.jsp"><i class="fas fa-clipboard"></i><span>Proveedores</span></a>
                        <a href="CRUD-Producto.jsp"><i class="fas fa-memory"></i><span>Productos</span></a>
                        <a href="CRUD-Venta.jsp"><i class="fas fa-cart-arrow-down"></i><span>Ventas</span></a>
                        <a href="CRUD-Reporte.jsp"><i class="fas fa-chart-bar"></i><span>Reportes</span></a>
                    </nav>
                </div>
                <main class="main col">
                    <div class="row justify-content-center align-content-center text-center">
                        <div class="columna col-lg-6">
                            <!-- Contenido -->
                            <!-- partial:index.partial.html -->
                            <div class="modal">
                                <div class="modal__container">
                                    <div class="modal__featured">

                                        <div class="modal__circle"></div>
                                        <img src="" class="modal__product" />
                                    </div>
                                    <div class="modal__content">
                                        <h2>CRUD Usuarios</h2>

                                        <form action="Usuario" method="post">
                                            <ul class="form-list">
                                                <li class="form-list__row">
                                                    <br>
                                                    <div class="form-list__row">
                                                        <div class="input-group">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text"><svg
                                                                        xmlns="http://www.w3.org/2000/svg" width="16"
                                                                        height="16" fill="currentColor"
                                                                        class="bi bi-credit-card-2-front"
                                                                        viewBox="0 0 16 16">
                                                                        <path
                                                                            d="M14 3a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1h12zM2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H2z" />
                                                                        <path
                                                                            d="M2 5.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1zm0 3a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5z" />
                                                                    </svg></span>

                                                            </div>
                                                            <input type="text" class="form-control" name="id" value="<%=id%>" placeholder="Cedula" />

                                                        </div>

                                                    </div>

                                                </li>


                                                <li class="form-list__row">
                                                    <br>
                                                    <div class="form-list__row">
                                                        <div class="input-group">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text"><svg
                                                                        xmlns="http://www.w3.org/2000/svg" width="16"
                                                                        height="16" fill="currentColor"
                                                                        class="bi bi-person-circle" viewBox="0 0 16 16">
                                                                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                                                                        <path fill-rule="evenodd"
                                                                            d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                                                                    </svg></span>

                                                            </div>
                                                            <input type="text" class="form-control" name="fullname" value="<%=nombre%>" placeholder="Nombre" />

                                                        </div>

                                                    </div>

                                                </li>


                                                <li class="form-list__row">
                                                    <br>
                                                    <div class="form-list__row">
                                                        <div class="input-group">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text"><svg
                                                                        xmlns="http://www.w3.org/2000/svg" width="16"
                                                                        height="16" fill="currentColor"
                                                                        class="bi bi-envelope-fill" viewBox="0 0 16 16">
                                                                        <path
                                                                            d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555ZM0 4.697v7.104l5.803-3.558L0 4.697ZM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757Zm3.436-.586L16 11.801V4.697l-5.803 3.546Z" />
                                                                    </svg></span>

                                                            </div>
                                                            <input type="text" class="form-control" name="email" value="<%=email%>" placeholder="Correo" />

                                                        </div>

                                                    </div>

                                                </li>


                                                <li class="form-list__row">
                                                    <br>
                                                    <div class="form-list__row">
                                                        <div class="input-group">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text"><svg
                                                                        xmlns="http://www.w3.org/2000/svg" width="16"
                                                                        height="16" fill="currentColor"
                                                                        class="bi bi-person-badge-fill"
                                                                        viewBox="0 0 16 16">
                                                                        <path
                                                                            d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2zm4.5 0a.5.5 0 0 0 0 1h3a.5.5 0 0 0 0-1h-3zM8 11a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm5 2.755C12.146 12.825 10.623 12 8 12s-4.146.826-5 1.755V14a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1v-.245z" />
                                                                    </svg></span>

                                                            </div>
                                                            <input type="text" class="form-control" name="user" value="<%=usuario%>" placeholder="Usuario" />

                                                        </div>

                                                    </div>

                                                </li>


                                                <li class="form-list__row">
                                                    <br>
                                                    <div class="form-list__row">
                                                        <div class="input-group">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text"><svg
                                                                        xmlns="http://www.w3.org/2000/svg" width="16"
                                                                        height="16" fill="currentColor"
                                                                        class="bi bi-file-lock2-fill"
                                                                        viewBox="0 0 16 16">
                                                                        <path d="M7 6a1 1 0 0 1 2 0v1H7V6z" />
                                                                        <path
                                                                            d="M12 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm-2 6v1.076c.54.166 1 .597 1 1.224v2.4c0 .816-.781 1.3-1.5 1.3h-3c-.719 0-1.5-.484-1.5-1.3V8.3c0-.627.46-1.058 1-1.224V6a2 2 0 1 1 4 0z" />
                                                                    </svg></span>

                                                            </div>
                                                            <input type="password" class="form-control" name="pass" value="<%=pass%>" placeholder="Contraseña" />

                                                        </div>

                                                    </div>

                                                </li>


                                                <li>
                                                    <button name="consultar" type="submit" id="btn1" class="button">

                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                            fill="currentColor" class="bi bi-search"
                                                            viewBox="0 0 16 16">
                                                            <path
                                                                d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                                                        </svg>Consultar</button>
                                                </li>

                                                <li>
                                                    <button type="submit" name="insertar" id="btn2" class="button">

                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                            fill="currentColor" class="bi bi-pencil-square"
                                                            viewBox="0 0 16 16">
                                                            <path
                                                                d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                                                            <path fill-rule="evenodd"
                                                                d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                                                        </svg>Crear</button>
                                                </li>

                                                <li>
                                                    <button type="submit" name="actualizar" id="btn3" class="button">

                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                            fill="currentColor" class="bi bi-arrow-clockwise"
                                                            viewBox="0 0 16 16">
                                                            <path fill-rule="evenodd"
                                                                d="M8 3a5 5 0 1 0 4.546 2.914.5.5 0 0 1 .908-.417A6 6 0 1 1 8 2v1z" />
                                                            <path
                                                                d="M8 4.466V.534a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384L8.41 4.658A.25.25 0 0 1 8 4.466z" />
                                                        </svg>Actualizar</button>
                                                </li>

                                                <li>
                                                    <button type="submit" name="eliminar" id="btn4" class="btn btn-danger button">

                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                            fill="currentColor" class="bi bi-trash2"
                                                            viewBox="0 0 16 16">
                                                            <path
                                                                d="M14 3a.702.702 0 0 1-.037.225l-1.684 10.104A2 2 0 0 1 10.305 15H5.694a2 2 0 0 1-1.973-1.671L2.037 3.225A.703.703 0 0 1 2 3c0-1.105 2.686-2 6-2s6 .895 6 2zM3.215 4.207l1.493 8.957a1 1 0 0 0 .986.836h4.612a1 1 0 0 0 .986-.836l1.493-8.957C11.69 4.689 9.954 5 8 5c-1.954 0-3.69-.311-4.785-.793z" />
                                                        </svg>Borrar</button>
                                                </li>


                                            </ul>
                                        </form>
                                    </div> <!-- END: .modal__content -->
                                </div> <!-- END: .modal__container -->
                            </div> <!-- END: .modal -->
                            <!-- partial -->
                            <footer class="sticky-footer bg-light ">

                            <div class="container my-auto">
                          
                              <div class="copyright text-center my-auto"> 
                          
                                <span> &copy; 2021 Copyright: Technycal System  </span>
                          
                              </div>
                          
                            </div>
                          
                          </footer>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
        <script src="https://kit.fontawesome.com/646c794df3.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    </body>

    </html>