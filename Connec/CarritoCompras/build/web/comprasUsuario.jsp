<%-- 
    Document   : comprasUsuario
    Created on : 6/05/2019, 05:13:24 PM
    Author     : Profesor
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.AccesoTicket"%>
<%@page import="Modelo.Validacion"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/all.js"></script>
        <link rel="stylesheet" href="css/main.css">
        <title>Comprar</title>
        <link rel="icon" type="image/jpeg" href="img/logo2.jpg">

    <body>
        <%
            HttpSession sesion = request.getSession();
            if(sesion.getAttribute("usuario")!=null && sesion.getAttribute("tipo")!=null){
                int tipo = Integer.parseInt(sesion.getAttribute("tipo").toString());
                        response.setCharacterEncoding("UTF-8");
                        request.setCharacterEncoding("UTF-8");
                if(tipo==3){
                    out.print("<nav class=\"navbar navbar-expand-sm bg-dark navbar-dark fixed-top\">"+
                            "<div class=\"container\">"+
                                    "<strong><img src=\"img/logo.jpg\" width=\"130\" height=\"100\"></strong>"
                            + "<div class='container'>"
                                    +"<label id='Bienvenida'>Mis Compras</label><br>"
                            + "<a href='index.jsp?cerrar=true'><input type=\"button\" class=\"btn btn-outline-light\" value=\"Cerrar Sesi�n\"></a>"
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
                    out.println("<div align='center'><div class='container'>"
                            + "<div class='card text-center' id=\"divIniciar\" style=\"background-color: #c0392b;\">"
                            + "<div class='card-body' id=\"busqueda\">"
                            + "<form action='comprasUsuario.jsp'>"+
                                    "<h3>Buscar Tickets</h3>"+
                                    "<BR>"+
                                    "<form action=\"inventario.jsp\">"+
                                        "<div class=\"form-group\">"+
                                            "Busqueda por Folio"+
                                        "</div>"+
                                        "<div class=\"form-group\">"+
                                            "<input type=\"text\" class=\"form-control form-control-lg\" placeholder=\"Buscar todo\" name=\"busquedaFolio\">"+
                                        "</div>"
                            + "<div class=\"form-group\">"
                            + "Busqueda Por Fecha de Compra"
                            + "<div class='row'>"
                            + "<div class='col-lg-6'>"
                            + "Fecha de Comienzo"
                            + "<input type='date' name='fechaInicio'>"
                            + "</div>"
                            + "<div class='col-lg-6'>"
                            + "Fecha de Fin"
                            + "<input type='date' name='fechaFinal'>"
                            + "</div>"
                            + "</div>"
                            + "</div>"
                            + "<div class=\"form-group\">"
                            + "Busqueda Por Precio de la Compra"
                            + "<div class='row'>"
                            + "<div class='col-lg-6'>"
                            + "Precio minimo"
                            + "<input type='text' placeholder='Buscar Todo' name='precioMinimo' class=\"form-control form-control-lg\">"
                            + "</div>"
                            + "<div class='col-lg-6'>"
                            + "Precio maximo"
                            + "<input type='text' placeholder='Buscar Todo' name='precioMaximo' class=\"form-control form-control-lg\">"
                            + "</div>"
                            + "</div>"
                            + "</div>"
                            + "<br>"
                            +"<input type=\"submit\" class=\"btn btn-outline-light btn-block\" name='boton' value=\"Buscar Ticket\" name='boton'>"                         
                            + "</form>"
                            + "</div></div></div></div>");
                    String boton = request.getParameter("boton");
                    if("Buscar Ticket".equals(boton)){
                        ResultSet query = null;
                        Validacion validar = new Validacion();
                        String folio = request.getParameter("busquedaFolio");
                        String fechaAntes = request.getParameter("fechaInicio");
                        String fechaDespues = request.getParameter("fechaFinal");
                        String precioMin = request.getParameter("precioMinimo");
                        String precioMax = request.getParameter("precioMaximo");
                        AccesoTicket at = new AccesoTicket();
                        String user = sesion.getAttribute("usuario").toString();
                        
                        if("".equals(folio) && "".equals(fechaAntes) && "".equals(fechaDespues) && "".equals(precioMin) && "".equals(precioMax)){
                            query = at.buscarTicket(1, "", "", "", 0, 0, user);
                        
                        }else if(!"".equals(folio) && !"".equals(fechaAntes) && !"".equals(fechaDespues) && !"".equals(precioMin) && !"".equals(precioMax)){
                            if(validar.validarPrecio(precioMin) && validar.validarPrecio(precioMax)){
                                query = at.buscarTicket(2, folio, fechaAntes, fechaDespues, Float.parseFloat(precioMin), Float.parseFloat(precioMax), user);

                            }else{
                                out.println("<script>alert('Por favor introduzca valores validos en los precios');</script>");
                                query = null;
                            }
                        }else if(!"".equals(folio) && "".equals(fechaAntes) && "".equals(fechaDespues) && "".equals(precioMin) && "".equals(precioMax)){
                            query = at.buscarTicket(3, folio, "", "", 0, 0, user);
                            
                        }else if("".equals(folio) && !"".equals(fechaAntes) && !"".equals(fechaDespues) && "".equals(precioMin) && "".equals(precioMax)){
                            query = at.buscarTicket(4, "", fechaAntes, fechaDespues, 0, 0, user);
                            
                        }else if("".equals(folio) && "".equals(fechaAntes) && "".equals(fechaDespues) && !"".equals(precioMin) && !"".equals(precioMax)){
                            if(validar.validarPrecio(precioMin) && validar.validarPrecio(precioMax)){
                                query = at.buscarTicket(5, folio, fechaAntes, fechaDespues, Float.parseFloat(precioMin), Float.parseFloat(precioMax), user);

                            }else{
                                out.println("<script>alert('Por favor introduzca valores validos en los precios');</script>");
                                query = null;
                            }                            
                        }else if(!"".equals(folio) && !"".equals(fechaAntes) && !"".equals(fechaDespues) && "".equals(precioMin) && "".equals(precioMax)){
                            query = at.buscarTicket(6, folio, fechaAntes, fechaDespues, Float.parseFloat(precioMin), Float.parseFloat(precioMax), user);
                            
                        }else if(!"".equals(folio) && "".equals(fechaAntes) && "".equals(fechaDespues) && !"".equals(precioMin) && !"".equals(precioMax)){
                            if(validar.validarPrecio(precioMin) && validar.validarPrecio(precioMax)){
                                query = at.buscarTicket(7, folio, fechaAntes, fechaDespues, Float.parseFloat(precioMin), Float.parseFloat(precioMax), user);

                            }else{
                                out.println("<script>alert('Por favor introduzca valores validos en los precios');</script>");
                                query = null;
                            }                             
                        }else if("".equals(folio) && !"".equals(fechaAntes) && !"".equals(fechaDespues) && !"".equals(precioMin) && !"".equals(precioMax)){
                            if(validar.validarPrecio(precioMin) && validar.validarPrecio(precioMax)){
                                query = at.buscarTicket(8, folio, fechaAntes, fechaDespues, Float.parseFloat(precioMin), Float.parseFloat(precioMax), user);

                            }else{
                                out.println("<script>alert('Por favor introduzca valores validos en los precios');</script>");
                                query = null;
                            }                              
                        }else{
                            query = null;
                            out.println("<script>alert('Esa opcion no es valida');</script>");
                        }
                        
                        if(query!=null){
                            out.println("<div class='container52' id='cartas'>");
                            List<String> folios = new ArrayList<String>();
                            String folio3="";
                            while(query.next()){
                                folio3 = query.getString(3);
                                if(!folios.contains(folio3)){
                                    folios.add(folio3);                                
                                }
                            }
                            for (String elem : folios) {
                                out.print("<div class='card52' id='provisional53' onclick=\"hola('"+elem+"');\">"
                                        + "<h4>Folio "+elem+"</h4>");
                                        out.println("</div>");                                              
                            }
                            out.println("</div>");
                        }   
                        out.println("<form action='ServletTicketUsuario' method='Post' id=\"el_formulario\">"
                                + "<input type='hidden' id='oculto' name='oculto'>"
                                + "</form>");
                        

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
        <script>
            function hola(folio){
                $("#oculto").val(folio);
                $("#el_formulario").submit();
            }
        </script>
    </body>
</html>
