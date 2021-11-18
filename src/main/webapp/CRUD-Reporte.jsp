<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard</title>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");//Borrar directivas de memoria cache y anular algoritmos predeterminados para almacenar cache
            response.setHeader("Pragma", "no-cache");//Directivas compatibles con memorias cache
            response.setDateHeader("Expires", 0);//Proporciona Fecha y Hora para decir el tiempo de respuesta caduco
        %>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="CSS/dash.css">
        <link rel="stylesheet" href="CSS/style-reportes.css">
    </head>

    <body>

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
                            <div class="modal">
                                <div class="modal__container">
                                    <div class="modal__featured">

                                        <div class="modal__circle"></div>
                                        <img src="" class="modal__product" />
                                    </div>
                                    <div class="modal__content">
                                        <h2>Reportes</h2>

                                        <form action="Reporte" method="POST">

                                            <button type="submit" name="stock" id="btn1" class="button">

                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                    fill="currentColor" class="bi bi-file-earmark-bar-graph"
                                                    viewBox="0 0 16 16">
                                                    <path
                                                        d="M10 13.5a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-6a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v6zm-2.5.5a.5.5 0 0 1-.5-.5v-4a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-1zm-3 0a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5h-1z" />
                                                    <path
                                                        d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5v2z" />
                                                </svg>StOCK</button>



                                            <button type="submit" name="listaU" id="btn2" class="button">

                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                    fill="currentColor" class="bi bi-file-earmark-person-fill"
                                                    viewBox="0 0 16 16">
                                                    <path
                                                        d="M9.293 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.707A1 1 0 0 0 13.707 4L10 .293A1 1 0 0 0 9.293 0zM9.5 3.5v-2l3 3h-2a1 1 0 0 1-1-1zM11 8a3 3 0 1 1-6 0 3 3 0 0 1 6 0zm2 5.755V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1v-.245S4 12 8 12s5 1.755 5 1.755z" />
                                                </svg>LISTADO DE USUARIOS</button>



                                            <button type="submit" name="listaC" id="btn3" class="button">

                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                    fill="currentColor" class="bi bi-file-earmark-person-fill"
                                                    viewBox="0 0 16 16">
                                                    <path
                                                        d="M9.293 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.707A1 1 0 0 0 13.707 4L10 .293A1 1 0 0 0 9.293 0zM9.5 3.5v-2l3 3h-2a1 1 0 0 1-1-1zM11 8a3 3 0 1 1-6 0 3 3 0 0 1 6 0zm2 5.755V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1v-.245S4 12 8 12s5 1.755 5 1.755z" />
                                                </svg>LISTADO DE CLIENTES</button>



                                            <button type="submit" name="ventasC" id="btn4" class="button">

                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                    fill="currentColor" class="bi bi-cash" viewBox="0 0 16 16">
                                                    <path d="M8 10a2 2 0 1 0 0-4 2 2 0 0 0 0 4z" />
                                                    <path
                                                        d="M0 4a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1V4zm3 0a2 2 0 0 1-2 2v4a2 2 0 0 1 2 2h10a2 2 0 0 1 2-2V6a2 2 0 0 1-2-2H3z" />
                                                </svg>VENTAS POR CLIENTE</button>



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