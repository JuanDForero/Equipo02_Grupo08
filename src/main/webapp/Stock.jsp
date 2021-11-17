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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.6.0/chart.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="CSS/dash.css">
        <link rel="stylesheet" href="CSS/style.css">
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
                            <canvas id="Migrafica" width="15" height="16"></canvas>
                            <script>

                                var c = document.getElementById("Migrafica");
                                var cxn = c.getContext("2d");
                                // let micanvas= document.getElementById("MiGrafica").getContext("2d");

                                var Chart = new Chart(cxn, {

                                    type: "bar",
                                    data: {

                                        labels: ["MSI_B250_GAMING_PRO", "MSI_B250M_BAZOOKA", "MSI_H310I_PRO", "MSI_B450_GAMING_PRO_WIFI", "MSI_GT_710_1GB_DDR3", "MSI_GTX_1050_2GB_GDDR5",
                                            "MSI_GTX_1060_3GB_GDDR5",
                                            "MSI_GTX_1070_TI_8GB_GDDR5",
                                            "MSI_RTX_2080_TI_11GB_GAMING",
                                            "8GB_DDR4_2666_8X1_XPG_CORSAIR",
                                            "8GB_DDR4_2666_LED_CORSAIR",
                                            "16GB_DDR4_3000_16X1_CORSAIR",
                                            "16GB_DDR4_3200_2X8RGB_CORSAIR",
                                            "RYZEN_R7_5700G/8_NUCLEOS_16_HILOS_A_4 6GHZ",
                                            "RYZEN_R5_5600G/6_NUCLEOS_12_HILOS_A_4 4GHZ",
                                            "ATHLON_3000G/5_NUCLEOS(2_CPU+3_GPU)",
                                            "RYZEN_R9_5950X/16_NUCLEOS_32_HILOS_A_4 9GHZ",
                                            "RYZEN_R9_5900X/12_NUCLEOS_24_HILOS_A_4 8GHZ",
                                            "RYZEN_7_3700X/8_NUCLEOS-16_HILOS_A_4 4GHZ",
                                            "SSD_SATA_1TB_CRUCIAL_BX500"],

                                        datasets: [


                                            {

                                                label: "Stock",
                                                data: ["15", "7", "8", "9", "11", "10", "5", "3", "2", "6", "8", "5", "6", "3", "6", "15", "7", "9", "7", "8"],
                                                //   strokecolor: "rgba(54, 139, 191)",
                                                backgroundColor: "rgb(54, 139, 191 )",

                                                borderColor: "rgb(0,40,0)",



                                            }
                                        ]
                                    }

                                })


                            </script>
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