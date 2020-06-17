<%-- 
    Document   : ConsultaUsuarios
    Created on : 22/04/2019, 03:58:25 PM
    Author     : angab
--%>

<%@page import="Modelo.AccesoUsuarios"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/all.js"></script>
        <link rel="stylesheet" href="css/main.css">
        <title>Usuarios</title>
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
                    out.println("<div align='center'><div class='container'>"
                            + "<div class='card text-center' id=\"divIniciar\" style=\"background-color: #c0392b;\">"
                            + "<div class=\"card-body\">"+
                                    "<form>"+
                                        "<input type=\"button\" id=\"BuscarUsuarios\" value=\"Consultar\" class=\"btn btn-outline-light\">"+
                                        "<input type=\"button\" id=\"CrearUsuarios\" value=\"Registrar\" class=\"btn btn-outline-light\">"+
                                    "</form>"+                                
                                "</div>"
                            + "<div class='card-body' id=\"busqueda\">"+
                                    "<h3>Buscar Usuarios</h3>"+
                                    "<BR>"+
                                    "<form action=\"ConsultaUsuarios.jsp\">"+
                                        "<div class=\"form-group\">"+
                                            "Busqueda por Usuario"+
                                        "</div>"+
                                        "<div class=\"form-group\">"+
                                            "<input type=\"text\" class=\"form-control form-control-lg\" placeholder=\"Buscar todo\" name=\"user\">"+
                                        "</div>"+
                                        "<div class=\"form-group\">"+
                                            "Busqueda por Tipo de Usuario     "
                                            + "<select name=\"tipo\" class='form-control'>"+
                                                "<option value=\"Todo\">Todo</option>"+
                                                "<option value=\"Administrador\">Administrador</option>"+
                                                "<option values=\"Usuario\">Usuario</option>"+
                                            "</select>"+
                                        "</div>"+
                                        "<br>"+
                                        "<input type=\"submit\" class=\"btn btn-outline-light btn-block\" value=\"Buscar\">"+
                                    "</form>"+
                                "</div>"
                            + "<div class='card-body' id=\"registro\">"+
                                    "<h3>Registrar Usuarios</h3>"+
                                    "<BR>"+
                                    "<form action=\"ServletInsertar\" method='Post'>"+
                                    "<div class=\"form-group\">"+
                                            "<input type=\"text\" class=\"form-control form-control-lg\" placeholder=\"Nombre\" name=\"nombre7\">"+
                                        "</div>"+
                                        "<div class=\"form-group\">"+
                                            "<input type=\"text\" class=\"form-control form-control-lg\" name=\"app7\" placeholder=\"Apellido Paterno\">"+
                                        "</div>"+
                                        "<div class=\"form-group\">"+
                                            "<input type=\"text\" class=\"form-control form-control-lg\" name=\"apm7\" placeholder=\"Apellido Materno\">"+
                                        "</div>"+
                                        "<div class=\"form-group\">"+
                                            "Sexo   "
                                        + "<select name=\"sexo7\" class='form-control'>"+
                                                "<option value=\"Masculino\">Masculino</option>"+
                                                "<option value=\"Femenino\">Femenino</option>"+
                                            "</select>"+
                                        "</div>"+
                                        "<div class=\"form-group\">"+
                                            "<input type=\"text\" class=\"form-control form-control-lg\" name=\"usuario7\" placeholder=\"Usuario\">"+
                                        "</div>"+
                                        "<div class=\"form-group\">"+
                                            "<input type=\"password\" class=\"form-control form-control-lg\" name=\"password7\" placeholder=\"Contraseña\">"+
                                        "</div>"+
                                        "<div class=\"form-group\">"+
                                            "Tipo de Usuario     "
                                            + "<select name=\"tipo7\" class='form-control'>"+
                                                "<option value=\"Administrador\">Administrador</option>"+
                                                "<option value=\"Usuario\">Usuario</option>"+
                                            "</select>"+
                                        "</div>"+
                                        "<br>"+
                                        "<input type=\"submit\" class=\"btn btn-outline-light btn-block\" value=\"Crear\">"+
                                    "</form>"+
                                "</div>"
                            + "</div></div></div>");
                        out.print("<div align='center' id='tabladiv'>"
                                + "<div class='card text-center' id=\"divIniciar2\">"
                                + "<table class=\"table\" id='tabla'>"
                                    +"<thead class=\"thead-dark\">"+
                                      "<tr>"+
                                        "<th scope=\"col\">Nombre</th>"+
                                        "<th scope=\"col\">Apellido Paterno</th>"+
                                        "<th scope=\"col\">Apellido Materno</th>"+
                                        "<th scope=\"col\">Sexo</th>"+
                                        "<th scope=\"col\">Usuario</th>"+
                                        "<th scope=\"col\">Contraseña</th>"+
                                        "<th scope=\"col\">Tipo</th>"+
                                        "<th scope=\"col\" colspan='2'>Opciones</th>"+
                                    "</tr>"+
                                    "</thead>"
                                + "<tbody>");
                        
                        ResultSet resultado = null;
                        AccesoUsuarios au = new AccesoUsuarios(); 
                        String user = request.getParameter("user");
                        String tipouser = request.getParameter("tipo");
                        
                        if("".equals(user) && "Todo".equals(tipouser)){
                            resultado = au.Listado();
                        }else if(!"".equals(user) && "Todo".equals(tipouser)){
                            resultado = au.BuscarPorNombre(user);
                        }else if(!"".equals(user) && !"Todo".equals(tipouser)){
                            resultado = au.BuscarNombreTipo(user, tipouser);
                        }else if("".equals(user) && !"Todo".equals(tipouser)){
                            resultado = au.BuscarTipo(tipouser);
                        }else{
                            resultado = null;
                        }
                        
                        String nombre="";
                        String app="";
                        String apm="";
                        String sexo="";
                        String usuario="";
                        String password ="";
                        String tipousuario ="";
                        int prov=0;
                        int id=0;
                        while(resultado.next()){
                            id = resultado.getInt(1);
                            nombre=resultado.getString(9);
                            app=resultado.getString(2);
                            apm=resultado.getString(3);
                            sexo=resultado.getString(6);
                            usuario=resultado.getString(4);
                            password=resultado.getString(5);
                            tipousuario=resultado.getString(7);
                            
                            if(!sesion.getAttribute("usuario").toString().equals(usuario)){
                                out.println(
                                      "<tr>"
                                              + "<td>"+nombre+"</td>"
                                              + "<td>"+app+"</td>"
                                              + "<td>"+apm+"</td>"
                                              + "<td>"+sexo+"</td>"
                                              + "<td>"+usuario+"</td>"
                                              + "<td>"+password+"</td>"
                                              + "<td>"+tipousuario+"</td>"
                                              + "<td><a href='eliminarUsuario.jsp?nose="+id+"'><i class='far fa-trash-alt' id='icono1'></i></a></td>"
                                              + "<td><i class='far fa-edit' id='icono1' onclick=\"hola('"+nombre+"','"+app+"','"+apm+"','"+sexo+"','"+usuario+"','"+password+"','"+tipousuario+"')\"></i></td>"+
                                      "</tr>"
                                );

                            }
                            
                            prov++;
                        }
                        out.print("</tbody>"+
                                  "</table></div></div>"+
                                "<div align='center'><div class='container'>"
                            + "<div class='card text-center' id=\"divIniciar3\" style=\"background-color: #c0392b;\">"
                                +"<div class=\"card-body\" id=\"ModificarUsuario\">"+
                                    "<h3>Modificar Usuario</h3>"+
                                    "<BR>"+
                                    "<form method=\"Post\" action=\"ServletModificar\" id=\"registro\">"+
                                        "<div class=\"form-group\"><label>Nombre   <label>"+
                                            "<input type=\"text\" class=\"form-control form-control-lg\" placeholder=\"Nombre\" name=\"nombre\" id='name'>"+
                                        "</div>"+
                                        "<div class=\"form-group\"><label>Apellido Paterno   <label>"+
                                            "<input type=\"text\" class=\"form-control form-control-lg\" name=\"app\" placeholder=\"Apellido Paterno\" id='app'>"+
                                        "</div>"+
                                        "<div class=\"form-group\"><label>Apellido Materno   <label>"+
                                            "<input type=\"text\" class=\"form-control form-control-lg\" name=\"apm\" placeholder=\"Apellido Materno\" id='apm'>"+
                                        "</div>"+
                                        "<div class=\"form-group\"><label>Sexo   <label>"+
                                            "<select name=\"sexo\" id='sexo' class='form-control'>"+
                                                "<option value=\"Masculino\">Masculino</option>"+
                                                "<option values=\"Femenino\">Femenino</option>"+
                                            "</select>"+
                                        "</div>"+
                                        "<div class=\"form-group\"><label>Usuario   <label>"+
                                            "<input type=\"text\" class=\"form-control form-control-lg\" name=\"usuario\" placeholder=\"Usuario\" id='usuario'>"+
                                        "</div>"+
                                        "<div class=\"form-group\"><label>Contraseña   <label>"+
                                            "<input type=\"text\" class=\"form-control form-control-lg\" name=\"password\" placeholder=\"Contraseña\" id='password'>"+
                                        "</div>"+
                                         "<div class=\"form-group\"><label>Tipo de Usuario   <label>"+
                                            "<select name=\"tipo\" id='tipo' class='form-control'>"+
                                                "<option value=\"Administrador\">Administrador</option>"+
                                                "<option values=\"Usuario\">Usuario</option>"+
                                                "<option values=\"Empleado\">Empleado</option>"+
                                            "</select><input type='hidden' id='oculto' name='oculto'>"+                                        
                                            "</div>"+
                                            "<br>"+
                                            "<input type=\"submit\" class=\"btn btn-outline-light btn-block\" value=\"Modificar\">"+
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
            $("document").ready(function(){
                $("#ModificarUsuario").hide();
                $("#registro").hide();
                $('#BuscarUsuarios').css("background-color","white");
                $('#BuscarUsuarios').css("color","black");
            });
            
            function hola(nombre, app, apm, sexo, user, pass, tipo){
                $("#ModificarUsuario").show();        
                $("#name").val(nombre);
                $("#app").val(app);
                $("#apm").val(apm);
                $("#sexo").val(sexo);
                $("#usuario").val(user);
                $("#password").val(pass);
                $("#tipo").val(tipo);
                $("#oculto").val(user);
                $("#tabladiv").hide();
            }

            $("#BuscarUsuarios").click(function(){
                    $('#registro').hide();
                    $('#busqueda').show();  
                    $('#BuscarUsuarios').css("background-color","white");
                    $('#BuscarUsuarios').css("color","black"); 
                    $('#CrearUsuarios').css("background-color","#C0392B");
                    $('#CrearUsuarios').css("color","white"); 
            });
            
            $("#CrearUsuarios").click(function(){
                    $('#busqueda').hide();
                    $('#registro').show();  
                    $('#CrearUsuarios').css("background-color","white");
                    $('#CrearUsuarios').css("color","black"); 
                    $('#BuscarUsuarios').css("background-color","#C0392B");
                    $('#BuscarUsuarios').css("color","white"); 
            });
        </script>
    </body>
</html>
