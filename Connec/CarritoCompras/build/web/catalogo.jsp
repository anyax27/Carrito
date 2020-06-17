<<%-- 
    Document   : catalogo
    Created on : 23/04/2019, 01:05:04 AM
    Author     : angab
--%>

<%@page import="Modelo.AccesoCatalogo"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/all.js"></script>
        <link rel="stylesheet" href="css/main.css">
        <link rel="icon" type="image/jpeg" href="img/logo2.jpg">

        <title>Catalogos</title>
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
                                    "<h3>Registrar Catalogo</h3>"+
                                    "<BR>"+
                                    "<form action=\"ServletRegistroCatalogo\" method='Post'>"+
                                        "<div class=\"form-group\">"+
                                            "<input type=\"text\" class=\"form-control form-control-lg\" placeholder=\"Nombre del Catalogo\" name=\"catalogo\">"+
                                        "</div>"+
                                        "<div class=\"form-group\">"+
                                            "<input type=\"text\" class=\"form-control form-control-lg\" placeholder=\"Imagen del Catalogo\" name=\"url\">"+
                                        "</div>"+
                                        "<br>"+
                                        "<input type=\"submit\" class=\"btn btn-outline-light btn-block\" value=\"Crear Catalogo\" name='boton'>"+
                                    "</form>"+
                                "</div>"
                            + "<div class='card-body' id='Buscar_Catalogo'>"+
                                    "<h3>Buscar Catalogo</h3>"+
                                    "<BR>"+
                                    "<form action=\"catalogo.jsp\">"+
                                        "<div class=\"form-group\">"+
                                            "Buscar por Nombre del Catalogo"+
                                        "</div>"+
                                        "<div class=\"form-group\">"+
                                            "<input type=\"text\" class=\"form-control form-control-lg\" placeholder=\"Buscar Todo\" name=\"buscarCatalogo\">"+
                                        "</div>"+
                                        "<br>"+
                                        "<input type=\"submit\" class=\"btn btn-outline-light btn-block\" value=\"Buscar Catalogo\" name='boton'>"+
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
                                    "<h3>Registrar Categorias</h3>"+
                                    "<BR>"+
                                    "<form action=\"ServletRegistroCatalogo\" method='Post'>"+
                                        "<div class=\"form-group\">"+
                                            "<input type=\"text\" class=\"form-control form-control-lg\" placeholder=\"Nombre de la Categoria\" name=\"Categoria15\">"+
                                        "</div>"+
                                        "<div class=\"form-group\"><label>Catologo perteneciente</label>"+
                                            "<select name=\"tipoCatalogo\" class='form-control'>");
                            ResultSet query = null;
                            AccesoCatalogo ac = new AccesoCatalogo();
                            query = ac.Listado();
                            while(query.next()){
                                String catalogo = query.getString(2);
                                out.println("<option value='"+catalogo+"'>"+catalogo+"</option>");
                            }          
                            out.print("</select>"+
                                        "</div>"+
                                        "<br>"+
                                        "<input type=\"submit\" class=\"btn btn-outline-light btn-block\" value=\"Crear Categoria\" name='boton'>"+
                                    "</form>"+
                                "</div>"+
                             "<div class='card-body' id=\"Consultar_Categoria\">"+
                                    "<h3>Buscar Categorias</h3>"+
                                    "<BR>"+
                                    "<form action=\"catalogo.jsp\">"+
                                        "<div class=\"form-group\">"+
                                            "Busqueda por Nombre de la Categoria"+
                                        "</div>"+
                                        "<div class=\"form-group\">"+
                                            "<input type=\"text\" class=\"form-control form-control-lg\" placeholder=\"Buscar Todo\" name=\"BuscarCategoria\">"+
                                        "</div>"+
                                        "<div class=\"form-group\">"+
                                            "Busqueda por Catalogo Perteneciente     "
                                            + "<select name=\"tipoCatalogo23\" class='form-control'>"
                                    + "<option value='Todo'>Todo</option>");
                            ResultSet query2 = null;
                            query2 = ac.Listado();                            
                            while(query2.next()){
                                String catalogo = query2.getString(2);
                                out.println("<option value='"+catalogo+"'>"+catalogo+"</option>");
                            }     
                            out.print("</select>"+
                                        "</div>"+
                                        "<br>"+
                                        "<input type=\"submit\" class=\"btn btn-outline-light btn-block\" value=\"Buscar Categoria\" name='boton'>"+
                                    "</form>"+
                                "</div>"                            
                               +"</div></div></div>");
                            
                            if("Buscar Catalogo".equals(request.getParameter("boton"))){
                                ResultSet query3 = null;
                                if("".equals(request.getParameter("buscarCatalogo"))){
                                    query3 = ac.Listado();
                                }else if(!"".equals(request.getParameter("buscarCatalogo"))){
                                    query3 = ac.Buscar(request.getParameter("buscarCatalogo"));
                                }
                                out.print("<div align='center' id='tablaCat'>"
                                + "<div class='card text-center' id=\"divIniciar2\">"
                                + "<table class=\"table\" id='tabla'>"
                                    +"<thead class=\"thead-dark\">"+
                                      "<tr>"+
                                        "<th scope=\"col\">Nombre</th>"+
                                        "<th scope=\"col\">Portada</th>"+
                                        "<th scope=\"col\" colspan='2'>Opciones</th>"+
                                    "</tr>"+
                                    "</thead>"
                                + "<tbody>");
                                String nombre ="";
                                String img = "";
                                int id=0;
                                while(query3.next()){
                                    id=query3.getInt(1);
                                    nombre=query3.getString(2);
                                    img = query3.getString(3);
                                      out.println(
                                      "<tr>"
                                              + "<td>"+nombre+"</td>"
                                              + "<td><img src='"+img+"' width=150 height=100></td>"
                                              + "<td><a href=\"eliminarCatalogo.jsp?boton=Hola&nose="+id+"\"><i class='far fa-trash-alt' id='icono1'></i></a></td>"
                                              + "<td><i class='far fa-edit' id='icono1' onclick=\"hola('"+nombre+"','"+img+"')\"></i></td>"+
                                      "</tr>"
                                        );
                                }
                                out.print("</tbody>"+
                                  "</table></div></div>");   
                                
                            }else if("Buscar Categoria".equals(request.getParameter("boton"))){
                                
                                ResultSet query3 = null;
                                String catalogo = request.getParameter("tipoCatalogo23");
                                String categoria = request.getParameter("BuscarCategoria");
                                if("".equals(request.getParameter("BuscarCategoria")) && "Todo".equals(request.getParameter("tipoCatalogo23"))){
                                    query3 = ac.BuscarCategoria(1, categoria, catalogo, 0);
                                }else if(!"".equals(request.getParameter("BuscarCategoria")) && !"Todo".equals(request.getParameter("tipoCatalogo23"))){
                                    query3 = ac.BuscarCategoria(4, categoria, catalogo, 0);
                                }else if(!"".equals(request.getParameter("BuscarCategoria")) && "Todo".equals(request.getParameter("tipoCatalogo23"))){
                                    query3 = ac.BuscarCategoria(3, categoria, catalogo, 0);                                    
                                }else if("".equals(request.getParameter("BuscarCategoria")) && !"Todo".equals(request.getParameter("tipoCatalogo23"))){
                                    query3 = ac.BuscarCategoria(2, categoria, catalogo, 0);
                                }
                                out.print("<div align='center' id='tablaCae'>"
                                + "<div class='card text-center' id=\"divIniciar2\">"
                                + "<table class=\"table\" id='tabla'>"
                                    +"<thead class=\"thead-dark\">"+
                                      "<tr>"+
                                        "<th scope=\"col\">Categoria</th>"+
                                        "<th scope=\"col\">Catalogo</th>"+
                                        "<th scope=\"col\">Portada Catalogo</th>"+
                                        "<th scope=\"col\" colspan='2'>Opciones</th>"+
                                    "</tr>"+
                                    "</thead>"
                                + "<tbody>");
                                String nombre ="";
                                String nombreCatalogo="";
                                String img = "";
                                int id=0;
                                while(query3.next()){
                                    id=query3.getInt(1);
                                    nombre=query3.getString(2);
                                    nombreCatalogo = query3.getString(3);
                                    img = query3.getString(4);
                                      out.println(
                                      "<tr>"
                                              + "<td>"+nombre+"</td>"
                                              + "<td>"+nombreCatalogo+"</td>"
                                              + "<td><img src='"+img+"' width=150 height=100></td>"
                                              + "<td><a href=\"eliminarCatalogo.jsp?boton=Hola2&nose="+id+"\"><i class='far fa-trash-alt' id='icono1'></i></a></td>"
                                              + "<td><i class='far fa-edit' id='icono1' onclick=\"hola2('"+nombre+"','"+nombreCatalogo+"','"+id+"')\"></i></td>"+
                                      "</tr>"
                                        );
                                }
                                out.print("</tbody>"+
                                  "</table></div></div>");                                
                            }
                            out.println("<div align='center'><div class='container'>"
                            + "<div class='card text-center' id=\"ModificarCat\" style=\"background-color: #c0392b;\">"
                                +"<div class=\"card-body\" >"+
                                    "<h3>Modificar Catalogo</h3>"+
                                    "<BR>"+
                                    "<form method=\"Post\" action=\"ServletModificarCatalogo\" id=\"registro\">"+
                                        "<div class=\"form-group\"><label>Nombre   <label>"+
                                            "<input type=\"text\" class=\"form-control form-control-lg\" placeholder=\"Nombre\" name=\"NombreCat\" id='NameCat'>"+
                                        "</div>"+
                                        "<div class=\"form-group\"><label>Imagen   <label>"+
                                            "<input type=\"text\" class=\"form-control form-control-lg\" name=\"URLCat\" placeholder=\"URL de la imagen\" id='URLCat'>"+
                                        "<input type='hidden' name='provisional' id='provisional'>"
                                    + "</div>"+
                                            "<br>"+
                                            "<input type=\"submit\" class=\"btn btn-outline-light btn-block\" value=\"Modificar Catalogo\" name='yanose'>"+
                                    "</form>"+
                                "</div>"
                                + "</div>"
                                + "</div></div>");
                            out.println("<div align='center'><div class='container'>"
                            + "<div class='card text-center' id=\"ModificarCae\" style=\"background-color: #c0392b;\">"
                                +"<div class=\"card-body\" >"+
                                    "<h3>Modificar Categoria</h3>"+
                                    "<BR>"+
                                    "<form method=\"Post\" action=\"ServletModificarCatalogo\" id=\"registro\">"+
                                        "<div class=\"form-group\"><label>Nombre   <label>"+
                                            "<input type=\"text\" class=\"form-control form-control-lg\" placeholder=\"Nombre\" name=\"NombreCae\" id='NombreCae'>"+
                                        "</div>"+
                                        "<div class=\"form-group\"><label>Catalogo   <label>"+
                                        "<select name='catalogoCae' id='catalogoCae' class='form-control'>");
                            ResultSet query4 = null;
                            query4 = ac.Listado();
                            while(query4.next()){
                                String catalogo = query4.getString(2);
                                out.println("<option value='"+catalogo+"'>"+catalogo+"</option>");
                            }          
                            out.print("</select>"
                                    + "<input type='hidden' name='provisional2' id='provisional2'>"+
                                        "</div>"+
                                            "<br>"+
                                            "<input type=\"submit\" class=\"btn btn-outline-light btn-block\" value=\"Modificar Categoria\" name='yanose'>"+
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
            function hola(nombre, url){
                $('#tablaCat').hide();
                $('#ModificarCat').show();                
                $("#NameCat").val(nombre);       
                $("#URLCat").val(url);
                $("#provisional").val(nombre);
            }
            function hola2(nombre, catalogo, id){
                $('#tablaCae').hide();
                $('#ModificarCae').show(); 
                $("#NombreCae").val(nombre);
                $("#catalogoCae").val(catalogo);
                $("#provisional2").val(id);
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
                    $('#ModificarCae').hide();
                    $('#ModificarCat').hide();

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
