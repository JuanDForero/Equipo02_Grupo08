<%@page import="java.sql.ResultSet" %>
    <%@page import="java.sql.PreparedStatement" %>
        <%@page import="java.sql.DriverManager" %>
            <%@page import="java.sql.*" %>
                <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
                    <!DOCTYPE html>
                    <html lang="en">

                    <head>
                        <meta charset="UTF-8">
                        <meta http-equiv="X-UA-Compatible" content="IE=edge">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <title>Dashboard</title>

                        <link rel="stylesheet"
                            href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
                        <link rel="stylesheet"
                            href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
                        <link rel="stylesheet"
                            href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
                        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600" rel="stylesheet">
                        <meta name="viewport" content="width=device-width, initial-scale=1">
                        <link rel="stylesheet" href="CSS/dash.css">
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
                                            <a href="#" class="px-3 text-light perfil dropdown-toogle"
                                                id="navbarDropdown" role="button" data-bs-toggle="dropdown"
                                                aria-haspopup="true" aria-expanded="false">
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
                                        <a href="CRUD-Cliente.jsp"><i
                                                class="fas fa-hand-holding-usd"></i><span>Clientes</span></a>
                                        <a href="CRUD-Proveedor.jsp"><i
                                                class="fas fa-clipboard"></i><span>Proveedores</span></a>
                                        <a href="CRUD-Producto.jsp"><i
                                                class="fas fa-memory"></i><span>Productos</span></a>
                                        <a href="CRUD-Venta.jsp"><i
                                                class="fas fa-cart-arrow-down"></i><span>Ventas</span></a>
                                        <a href="CRUD-Reporte.jsp"><i
                                                class="fas fa-chart-bar"></i><span>Reportes</span></a>
                                    </nav>
                                </div>
                                <main class="main col">
                                    <div class="row justify-content-center align-content-center text-center">
                                        <div class="columna col-lg-6">
                                            <%
                                                Connection con;
                                                String bd = "Grupo8_Equipo_2";
                                                String url = "jdbc:mariadb://prestamosvf.czo3ixoe3xoe.us-east-1.rds.amazonaws.com/" + bd;
                                                String Driver = "org.mariadb.jdbc.Driver";
                                                String User = "admin";
                                                String clave = "Ciclo3_admi123";

                                                Class.forName(Driver);

                                                con = DriverManager.getConnection(url, User, clave);

                                                PreparedStatement ps;
                                                ResultSet rs;

                                                ResultSet res = null;

                                                ps = con.prepareStatement(
                                                        "select c.cedula_cliente,c.nombre_cliente,sum(v.total_venta) from clientes as c inner join ventas as v on c.cedula_cliente = v.cedula_cliente group by v.cedula_cliente");
                                                rs = ps.executeQuery();

                                                String sql = "SELECT sum(total_venta) as total from ventas";
                                                ps = con.prepareStatement(sql);
                                                res = ps.executeQuery();

                                                int total = 0;
                                                while (res.next()) {
                                                    total = res.getInt(1);
                                                }
                                            %>
                                            <div class="contenedor" id="container">
                                                <!-- FORM CLIENTE -->
                                                <div data-content class="all-wrapper" id="clientecontainer">
                                                    <div class="formulario">
                                                        <h3>Consulta de ventas por cliente</h3>


                                                        <div align="center">
                                                            <table border=1>
                                                                <thead>

                                                                    <tr>
                                                                        <th>CEDULA CLIENTE</th>
                                                                        <th>NOMBRE CLIENTE</th>
                                                                        <th>VALOR TOTAL DE LA VENTA</th>


                                                                    </tr>

                                                                </thead>

                                                                <% while (rs.next()) { %>

                                                                    <tr>
                                                                        <td align='center'>
                                                                            <%=rs.getInt("cedula_cliente")%>
                                                                        </td>
                                                                        <td align='center'>
                                                                            <%=rs.getString("nombre_cliente")%>
                                                                        </td>
                                                                        <td align='center'>
                                                                            <%=rs.getInt("sum(v.total_venta)")%>
                                                                        </td>

                                                                    </tr>
                                                                    <% } %>

                                                            </table>
                                                        </div>
                                                        <label>Total Venta</label> <input type="text"
                                                                name="total" value="<%=total%>">
                                                    </div>
                                                    <!-- <div class="usuario-info"></div> -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </main>
                            </div>
                        </div>
                        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
                        <script src="https://kit.fontawesome.com/646c794df3.js"></script>
                        <script
                            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
                    </body>

                    </html>