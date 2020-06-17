<%-- 
    Document   : carrito
    Created on : 30/04/2019, 10:31:27 PM
    Author     : angab
--%>

<%@page import="java.util.List"%>
<%@page import="Modelo.Validacion"%>
<%@page import="Modelo.AccesoZapatos"%>
<%@page import="Modelo.AccesoMarcas"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Modelo.AccesoCatalogo"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/all.js"></script>
        <link rel="stylesheet" href="css/main.css">
        <title>Mi Carrito</title>
        <link rel="icon" type="image/jpeg" href="img/logo2.jpg">
    <body>
        <%
            HttpSession sesion = request.getSession();
            
            if(sesion.getAttribute("usuario")!=null && sesion.getAttribute("tipo")!=null){
                int tipo = Integer.parseInt(sesion.getAttribute("tipo").toString());
                
                if(tipo==3){
                    out.print("<nav class=\"navbar navbar-expand-sm bg-dark navbar-dark fixed-top\">"+
                            "<div class=\"container\">"+
                                    "<strong><img src=\"img/logo.jpg\" width=\"130\" height=\"100\"></strong>"
                            + "<div class='container'>"
                                    +"<label id='Bienvenida'>Mi Carrito</label><br>"
                            + "<a href='index.jsp?cerrar=true'><input type=\"button\" class=\"btn btn-outline-light\" value=\"Cerrar Sesión\"></a>"
                            + "</div>"+
                                "<button type=\"button\" class=\"navbar-toggler\" data-toggle=\"collapse\" data-target=\"#navbarCollapse\">"+
                                    "<span class=\"navbar-toggler-icon\"></span>"+
                                "</button>"+
                                "<div class=\"collapse navbar-collapse\" id=\"navbarCollapse\">"+
                                    "<ul class=\"navbar-nav ml-auto\">"+
                                        "<li class=\"nav-item\">"+
                                            "<a href=\"MenuPrincipal.jsp\" class=\"nav-link\">Inicio</a>"+
                                        "</li>"+
                                        "<li class=\"nav-item\">"+
                                            "<a href=\"comprar.jsp\" class=\"nav-link\">Comprar Zapatos</a>"+
                                        "</li>"+
                                        "<li class=\"nav-item\">"+
                                            "<a href=\"carrito.jsp\" class=\"nav-link\">Mi Carrito</a>"+
                                        "</li>"+
                                        "<li class=\"nav-item\">"+
                                            "<a href=\"comprasUsuario.jsp\" class=\"nav-link\">Mis Compras</a>"+
                                        "</li>"+
                                    "</ul>"+
                                "</div>"+
                            "</div>"+
                        "</nav>");
                    AccesoZapatos az = new AccesoZapatos();
                    List<String> listaElementos = (List<String>) session.getAttribute("carrito");
                    ResultSet resultado = null;

                    if(listaElementos!=null){
                             out.print("<div align='center' id='tabladiv'>"
                                            + "<div class='card text-center' id=\"divIniciar2\">"
                                     + "<form action='confirmacionCompra.jsp' method='Post'>"
                                            + "<table class=\"table\" id='tabla'>"
                                                +"<thead class=\"thead-dark\">"+
                                                  "<tr>"+
                                                    "<th scope=\"col\">Seleccionar</th>"+
                                                    "<th scope=\"col\">Modelo</th>"+
                                                    "<th scope=\"col\">Precio</th>"+
                                                    "<th scope=\"col\">Talla</th>"+
                                                    "<th scope=\"col\">Marca</th>"+
                                                    "<th scope=\"col\">Categoria</th>"+
                                                    "<th scope=\"col\">Descripción</th>"+
                                                    "<th scope=\"col\">Imagen</th>"+
                                                    "<th scope=\"col\">Cantidad</th>"+
                                                    "<th scope=\"col\">Opciones</th>"+
                                                "</tr>"+
                                                "</thead>"
                                            + "<tbody>");
                        for (String elem : listaElementos) {
                            String id = elem;
                            resultado = az.buscar(0, id, "", "", "");

                            if(resultado!=null){

                                            String modelo2="";
                                            String precio2="";
                                            String talla2="";
                                            String marca2="";
                                            String categoria2="";
                                            String descripcion="";
                                            String imagen="";
                                            int id2=0;
                                            while(resultado.next()){
                                                id2 = resultado.getInt(1);
                                                modelo2 = resultado.getString(2);
                                                precio2 = Float.toString(resultado.getFloat(4));
                                                talla2 = resultado.getString(6);
                                                marca2 = resultado.getString(7);
                                                categoria2 = resultado.getString(9)+" - "+resultado.getString(8);
                                                descripcion = resultado.getString(5);
                                                imagen = resultado.getString(10);

                                                out.println(
                                                      "<tr>"
                                                              + "<td><div class=\"custom-control custom-checkbox\">"
                                                              + "<input type=\"checkbox\" class='custom-control-input' id='zapatos"+id2+"' name=\"zapatos\" value='"+id2+"'>"
                                                                      + "<label class=\"custom-control-label\" for='zapatos"+id2+"' id='unlabel'>Selecciona para comprar</label>"
                                                                      + "</div></td>"
                                                              + "<td>"+modelo2+"</td>"
                                                              + "<td>"+precio2+"</td>"
                                                              + "<td>"+talla2+"</td>"
                                                              + "<td>"+marca2+"</td>"
                                                              + "<td>"+categoria2+"</td>"
                                                              + "<td>"+descripcion+"</td>"
                                                              + "<td><img src='"+imagen+"' width=100 height=100></td>"
                                                              + "<td align='center'><input type='number' min='1' max='30' name='cantidad"+id2+"' class=\"form-control form-control-lg\" style='width: 100%;'></td>"
                                                              + "<td><a href='eliminarCarrito.jsp?nose="+(id2+479)+"'><i class='far fa-trash-alt' id='icono1'></i></a></td>"
                                                    +"</tr>");

                                            }

                            }
                        }
                       out.print("<tr>"
                               + "<td colspan='9' align='center'><input type='submit' value='Comprar' class=\"btn btn-primary btn-lg\" id='botonComprar'></td>"
                               + "</tr></tbody>"+
                       "</table></form></div></div></div>");                        
                    }else{
                        out.println("<div align='center' id='tabladiv' style='background-color: black; color: white;'>"
                                            + "<div class='card text-center' id=\"divIniciar2\" style='background-color: #333333; color: white;'>"
                                + "<h1>No tienes elementos en tu carrito</h1></div></div>");
                    }
                    

                }else{
                    response.sendRedirect("index.jsp");
                }
                
            }else{
                response.sendRedirect("index.jsp");
            }
        
        
        %>
        <script src="js/jquery-3.3.1.slim.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

    </body>
</html>
