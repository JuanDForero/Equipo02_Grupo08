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
        <link rel="stylesheet" href="CSS/style-ventas.css">
    </head>

    <body>
        <%!String nombre = "", name_prod = "", name_prod2 = "", name_prod3 = "";
            int id = 0, consec = 0, cod_prod = 0, cod_prod2 = 0, cod_prod3 = 0, cant = 0, cant2 = 0, cant3 = 0;
            double valor = 0, valor2 = 0, valor3 = 0, venta = 0, iva = 0, iva2 = 0, iva3 = 0, total = 0, prec = 0, prec2 = 0,
            prec3 = 0, totalconiva = 0;%>
        <%
            if (request.getParameter("nombre") != null) {
                id = Integer.parseInt(request.getParameter("id"));
                nombre = request.getParameter("nombre");
            }

            if (request.getParameter("name_prod") != null) {
                cod_prod = Integer.parseInt(request.getParameter("cod_prod"));
                name_prod = request.getParameter("name_prod");
                prec = Double.parseDouble(request.getParameter("prec"));
                iva = Double.parseDouble(request.getParameter("iva"));
            }

            if (request.getParameter("name_prod2") != null) {
                cod_prod2 = Integer.parseInt(request.getParameter("cod_prod2"));
                name_prod2 = request.getParameter("name_prod2");
                prec2 = Double.parseDouble(request.getParameter("prec2"));
                iva2 = Double.parseDouble(request.getParameter("iva2"));

            }

            if (request.getParameter("name_prod3") != null) {
                cod_prod3 = Integer.parseInt(request.getParameter("cod_prod3"));
                name_prod3 = request.getParameter("name_prod3");
                prec3 = Double.parseDouble(request.getParameter("prec3"));
                iva3 = Double.parseDouble(request.getParameter("iva3"));

            }

            if (request.getParameter("valor") != null) {
                valor = Double.parseDouble(request.getParameter("valor"));
            }

            if (request.getParameter("valor") != null || request.getParameter("valor2") != null
                    || request.getParameter("valor3") != null) {

                cant = Integer.parseInt(request.getParameter("cant"));
                valor = Double.parseDouble(request.getParameter("valor"));

                cant2 = Integer.parseInt(request.getParameter("cant2"));
                valor2 = Double.parseDouble(request.getParameter("valor2"));

                cant3 = Integer.parseInt(request.getParameter("cant3"));
                valor3 = Double.parseDouble(request.getParameter("valor3"));

                venta = Double.parseDouble(request.getParameter("venta"));

                total = Double.parseDouble(request.getParameter("total"));
                totalconiva = Double.parseDouble(request.getParameter("totalconiva"));

                consec = Integer.parseInt(request.getParameter("consec"));
            }

            if (request.getParameter("men") != null) {
                String mensaje = request.getParameter("men");
                out.print("<script type='text/javascript'>alert('" + mensaje + "');</script>");
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
                            <div class="modal">
                                <div class="modal__container">
                                    <div class="modal__featured">

                                        <div class="modal__circle"></div>
                                        <img src="" class="modal__product" />
                                    </div>

                                    <div class="modal__content">
                                        <h2>CRUD Ventas</h2>

                                        <form action="Detalle" method="POST">
                                            <ul class="form-list">
                                                <li class="form-list__row">
                                                    <br>
                                                    <div class="form-list__row">
                                                        <div class="input-group" id="inp1">
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
                                                            <input type="text" class="form-control" name="id"
                                                                value="<%=id%>" placeholder="Cedula" />

                                                        </div>

                                                    </div>

                                                </li>


                                                <li class="form-list__row">
                                                    <br>
                                                    <div class="form-list__row">
                                                        <div class="input-group" id="inp2">
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
                                                            <input type="text" class="form-control" name="name"
                                                                value="<%=nombre%>" placeholder="Cliente" />

                                                        </div>

                                                    </div>

                                                </li>


                                                <li class="form-list__row">
                                                    <br>
                                                    <div class="form-list__row">
                                                        <div class="input-group" id="inp3">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text"><svg
                                                                        xmlns="http://www.w3.org/2000/svg" width="16"
                                                                        height="16" fill="currentColor"
                                                                        class="bi bi-upc-scan" viewBox="0 0 16 16">
                                                                        <path
                                                                            d="M1.5 1a.5.5 0 0 0-.5.5v3a.5.5 0 0 1-1 0v-3A1.5 1.5 0 0 1 1.5 0h3a.5.5 0 0 1 0 1h-3zM11 .5a.5.5 0 0 1 .5-.5h3A1.5 1.5 0 0 1 16 1.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 1-.5-.5zM.5 11a.5.5 0 0 1 .5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 1 0 1h-3A1.5 1.5 0 0 1 0 14.5v-3a.5.5 0 0 1 .5-.5zm15 0a.5.5 0 0 1 .5.5v3a1.5 1.5 0 0 1-1.5 1.5h-3a.5.5 0 0 1 0-1h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 1 .5-.5zM3 4.5a.5.5 0 0 1 1 0v7a.5.5 0 0 1-1 0v-7zm2 0a.5.5 0 0 1 1 0v7a.5.5 0 0 1-1 0v-7zm2 0a.5.5 0 0 1 1 0v7a.5.5 0 0 1-1 0v-7zm2 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-7zm3 0a.5.5 0 0 1 1 0v7a.5.5 0 0 1-1 0v-7z" />
                                                                    </svg></span>

                                                            </div>
                                                            <input type="text" class="form-control" name="consec"
                                                                value="<%=consec%>" placeholder="Consec" />

                                                        </div>

                                                    </div>

                                                </li>




                                                <li>
                                                    <button type="submit" name="consultarcli" id="btn1" class="button">

                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                            fill="currentColor" class="bi bi-search"
                                                            viewBox="0 0 16 16">
                                                            <path
                                                                d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                                                        </svg>Consultar</button>
                                                </li>



                                                <!--CONSULTA DE PRODUCTOS 1-->

                                                <li class="form-list__row">
                                                    <br>
                                                    <div class="form-list__row">
                                                        <div class="input-group" id="inp4">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text"><svg
                                                                        xmlns="http://www.w3.org/2000/svg" width="16"
                                                                        height="16" fill="currentColor"
                                                                        class="bi bi-upc" viewBox="0 0 16 16">
                                                                        <path
                                                                            d="M3 4.5a.5.5 0 0 1 1 0v7a.5.5 0 0 1-1 0v-7zm2 0a.5.5 0 0 1 1 0v7a.5.5 0 0 1-1 0v-7zm2 0a.5.5 0 0 1 1 0v7a.5.5 0 0 1-1 0v-7zm2 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-7zm3 0a.5.5 0 0 1 1 0v7a.5.5 0 0 1-1 0v-7z" />
                                                                    </svg></span>
                                                            </div>
                                                            <input type="text" class="form-control" name="cod_prod"
                                                                value="<%=cod_prod%>" placeholder="Cod producto" />

                                                        </div>
                                                    </div>
                                                </li>


                                                <li>
                                                    <button type="submit" name="consultar" id="btn2" class="button">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                            fill="currentColor" class="bi bi-search"
                                                            viewBox="0 0 16 16">
                                                            <path
                                                                d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                                                        </svg>Consultar</button>
                                                </li>


                                                <li class="form-list__row">
                                                    <br>
                                                    <div class="form-list__row">
                                                        <div class="input-group" id="inp5">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text"><svg
                                                                        xmlns="http://www.w3.org/2000/svg" width="16"
                                                                        height="16" fill="currentColor"
                                                                        class="bi bi-cpu-fill" viewBox="0 0 16 16">
                                                                        <path
                                                                            d="M6.5 6a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3z" />
                                                                        <path
                                                                            d="M5.5.5a.5.5 0 0 0-1 0V2A2.5 2.5 0 0 0 2 4.5H.5a.5.5 0 0 0 0 1H2v1H.5a.5.5 0 0 0 0 1H2v1H.5a.5.5 0 0 0 0 1H2v1H.5a.5.5 0 0 0 0 1H2A2.5 2.5 0 0 0 4.5 14v1.5a.5.5 0 0 0 1 0V14h1v1.5a.5.5 0 0 0 1 0V14h1v1.5a.5.5 0 0 0 1 0V14h1v1.5a.5.5 0 0 0 1 0V14a2.5 2.5 0 0 0 2.5-2.5h1.5a.5.5 0 0 0 0-1H14v-1h1.5a.5.5 0 0 0 0-1H14v-1h1.5a.5.5 0 0 0 0-1H14v-1h1.5a.5.5 0 0 0 0-1H14A2.5 2.5 0 0 0 11.5 2V.5a.5.5 0 0 0-1 0V2h-1V.5a.5.5 0 0 0-1 0V2h-1V.5a.5.5 0 0 0-1 0V2h-1V.5zm1 4.5h3A1.5 1.5 0 0 1 11 6.5v3A1.5 1.5 0 0 1 9.5 11h-3A1.5 1.5 0 0 1 5 9.5v-3A1.5 1.5 0 0 1 6.5 5z" />
                                                                    </svg></span>
                                                            </div>
                                                            <input type="text" class="form-control" name="name_prod"
                                                                value="<%=name_prod%>" placeholder="Nombre Prod" />

                                                        </div>
                                                    </div>
                                                </li>

                                                <li class="form-list__row">
                                                    <br>
                                                    <div class="form-list__row">
                                                        <div class="input-group" id="inp6">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text"><svg
                                                                        xmlns="http://www.w3.org/2000/svg" width="16"
                                                                        height="16" fill="currentColor"
                                                                        class="bi bi-hash" viewBox="0 0 16 16">
                                                                        <path
                                                                            d="M8.39 12.648a1.32 1.32 0 0 0-.015.18c0 .305.21.508.5.508.266 0 .492-.172.555-.477l.554-2.703h1.204c.421 0 .617-.234.617-.547 0-.312-.188-.53-.617-.53h-.985l.516-2.524h1.265c.43 0 .618-.227.618-.547 0-.313-.188-.524-.618-.524h-1.046l.476-2.304a1.06 1.06 0 0 0 .016-.164.51.51 0 0 0-.516-.516.54.54 0 0 0-.539.43l-.523 2.554H7.617l.477-2.304c.008-.04.015-.118.015-.164a.512.512 0 0 0-.523-.516.539.539 0 0 0-.531.43L6.53 5.484H5.414c-.43 0-.617.22-.617.532 0 .312.187.539.617.539h.906l-.515 2.523H4.609c-.421 0-.609.219-.609.531 0 .313.188.547.61.547h.976l-.516 2.492c-.008.04-.015.125-.015.18 0 .305.21.508.5.508.265 0 .492-.172.554-.477l.555-2.703h2.242l-.515 2.492zm-1-6.109h2.266l-.515 2.563H6.859l.532-2.563z" />
                                                                    </svg></span>
                                                            </div>
                                                            <input type="text" class="form-control" name="cant"
                                                                value="<%=cant%>" placeholder="Cant" />

                                                        </div>
                                                    </div>
                                                </li>

                                                <li class="form-list__row">
                                                    <br>
                                                    <div class="form-list__row">
                                                        <div class="input-group" id="inp7">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text"><svg
                                                                        xmlns="http://www.w3.org/2000/svg" width="16"
                                                                        height="16" fill="currentColor"
                                                                        class="bi bi-currency-dollar"
                                                                        viewBox="0 0 16 16">
                                                                        <path
                                                                            d="M4 10.781c.148 1.667 1.513 2.85 3.591 3.003V15h1.043v-1.216c2.27-.179 3.678-1.438 3.678-3.3 0-1.59-.947-2.51-2.956-3.028l-.722-.187V3.467c1.122.11 1.879.714 2.07 1.616h1.47c-.166-1.6-1.54-2.748-3.54-2.875V1H7.591v1.233c-1.939.23-3.27 1.472-3.27 3.156 0 1.454.966 2.483 2.661 2.917l.61.162v4.031c-1.149-.17-1.94-.8-2.131-1.718H4zm3.391-3.836c-1.043-.263-1.6-.825-1.6-1.616 0-.944.704-1.641 1.8-1.828v3.495l-.2-.05zm1.591 1.872c1.287.323 1.852.859 1.852 1.769 0 1.097-.826 1.828-2.2 1.939V8.73l.348.086z" />
                                                                    </svg></span>
                                                            </div>
                                                            <input type="text" class="form-control" name="prec"
                                                                value="<%=prec%>" placeholder="Precio" />

                                                        </div>
                                                    </div>
                                                </li>

                                                <li class="form-list__row">
                                                    <br>
                                                    <div class="form-list__row">
                                                        <div class="input-group" id="inp8">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text"><svg
                                                                        xmlns="http://www.w3.org/2000/svg" width="16"
                                                                        height="16" fill="currentColor"
                                                                        class="bi bi-percent" viewBox="0 0 16 16">
                                                                        <path
                                                                            d="M13.442 2.558a.625.625 0 0 1 0 .884l-10 10a.625.625 0 1 1-.884-.884l10-10a.625.625 0 0 1 .884 0zM4.5 6a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm0 1a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5zm7 6a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm0 1a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z" />
                                                                    </svg></span>
                                                            </div>
                                                            <input type="text" class="form-control" name="iva"
                                                                value="<%=iva%>" placeholder="Iva" />

                                                        </div>
                                                    </div>
                                                </li>

                                                <li class="form-list__row">
                                                    <br>
                                                    <div class="form-list__row">
                                                        <div class="input-group" id="inp9">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text"><svg
                                                                        xmlns="http://www.w3.org/2000/svg" width="16"
                                                                        height="16" fill="currentColor"
                                                                        class="bi bi-cash-stack" viewBox="0 0 16 16">
                                                                        <path
                                                                            d="M1 3a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1H1zm7 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4z" />
                                                                        <path
                                                                            d="M0 5a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1V5zm3 0a2 2 0 0 1-2 2v4a2 2 0 0 1 2 2h10a2 2 0 0 1 2-2V7a2 2 0 0 1-2-2H3z" />
                                                                    </svg></span>
                                                            </div>
                                                            <input type="text" class="form-control" name="valor"
                                                                value="<%=valor%>" placeholder="Valor Total" />

                                                        </div>
                                                    </div>
                                                </li>


                                                <!--CONSULTA DE PRODUCTOS 2-->

                                                <li class="form-list__row">
                                                    <br>
                                                    <div class="form-list__row">
                                                        <div class="input-group" id="inp10">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text"><svg
                                                                        xmlns="http://www.w3.org/2000/svg" width="16"
                                                                        height="16" fill="currentColor"
                                                                        class="bi bi-upc" viewBox="0 0 16 16">
                                                                        <path
                                                                            d="M3 4.5a.5.5 0 0 1 1 0v7a.5.5 0 0 1-1 0v-7zm2 0a.5.5 0 0 1 1 0v7a.5.5 0 0 1-1 0v-7zm2 0a.5.5 0 0 1 1 0v7a.5.5 0 0 1-1 0v-7zm2 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-7zm3 0a.5.5 0 0 1 1 0v7a.5.5 0 0 1-1 0v-7z" />
                                                                    </svg></span>
                                                            </div>
                                                            <input type="text" class="form-control" name="cod_prod2"
                                                                value="<%=cod_prod2%>" placeholder="Cod producto" />

                                                        </div>
                                                    </div>
                                                </li>


                                                <li>
                                                    <button type="submit" name="consultar2" id="btn3" class="button">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                            fill="currentColor" class="bi bi-search"
                                                            viewBox="0 0 16 16">
                                                            <path
                                                                d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                                                        </svg>Consultar</button>
                                                </li>

                                                <li class="form-list__row">
                                                    <br>
                                                    <div class="form-list__row">
                                                        <div class="input-group" id="inp11">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text"><svg
                                                                        xmlns="http://www.w3.org/2000/svg" width="16"
                                                                        height="16" fill="currentColor"
                                                                        class="bi bi-cpu-fill" viewBox="0 0 16 16">
                                                                        <path
                                                                            d="M6.5 6a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3z" />
                                                                        <path
                                                                            d="M5.5.5a.5.5 0 0 0-1 0V2A2.5 2.5 0 0 0 2 4.5H.5a.5.5 0 0 0 0 1H2v1H.5a.5.5 0 0 0 0 1H2v1H.5a.5.5 0 0 0 0 1H2v1H.5a.5.5 0 0 0 0 1H2A2.5 2.5 0 0 0 4.5 14v1.5a.5.5 0 0 0 1 0V14h1v1.5a.5.5 0 0 0 1 0V14h1v1.5a.5.5 0 0 0 1 0V14h1v1.5a.5.5 0 0 0 1 0V14a2.5 2.5 0 0 0 2.5-2.5h1.5a.5.5 0 0 0 0-1H14v-1h1.5a.5.5 0 0 0 0-1H14v-1h1.5a.5.5 0 0 0 0-1H14v-1h1.5a.5.5 0 0 0 0-1H14A2.5 2.5 0 0 0 11.5 2V.5a.5.5 0 0 0-1 0V2h-1V.5a.5.5 0 0 0-1 0V2h-1V.5a.5.5 0 0 0-1 0V2h-1V.5zm1 4.5h3A1.5 1.5 0 0 1 11 6.5v3A1.5 1.5 0 0 1 9.5 11h-3A1.5 1.5 0 0 1 5 9.5v-3A1.5 1.5 0 0 1 6.5 5z" />
                                                                    </svg></span>
                                                            </div>
                                                            <input type="text" class="form-control" name="name_prod2"
                                                                value="<%=name_prod2%>" placeholder="Nombre Prod" />

                                                        </div>
                                                    </div>
                                                </li>

                                                <li class="form-list__row">
                                                    <br>
                                                    <div class="form-list__row">
                                                        <div class="input-group" id="inp12">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text"><svg
                                                                        xmlns="http://www.w3.org/2000/svg" width="16"
                                                                        height="16" fill="currentColor"
                                                                        class="bi bi-hash" viewBox="0 0 16 16">
                                                                        <path
                                                                            d="M8.39 12.648a1.32 1.32 0 0 0-.015.18c0 .305.21.508.5.508.266 0 .492-.172.555-.477l.554-2.703h1.204c.421 0 .617-.234.617-.547 0-.312-.188-.53-.617-.53h-.985l.516-2.524h1.265c.43 0 .618-.227.618-.547 0-.313-.188-.524-.618-.524h-1.046l.476-2.304a1.06 1.06 0 0 0 .016-.164.51.51 0 0 0-.516-.516.54.54 0 0 0-.539.43l-.523 2.554H7.617l.477-2.304c.008-.04.015-.118.015-.164a.512.512 0 0 0-.523-.516.539.539 0 0 0-.531.43L6.53 5.484H5.414c-.43 0-.617.22-.617.532 0 .312.187.539.617.539h.906l-.515 2.523H4.609c-.421 0-.609.219-.609.531 0 .313.188.547.61.547h.976l-.516 2.492c-.008.04-.015.125-.015.18 0 .305.21.508.5.508.265 0 .492-.172.554-.477l.555-2.703h2.242l-.515 2.492zm-1-6.109h2.266l-.515 2.563H6.859l.532-2.563z" />
                                                                    </svg></span>
                                                            </div>
                                                            <input type="text" class="form-control" name="cant2"
                                                                value="<%=cant2%>" placeholder="Cant" />

                                                        </div>
                                                    </div>
                                                </li>

                                                <li class="form-list__row">
                                                    <br>
                                                    <div class="form-list__row">
                                                        <div class="input-group" id="inp13">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text"><svg
                                                                        xmlns="http://www.w3.org/2000/svg" width="16"
                                                                        height="16" fill="currentColor"
                                                                        class="bi bi-currency-dollar"
                                                                        viewBox="0 0 16 16">
                                                                        <path
                                                                            d="M4 10.781c.148 1.667 1.513 2.85 3.591 3.003V15h1.043v-1.216c2.27-.179 3.678-1.438 3.678-3.3 0-1.59-.947-2.51-2.956-3.028l-.722-.187V3.467c1.122.11 1.879.714 2.07 1.616h1.47c-.166-1.6-1.54-2.748-3.54-2.875V1H7.591v1.233c-1.939.23-3.27 1.472-3.27 3.156 0 1.454.966 2.483 2.661 2.917l.61.162v4.031c-1.149-.17-1.94-.8-2.131-1.718H4zm3.391-3.836c-1.043-.263-1.6-.825-1.6-1.616 0-.944.704-1.641 1.8-1.828v3.495l-.2-.05zm1.591 1.872c1.287.323 1.852.859 1.852 1.769 0 1.097-.826 1.828-2.2 1.939V8.73l.348.086z" />
                                                                    </svg></span>
                                                            </div>
                                                            <input type="text" class="form-control" name="prec2"
                                                                value="<%=prec2%>" placeholder="Precio" />

                                                        </div>
                                                    </div>
                                                </li>

                                                <li class="form-list__row">
                                                    <br>
                                                    <div class="form-list__row">
                                                        <div class="input-group" id="inp14">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text"><svg
                                                                        xmlns="http://www.w3.org/2000/svg" width="16"
                                                                        height="16" fill="currentColor"
                                                                        class="bi bi-percent" viewBox="0 0 16 16">
                                                                        <path
                                                                            d="M13.442 2.558a.625.625 0 0 1 0 .884l-10 10a.625.625 0 1 1-.884-.884l10-10a.625.625 0 0 1 .884 0zM4.5 6a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm0 1a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5zm7 6a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm0 1a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z" />
                                                                    </svg></span>
                                                            </div>
                                                            <input type="text" class="form-control" name="iva2"
                                                                value="<%=iva2%>" placeholder="Iva" />

                                                        </div>
                                                    </div>
                                                </li>

                                                <li class="form-list__row">
                                                    <br>
                                                    <div class="form-list__row">
                                                        <div class="input-group" id="inp15">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text"><svg
                                                                        xmlns="http://www.w3.org/2000/svg" width="16"
                                                                        height="16" fill="currentColor"
                                                                        class="bi bi-cash-stack" viewBox="0 0 16 16">
                                                                        <path
                                                                            d="M1 3a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1H1zm7 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4z" />
                                                                        <path
                                                                            d="M0 5a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1V5zm3 0a2 2 0 0 1-2 2v4a2 2 0 0 1 2 2h10a2 2 0 0 1 2-2V7a2 2 0 0 1-2-2H3z" />
                                                                    </svg></span>
                                                            </div>
                                                            <input type="text" class="form-control" name="valor2"
                                                                value="<%=valor2%>" placeholder="Valor Total" />

                                                        </div>
                                                    </div>
                                                </li>

                                                <!--CONSULTA DE PRODUCTOS 3-->

                                                <li class="form-list__row">
                                                    <br>
                                                    <div class="form-list__row">
                                                        <div class="input-group" id="inp16">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text"><svg
                                                                        xmlns="http://www.w3.org/2000/svg" width="16"
                                                                        height="16" fill="currentColor"
                                                                        class="bi bi-upc" viewBox="0 0 16 16">
                                                                        <path
                                                                            d="M3 4.5a.5.5 0 0 1 1 0v7a.5.5 0 0 1-1 0v-7zm2 0a.5.5 0 0 1 1 0v7a.5.5 0 0 1-1 0v-7zm2 0a.5.5 0 0 1 1 0v7a.5.5 0 0 1-1 0v-7zm2 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-7zm3 0a.5.5 0 0 1 1 0v7a.5.5 0 0 1-1 0v-7z" />
                                                                    </svg></span>
                                                            </div>
                                                            <input type="text" class="form-control" name="cod_prod3"
                                                                value="<%=cod_prod3%>" placeholder="Cod producto" />

                                                        </div>
                                                    </div>
                                                </li>


                                                <li>
                                                    <button type="submit" name="consultar3" id="btn4" class="button">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                            fill="currentColor" class="bi bi-search"
                                                            viewBox="0 0 16 16">
                                                            <path
                                                                d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                                                        </svg>Consultar</button>
                                                </li>

                                                <li class="form-list__row">
                                                    <br>
                                                    <div class="form-list__row">
                                                        <div class="input-group" id="inp17">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text"><svg
                                                                        xmlns="http://www.w3.org/2000/svg" width="16"
                                                                        height="16" fill="currentColor"
                                                                        class="bi bi-cpu-fill" viewBox="0 0 16 16">
                                                                        <path
                                                                            d="M6.5 6a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3z" />
                                                                        <path
                                                                            d="M5.5.5a.5.5 0 0 0-1 0V2A2.5 2.5 0 0 0 2 4.5H.5a.5.5 0 0 0 0 1H2v1H.5a.5.5 0 0 0 0 1H2v1H.5a.5.5 0 0 0 0 1H2v1H.5a.5.5 0 0 0 0 1H2A2.5 2.5 0 0 0 4.5 14v1.5a.5.5 0 0 0 1 0V14h1v1.5a.5.5 0 0 0 1 0V14h1v1.5a.5.5 0 0 0 1 0V14h1v1.5a.5.5 0 0 0 1 0V14a2.5 2.5 0 0 0 2.5-2.5h1.5a.5.5 0 0 0 0-1H14v-1h1.5a.5.5 0 0 0 0-1H14v-1h1.5a.5.5 0 0 0 0-1H14v-1h1.5a.5.5 0 0 0 0-1H14A2.5 2.5 0 0 0 11.5 2V.5a.5.5 0 0 0-1 0V2h-1V.5a.5.5 0 0 0-1 0V2h-1V.5a.5.5 0 0 0-1 0V2h-1V.5zm1 4.5h3A1.5 1.5 0 0 1 11 6.5v3A1.5 1.5 0 0 1 9.5 11h-3A1.5 1.5 0 0 1 5 9.5v-3A1.5 1.5 0 0 1 6.5 5z" />
                                                                    </svg></span>
                                                            </div>
                                                            <input type="text" class="form-control" name="name_prod3"
                                                                value="<%=name_prod3%>" placeholder="Nombre Prod" />

                                                        </div>
                                                    </div>
                                                </li>

                                                <li class="form-list__row">
                                                    <br>
                                                    <div class="form-list__row">
                                                        <div class="input-group" id="inp18">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text"><svg
                                                                        xmlns="http://www.w3.org/2000/svg" width="16"
                                                                        height="16" fill="currentColor"
                                                                        class="bi bi-hash" viewBox="0 0 16 16">
                                                                        <path
                                                                            d="M8.39 12.648a1.32 1.32 0 0 0-.015.18c0 .305.21.508.5.508.266 0 .492-.172.555-.477l.554-2.703h1.204c.421 0 .617-.234.617-.547 0-.312-.188-.53-.617-.53h-.985l.516-2.524h1.265c.43 0 .618-.227.618-.547 0-.313-.188-.524-.618-.524h-1.046l.476-2.304a1.06 1.06 0 0 0 .016-.164.51.51 0 0 0-.516-.516.54.54 0 0 0-.539.43l-.523 2.554H7.617l.477-2.304c.008-.04.015-.118.015-.164a.512.512 0 0 0-.523-.516.539.539 0 0 0-.531.43L6.53 5.484H5.414c-.43 0-.617.22-.617.532 0 .312.187.539.617.539h.906l-.515 2.523H4.609c-.421 0-.609.219-.609.531 0 .313.188.547.61.547h.976l-.516 2.492c-.008.04-.015.125-.015.18 0 .305.21.508.5.508.265 0 .492-.172.554-.477l.555-2.703h2.242l-.515 2.492zm-1-6.109h2.266l-.515 2.563H6.859l.532-2.563z" />
                                                                    </svg></span>
                                                            </div>
                                                            <input type="text" class="form-control" name="cant3"
                                                                value="<%=cant3%>" placeholder="Cant" />

                                                        </div>
                                                    </div>
                                                </li>

                                                <li class="form-list__row">
                                                    <br>
                                                    <div class="form-list__row">
                                                        <div class="input-group" id="inp19">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text"><svg
                                                                        xmlns="http://www.w3.org/2000/svg" width="16"
                                                                        height="16" fill="currentColor"
                                                                        class="bi bi-currency-dollar"
                                                                        viewBox="0 0 16 16">
                                                                        <path
                                                                            d="M4 10.781c.148 1.667 1.513 2.85 3.591 3.003V15h1.043v-1.216c2.27-.179 3.678-1.438 3.678-3.3 0-1.59-.947-2.51-2.956-3.028l-.722-.187V3.467c1.122.11 1.879.714 2.07 1.616h1.47c-.166-1.6-1.54-2.748-3.54-2.875V1H7.591v1.233c-1.939.23-3.27 1.472-3.27 3.156 0 1.454.966 2.483 2.661 2.917l.61.162v4.031c-1.149-.17-1.94-.8-2.131-1.718H4zm3.391-3.836c-1.043-.263-1.6-.825-1.6-1.616 0-.944.704-1.641 1.8-1.828v3.495l-.2-.05zm1.591 1.872c1.287.323 1.852.859 1.852 1.769 0 1.097-.826 1.828-2.2 1.939V8.73l.348.086z" />
                                                                    </svg></span>
                                                            </div>
                                                            <input type="text" class="form-control" name="prec3"
                                                                value="<%=prec3%>" placeholder="Precio" />

                                                        </div>
                                                    </div>
                                                </li>

                                                <li class="form-list__row">
                                                    <br>
                                                    <div class="form-list__row">
                                                        <div class="input-group" id="inp20">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text"><svg
                                                                        xmlns="http://www.w3.org/2000/svg" width="16"
                                                                        height="16" fill="currentColor"
                                                                        class="bi bi-percent" viewBox="0 0 16 16">
                                                                        <path
                                                                            d="M13.442 2.558a.625.625 0 0 1 0 .884l-10 10a.625.625 0 1 1-.884-.884l10-10a.625.625 0 0 1 .884 0zM4.5 6a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm0 1a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5zm7 6a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm0 1a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z" />
                                                                    </svg></span>
                                                            </div>
                                                            <input type="text" class="form-control" name="iva3"
                                                                value="<%=iva3%>" placeholder="Iva" />

                                                        </div>
                                                    </div>
                                                </li>

                                                <li class="form-list__row">
                                                    <br>
                                                    <div class="form-list__row">
                                                        <div class="input-group" id="inp21">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text"><svg
                                                                        xmlns="http://www.w3.org/2000/svg" width="16"
                                                                        height="16" fill="currentColor"
                                                                        class="bi bi-cash-stack" viewBox="0 0 16 16">
                                                                        <path
                                                                            d="M1 3a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1H1zm7 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4z" />
                                                                        <path
                                                                            d="M0 5a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1V5zm3 0a2 2 0 0 1-2 2v4a2 2 0 0 1 2 2h10a2 2 0 0 1 2-2V7a2 2 0 0 1-2-2H3z" />
                                                                    </svg></span>
                                                            </div>
                                                            <input type="text" class="form-control" name="valor3"
                                                                value="<%=valor3%>" placeholder="Valor Total" />

                                                        </div>
                                                    </div>
                                                </li>

                                                <!--TOTALES-->

                                                <li class="form-list__row">
                                                    <br>
                                                    <div class="form-list__row">
                                                        <div class="input-group" id="inp22">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text"><svg
                                                                        xmlns="http://www.w3.org/2000/svg" width="16"
                                                                        height="16" fill="currentColor"
                                                                        class="bi bi-cash" viewBox="0 0 16 16">
                                                                        <path d="M8 10a2 2 0 1 0 0-4 2 2 0 0 0 0 4z" />
                                                                        <path
                                                                            d="M0 4a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1V4zm3 0a2 2 0 0 1-2 2v4a2 2 0 0 1 2 2h10a2 2 0 0 1 2-2V6a2 2 0 0 1-2-2H3z" />
                                                                    </svg></span>
                                                            </div>
                                                            <input type="text" class="form-control" name="venta"
                                                                value="<%=venta%>" placeholder="Total Venta" />

                                                        </div>
                                                    </div>
                                                </li>

                                                <li class="form-list__row">
                                                    <br>
                                                    <div class="form-list__row">
                                                        <div class="input-group" id="inp23">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text"><svg
                                                                        xmlns="http://www.w3.org/2000/svg" width="16"
                                                                        height="16" fill="currentColor"
                                                                        class="bi bi-percent" viewBox="0 0 16 16">
                                                                        <path
                                                                            d="M13.442 2.558a.625.625 0 0 1 0 .884l-10 10a.625.625 0 1 1-.884-.884l10-10a.625.625 0 0 1 .884 0zM4.5 6a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm0 1a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5zm7 6a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm0 1a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z" />
                                                                    </svg></span>
                                                            </div>
                                                            <input type="text" class="form-control" name="total"
                                                                value="<%=total%>" placeholder="Total Iva" />

                                                        </div>
                                                    </div>
                                                </li>

                                                <li class="form-list__row">
                                                    <br>
                                                    <div class="form-list__row">
                                                        <div class="input-group" id="inp24">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text"><svg
                                                                        xmlns="http://www.w3.org/2000/svg" width="16"
                                                                        height="16" fill="currentColor"
                                                                        class="bi bi-cash-coin" viewBox="0 0 16 16">
                                                                        <path fill-rule="evenodd"
                                                                            d="M11 15a4 4 0 1 0 0-8 4 4 0 0 0 0 8zm5-4a5 5 0 1 1-10 0 5 5 0 0 1 10 0z" />
                                                                        <path
                                                                            d="M9.438 11.944c.047.596.518 1.06 1.363 1.116v.44h.375v-.443c.875-.061 1.386-.529 1.386-1.207 0-.618-.39-.936-1.09-1.1l-.296-.07v-1.2c.376.043.614.248.671.532h.658c-.047-.575-.54-1.024-1.329-1.073V8.5h-.375v.45c-.747.073-1.255.522-1.255 1.158 0 .562.378.92 1.007 1.066l.248.061v1.272c-.384-.058-.639-.27-.696-.563h-.668zm1.36-1.354c-.369-.085-.569-.26-.569-.522 0-.294.216-.514.572-.578v1.1h-.003zm.432.746c.449.104.655.272.655.569 0 .339-.257.571-.709.614v-1.195l.054.012z" />
                                                                        <path
                                                                            d="M1 0a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h4.083c.058-.344.145-.678.258-1H3a2 2 0 0 0-2-2V3a2 2 0 0 0 2-2h10a2 2 0 0 0 2 2v3.528c.38.34.717.728 1 1.154V1a1 1 0 0 0-1-1H1z" />
                                                                        <path
                                                                            d="M9.998 5.083 10 5a2 2 0 1 0-3.132 1.65 5.982 5.982 0 0 1 3.13-1.567z" />
                                                                    </svg></span>
                                                            </div>
                                                            <input type="text" class="form-control" name="totalconiva"
                                                                value="<%=totalconiva%>" placeholder="Total con Iva" />

                                                        </div>
                                                    </div>
                                                </li>


                                                <li>
                                                    <button type="submit" name="confirmar" id="btn5" class="button">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                            fill="currentColor" class="bi bi-check-circle"
                                                            viewBox="0 0 16 16">
                                                            <path
                                                                d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                                            <path
                                                                d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z" />
                                                        </svg>Confirmar</button>
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