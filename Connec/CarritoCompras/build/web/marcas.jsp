<%-- 
    Document   : marcas
    Created on : 24/04/2019, 02:30:58 AM
    Author     : angab
--%>

<%@page import="Modelo.AccesoCatalogo"%>
<%@page import="Modelo.AccesoMarcas"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/all.js"></script>
        <link rel="stylesheet" href="css/main.css">
        <title>Marcas y Tallas</title>
        <link rel="icon" type="image/jpeg" href="img/logo2.jpg">

    </head>
    <body>
<%
            HttpSession sesion = request.getSession();
                                    response.setCharacterEncoding("UTF-8");
                        request.setCharacterEncoding("UTF-8");
            if(sesion.getAttribute("usuario")!=null && sesion.getAttribute("tipo")!=null){
                
                int tipo = Integer.parseInt(sesion.getAttribute("tipo").toString());
                
                if(tipo==1){
                    out.print("<nav class=\"navbar navbar-expand-sm bg-dark navbar-dark fixed-top\">"+
                            "<div class=\"container\">"+
                                    "<strong><img src=\"img/logo.jpg\" width=\"130\" height=\"100\"></strong>"
                            + "<div class='container'>"
                                    +"<label id='Bienvenida'>Bienvenid@ "+sesion.getAttribute("usuario").toString()+" </label><br>"
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
                                            "<a href=\"ConsultaUsuarios.jsp\" class=\"nav-link\">Consulta Usuarios</a>"+
                                        "</li>"+
                                        "<li class=\"nav-item\">"+
                                            "<a href=\"catalogo.jsp\" class=\"nav-link\">Registra catalogos y/o categorias</a>"+
                                        "</li>"+
                                        "<li class=\"nav-item\">"+
                                            "<a href=\"inventario.jsp\" class=\"nav-link\">Realiza el inventario</a>"+
                                        "</li>"+
                                        "<li class=\"nav-item\">"+
                                            "<a href=\"Compras.jsp\" class=\"nav-link\">Consulta tus ventas</a>"+
                                        "</li>"+
                                         "<li class=\"nav-item\">"+
                                            "<a href=\"marcas.jsp\" class=\"nav-link\">Registra marcas y tallas</a>"+
                                        "</li>"+
                                    "</ul>"+
                                "</div>"+
                            "</div>"+
                        "</nav>");
                    out.println("<div class='row'>"
                            + "<div class='col-lg-6' align='center'>"
                            + "<div class='card text-center' id=\"divIniciar\" style=\"background-color: #c0392b;\">"
                            + "<div class=\"card-body\">"+
                                    "<form>"+
                                        "<input type=\"button\" id=\"Registrar_Catalogo2\" value=\"Registrar\" class=\"btn btn-outline-light\">"+
                                        "<input type=\"button\" id=\"Consultar_Catalogos2\" value=\"Consultar\" class=\"btn btn-outline-light\">"+
                                    "</form>"+                                
                                "</div>"
                            + "<div class='card-body' id='Registrar_Catalogo'>"+
                                    "<h3>Registrar Marca</h3>"+
                                    "<BR>"+
                                    "<form action=\"ServletRegistrarMarca\" method='Post'>"+
                                        "<div class=\"form-group\">"+
                                            "<input type=\"text\" class=\"form-control form-control-lg\" placeholder=\"Nombre de la Marca\" name=\"NombreMarca\">"+
                                        "</div>"+
                                        "<div class=\"form-group\">"+
                                            "<input type=\"text\" class=\"form-control form-control-lg\" placeholder=\"Direccion de la Marca\" name=\"DireccionMarca\">"+
                                        "</div>"+
                                        "<br>"+
                                        "<input type=\"submit\" class=\"btn btn-outline-light btn-block\" value=\"Crear Marca\" name='boton'>"+
                                    "</form>"+
                                "</div>"
                            + "<div class='card-body' id='Buscar_Catalogo'>"+
                                    "<h3>Buscar Marca</h3>"+
                                    "<BR>"+
                                    "<form action=\"marcas.jsp\">"+
                                        "<div class=\"form-group\">"+
                                            "Buscar por Nombre de la Marca"+
                                        "</div>"+
                                        "<div class=\"form-group\">"+
                                            "<input type=\"text\" class=\"form-control form-control-lg\" placeholder=\"Buscar Todo\" name=\"buscarMarca\">"+
                                        "</div>"+
                                        "<br>"+
                                        "<input type=\"submit\" class=\"btn btn-outline-light btn-block\" value=\"Buscar Marca\" name='boton'>"+
                                    "</form>"+
                                "</div>"
                            + "</div></div>");
                    out.println("<div class='col-lg-6' align='center'>"+
                             "<div class='card text-center' id=\"divIniciar\" style=\"background-color: #c0392b;\">"
                            + "<div class=\"card-body\">"+
                                    "<form>"+
                                        "<input type=\"button\" id=\"Registrar_Categoria2\" value=\"Registrar\" class=\"btn btn-outline-light\">"+
                                        "<input type=\"button\" id=\"Consultar_Categoria2\" value=\"Consultar\" class=\"btn btn-outline-light\">"+
                                    "</form>"+                                
                                "</div>"+
                             "<div class='card-body' id=\"Registrar_Categoria\">"+
                                    "<h3>Registrar Talla</h3>"+
                                    "<BR>"+
                                    "<form action=\"ServletRegistrarMarca\" method='Post'>"+
                                        "<div class=\"form-group\">"+
                                            "<input type=\"text\" class=\"form-control form-control-lg\" placeholder=\"Talla\" name=\"Talla\">"+
                                        "</div>"+
                                        "<br>"+
                                        "<input type=\"submit\" class=\"btn btn-outline-light btn-block\" value=\"Crear Talla\" name='boton'>"+
                                    "</form>"+
                                "</div>"+
                             "<div class='card-body' id=\"Consultar_Categoria\">"+
                                    "<h3>Buscar Talla</h3>"+
                                    "<BR>"+
                                    "<form action=\"marcas.jsp\">"+
                                        "<div class=\"form-group\">"+
                                            "Busqueda por Talla"+
                                        "</div>"+
                                        "<div class=\"form-group\">"+
                                            "<input type=\"text\" class=\"form-control form-control-lg\" placeholder=\"Buscar Todo\" name=\"buscarTalla\">"+
                                        "</div>"+
                                        "<br>"+
                                        "<input type=\"submit\" class=\"btn btn-outline-light btn-block\" value=\"Buscar Talla\" name='boton'>"+
                                    "</form>"+
                                "</div>"                            
                               +"</div></div></div>");
                            
                            if("Buscar Marca".equals(request.getParameter("boton"))){
                                AccesoMarcas am=new AccesoMarcas();
                                ResultSet query3 = null;
                                if("".equals(request.getParameter("buscarMarca"))){
                                    query3 = am.buscarMarca(1, "", "");
                                }else if(!"".equals(request.getParameter("buscarMarca"))){
                                    query3 = am.buscarMarca(2, request.getParameter("buscarMarca"), "");
                                }
                                out.print("<div align='center' id='tablaCat'>"
                                + "<div class='card text-center' id=\"divIniciar2\">"
                                + "<table class=\"table\" id='tabla'>"
                                    +"<thead class=\"thead-dark\">"+
                                      "<tr>"+
                                        "<th scope=\"col\">Marca</th>"+
                                        "<th scope=\"col\">Direccion</th>"+
                                        "<th scope=\"col\" colspan='2'>Opciones</th>"+
                                    "</tr>"+
                                    "</thead>"
                                + "<tbody>");
                                String marca ="";
                                String direccion = "";
                                int id=0;
                                while(query3.next()){
                                    id=query3.getInt(1);
                                    marca=query3.getString(2);
                                    direccion = query3.getString(3);
                                      out.println(
                                      "<tr>"
                                              + "<td>"+marca+"</td>"
                                              + "<td>"+direccion+"</td>"
                                              + "<td><a href=\"eliminarMarca.jsp?boton=Hola&nose="+id+"\"><i class='far fa-trash-alt' id='icono1'></i></a></td>"
                                              + "<td><i class='far fa-edit' id='icono1' onclick=\"hola('"+marca+"','"+direccion+"')\"></i></td>"+
                                      "</tr>"
                                        );
                                }
                                out.print("</tbody>"+
                                  "</table></div></div>");   
                                
                            }else if("Buscar Talla".equals(request.getParameter("boton"))){
                                AccesoMarcas am=new AccesoMarcas();
                                ResultSet query3 = null;
                                String talla = request.getParameter("buscarTalla");
                                if("".equals(talla)){
                                    query3 = am.buscarTalla(1, "");
                                }else if(!"".equals(talla)){
                                    query3 = am.buscarTalla(2, talla);
                                }
                                out.print("<div align='center' id='tablaCae'>"
                                + "<div class='card text-center' id=\"divIniciar2\">"
                                + "<table class=\"table\" id='tabla'>"
                                    +"<thead class=\"thead-dark\">"+
                                      "<tr>"+
                                        "<th scope=\"col\">Talla</th>"+
                                        "<th scope=\"col\" colspan='2'>Opciones</th>"+
                                    "</tr>"+
                                    "</thead>"
                                + "<tbody>");
                                String tal ="";
                                int id=0;
                                while(query3.next()){
                                    id=query3.getInt(1);
                                    tal=query3.getString(2);
                                      out.println(
                                      "<tr>"
                                              + "<td>"+tal+"</td>"
                                              + "<td><a href=\"eliminarMarca.jsp?boton=Hola2&nose="+id+"\"><i class='far fa-trash-alt' id='icono1'></i></a></td>"
                                              + "<td><i class='far fa-edit' id='icono1' onclick=\"hola2('"+tal+"')\"></i></td>"+
                                      "</tr>"
                                        );
                                }
                                out.print("</tbody>"+
                                  "</table></div></div>");                                
                            }
                            out.println("<div align='center'><div class='container'>"
                            + "<div class='card text-center' id=\"ModificarMarca\" style=\"background-color: #c0392b;\">"
                                +"<div class=\"card-body\" >"+
                                    "<h3>Modificar Marca</h3>"+
                                    "<BR>"+
                                    "<form method=\"Post\" action=\"ServletModificarMarca\" id=\"registro\">"+
                                        "<div class=\"form-group\"><input type='hidden' id='oculto' name=\"oculto\"><input type='hidden' id='oculto2' name='oculto2'><label>Marca   <label>"+
                                            "<input type=\"text\" class=\"form-control form-control-lg\" placeholder=\"Nombre\" name=\"NombreMarca\" id='NombreMarca'>"+
                                        "</div>"+
                                        "<div class=\"form-group\"><label>Direccion   <label>"+
                                            "<input type=\"text\" class=\"form-control form-control-lg\" name=\"DireccionMarca\" placeholder=\"Direccion\" id='DireccionMarca'>"+
                                     "</div>"+
                                            "<br>"+
                                            "<input type=\"submit\" class=\"btn btn-outline-light btn-block\" value=\"Modificar Marca\" name='yanose'>"+
                                    "</form>"+
                                "</div>"
                                + "</div>"
                                + "</div></div>");
                            out.println("<div align='center'><div class='container'>"
                            + "<div class='card text-center' id=\"ModificarTalla\" style=\"background-color: #c0392b;\">"
                                +"<div class=\"card-body\" >"+
                                    "<h3>Modificar Talla</h3>"+
                                    "<BR>"+
                                    "<form method=\"Post\" action=\"ServletModificarMarca\" id=\"registro\">"+
                                        "<div class=\"form-group\"><input type='hidden' id='oculto3' name='oculto3'><label>Talla   <label>"+
                                            "<input type=\"text\" class=\"form-control form-control-lg\" placeholder=\"Talla\" name=\"NombreTalla\" id='NombreTalla'>"+
                                        "</div>"+
                                            "<br>"+
                                            "<input type=\"submit\" class=\"btn btn-outline-light btn-block\" value=\"Modificar Talla\" name='yanose'>"+
                                    "</form>"+
                                "</div>"
                                + "</div>"
                                + "</div></div>");
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
            function hola(marca, direccion){
                $('#tablaCat').hide();
                $('#ModificarMarca').show();                
                $("#DireccionMarca").val(direccion);       
                $("#NombreMarca").val(marca);
                $("#oculto").val(marca);
                $("#oculto2").val(direccion);
            }
            function hola2(talla){
                $('#tablaCae').hide();
                $('#ModificarTalla').show(); 
                $("#NombreTalla").val(talla);
                $("#oculto3").val(talla);
            }
                
            $("document").ready(function(){
                    $('#Buscar_Catalogo').hide();
                    $('#Registrar_Catalogo').show();
                    $('#Registrar_Catalogo2').css("background-color","white");
                    $('#Registrar_Catalogo2').css("color","black");    
                    $('#Consultar_Categoria').hide();
                    $('#Registrar_Categoria').show();
                    $('#Registrar_Categoria2').css("background-color","white");
                    $('#Registrar_Categoria2').css("color","black");
                    $('#ModificarMarca').hide();
                    $('#ModificarTalla').hide();

            });

            $("#Registrar_Categoria2").click(function(){
                    $('#Consultar_Categoria').hide();
                    $('#Registrar_Categoria').show();  
                    $('#Registrar_Categoria2').css("background-color","white");
                    $('#Registrar_Categoria2').css("color","black"); 
                    $('#Consultar_Categoria2').css("background-color","#C0392B");
                    $('#Consultar_Categoria2').css("color","white"); 
            });
            
            $("#Consultar_Categoria2").click(function(){
                    $('#Registrar_Categoria').hide();
                    $('#Consultar_Categoria').show();  
                    $('#Consultar_Categoria2').css("background-color","white");
                    $('#Consultar_Categoria2').css("color","black"); 
                    $('#Registrar_Categoria2').css("background-color","#C0392B");
                    $('#Registrar_Categoria2').css("color","white"); 
            });

            $("#Registrar_Catalogo2").click(function(){
                    $('#Buscar_Catalogo').hide();
                    $('#Registrar_Catalogo').show();  
                    $('#Registrar_Catalogo2').css("background-color","white");
                    $('#Registrar_Catalogo2').css("color","black"); 
                    $('#Consultar_Catalogos2').css("background-color","#C0392B");
                    $('#Consultar_Catalogos2').css("color","white"); 
            });

            $("#Consultar_Catalogos2").click(function(){
                    $('#Registrar_Catalogo').hide();
                    $('#Buscar_Catalogo').show(); 
                    $('#Registrar_Catalogo2').css("background-color","#C0392B");
                    $('#Registrar_Catalogo2').css("color","white"); 
                    $('#Consultar_Catalogos2').css("background-color","white");
                    $('#Consultar_Catalogos2').css("color","black");
            });
        </script>
    </body>
</html>

