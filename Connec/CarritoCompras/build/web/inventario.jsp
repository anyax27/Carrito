<%-- 
    Document   : inventario
    Created on : 27/04/2019, 01:39:32 PM
    Author     : angab
--%>

<%@page import="Modelo.AccesoZapatos"%>
<%@page import="Modelo.AccesoCatalogo"%>
<%@page import="Modelo.AccesoMarcas"%>
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
        <title>Inventario de Zapatos</title>
        <link rel="icon" type="image/jpeg" href="img/logo2.jpg">

    </head>

    <body>
        <%
            HttpSession sesion = request.getSession();
            
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
                                    "<h3>Buscar Zapatos</h3>"+
                                    "<BR>"+
                                    "<form action=\"inventario.jsp\">"+
                                        "<div class=\"form-group\">"+
                                            "Busqueda por Modelo"+
                                        "</div>"+
                                        "<div class=\"form-group\">"+
                                            "<input type=\"text\" class=\"form-control form-control-lg\" placeholder=\"Buscar todo\" name=\"busquedaModelo\">"+
                                        "</div>"+
                                        "<div class=\"form-group\">"+
                                            "Busqueda por Marca     "
                                            + "<select name=\"busquedaMarca\" class='form-control'>"
                            + "<option value='Todo'>Todo</option>");
                    AccesoMarcas am = new AccesoMarcas();
                    ResultSet query2 = null;
                    query2 = am.buscarMarca(1, "", "");
                    String marca2="";
                    while(query2.next()){
                        marca2 = query2.getString(2);
                        out.print("<option value='"+marca2+"'>"+marca2+"</option>");
                    }      
                    out.print("</select>"+
                                        "</div>"+
                                        "<div class=\"form-group\">"+
                                            "Busqueda por Talla     "
                                            + "<select name=\"busquedaTalla\" class='form-control'>"
                            + "<option value='Todo'>Todo</option>");
                    query2 = am.buscarTalla(1, "");
                    String talla2="";
                    while(query2.next()){
                        talla2 = query2.getString(2);
                        out.print("<option value='"+talla2+"'>"+talla2+"</option>");
                    } 
                    
                    out.print("</select>"
                            + "</div>"+
                             "<div class=\"form-group\">"+
                                            "Busqueda por Categoria     "
                                            + "<select name=\"busquedaCategoria\" class='form-control'>"
                            + "<option value='Todo'>Todo</option>");
                    AccesoCatalogo ac = new AccesoCatalogo();
                    query2 = ac.BuscarCategoria(1, "", "", 0);
                    String categoria2="";
                    while(query2.next()){
                        categoria2 = query2.getString(3)+"-"+query2.getString(2);
                        out.print("<option value='"+categoria2+"'>"+categoria2+"</option>");                           
                    }
                    
                    out.print("</select></div>"
                            + "<br>"+
                                        "<input type=\"submit\" class=\"btn btn-outline-light btn-block\" value=\"Buscar Zapato\" name='boton'>"+
                                    "</form>"+
                                "</div>"
                            + "<div class='card-body' id=\"registro\">"+
                                    "<h3>Registrar Zapatos</h3>"+
                                    "<BR>"+
                                    "<form action=\"ServletRegistrarZapato\" method='Post'>"+
                                    "<div class=\"form-group\">"+
                                            "<input type=\"text\" class=\"form-control form-control-lg\" placeholder=\"Modelo del zapato\" name=\"modelo\" id='modelo'>"+
                                        "</div>"+
                                    "<div class=\"form-group\">"+
                                            "<input type=\"text\" class=\"form-control form-control-lg\" placeholder=\"Cantidad\" name=\"cantidad\" id='cantidad'>"+
                                        "</div>"+
                                        "<div class=\"form-group\">"+
                                            "<input type=\"text\" class=\"form-control form-control-lg\" name=\"precio\" placeholder=\"Precio\">"+
                                        "</div>"+
                                        "<div class=\"form-group\">"+
                                            "<input type=\"text\" class=\"form-control form-control-lg\" name=\"imagen\" placeholder=\"Imagen de zapato\">"+
                                        "</div>"+
                                        "<div class=\"form-group\">"+
                                            "<textarea class=\"form-control form-control-lg\" name=\"descripcion\" placeholder=\"Descripcion del zapato\"></textarea>"+
                                        "</div>"+
                                        "<div class=\"form-group\">"+
                                            "Talla   "
                                        + "<select name=\"talla\" id='talla' class='form-control'>");
                    ResultSet query = am.buscarTalla(1, "");
                    String talla="";
                    while(query.next()){
                        talla = query.getString(2);
                        out.print("<option value='"+talla+"'>"+talla+"</option>");
                    }                    
                        out.print("</select>"+
                                        "</div>"+
                                        "<div class=\"form-group\">"+
                                            "Marca   "
                                        + "<select name=\"marca\" id='marca' class='form-control'>");
                    query = am.buscarMarca(1, "", "");
                    String marca="";
                    while(query.next()){
                        marca = query.getString(2);
                        out.print("<option value='"+marca+"'>"+marca+"</option>");
                    }       
                                
                                out.print("</select>"+
                                        "</div>"+
                                        "<div class=\"form-group\">"+
                                            "Categoria   "
                                        + "<select name=\"categoria\" id='categoria' class='form-control'>");
                    query = ac.BuscarCategoria(1, "", "", 0);
                    String categoria="";
                    while(query.next()){
                        categoria = query.getString(3)+"-"+query.getString(2);
                        out.print("<option value='"+categoria+"'>"+categoria+"</option>");                           
                    }
                        out.println("</select>"+
                                        "</div>"+
                                        "<br>"+
                                        "<input type=\"submit\" class=\"btn btn-outline-light btn-block\" value=\"Registrar Zapato\">"+
                                    "</form>"+
                                "</div>"
                            + "</div></div></div>");
                        
                     if("Buscar Zapato".equals(request.getParameter("boton"))){
                        
                        out.print("<div align='center' id='tabladiv456'>"
                                + "<div class='card text-center' id=\"divIniciar2\">"
                                + "<table class=\"table\" id='tabla123456'>"
                                    +"<thead class=\"thead-dark\" id='provisional'>"+
                                      "<tr>"+
                                        "<th scope=\"col\" id='thinventario'>Modelo</th>"+
                                        "<th scope=\"col\" id='thinventario'>Cantidad</th>"+
                                        "<th scope=\"col\" id='thinventario'>Precio</th>"+
                                        "<th scope=\"col\" id='thinventario'>Descripcion</th>"+
                                        "<th scope=\"col\" id='thinventario'>Talla</th>"+
                                        "<th scope=\"col\" id='thinventario'>Marca</th>"+
                                        "<th scope=\"col\" id='thinventario'>Categoria</th>"+
                                        "<th scope=\"col\" id='thinventario'>Catalogo</th>"+
                                        "<th scope=\"col\" id='thinventario'>Imagen</th>"+
                                        "<th scope=\"col\" id='thinventario' colspan='2'>Opciones</th>"+
                                    "</tr>"+
                                    "</thead>"
                                + "<tbody>");                        
                            
                        ResultSet resultado = null;
                        AccesoZapatos az = new AccesoZapatos();
                        String modelo = request.getParameter("busquedaModelo");
                        String marca3 = request.getParameter("busquedaMarca");
                        String talla3 = request.getParameter("busquedaTalla");
                        String categoria3 = request.getParameter("busquedaCategoria");

                        if("".equals(modelo) && !"Todo".equals(marca3) && !"Todo".equals(talla3) && !"Todo".equals(categoria3)){
                            resultado = az.buscar(14, modelo, marca3, talla3, categoria3);   
                        
                        }else if("".equals(modelo) && "Todo".equals(marca3) && "Todo".equals(talla3) && "Todo".equals(categoria3)){
                            resultado = az.buscar(1, modelo, marca3, talla3, categoria3);
                        
                        }else if("".equals(modelo) && !"Todo".equals(marca3) && !"Todo".equals(talla3) && !"Todo".equals(categoria3)){
                            resultado = az.buscar(2, modelo, marca3, talla3, categoria3);

                        }else if(!"".equals(modelo) && "Todo".equals(marca3) && "Todo".equals(talla3) && "Todo".equals(categoria3)){
                            resultado = az.buscar(3, modelo, marca3, talla3, categoria3);                            

                        }else if("".equals(modelo) && !"Todo".equals(marca3) && "Todo".equals(talla3) && "Todo".equals(categoria3)){
                            resultado = az.buscar(4, modelo, marca3, talla3, categoria3);
                            
                        }else if("".equals(modelo) && "Todo".equals(marca3) && !"Todo".equals(talla3) && "Todo".equals(categoria3)){
                            resultado = az.buscar(5, modelo, marca3, talla3, categoria3);
                            
                        }else if("".equals(modelo) && "Todo".equals(marca3) && "Todo".equals(talla3) && !"Todo".equals(categoria3)){
                            resultado = az.buscar(6, modelo, marca3, talla3, categoria3);

                        }else if(!"".equals(modelo) && !"Todo".equals(marca3) && "Todo".equals(talla3) && "Todo".equals(categoria3)){
                            resultado = az.buscar(7, modelo, marca3, talla3, categoria3);
                            
                        }else if(!"".equals(modelo) && "Todo".equals(marca3) && !"Todo".equals(talla3) && "Todo".equals(categoria3)){
                            resultado = az.buscar(8, modelo, marca3, talla3, categoria3);
                            
                        }else if(!"".equals(modelo) && "Todo".equals(marca3) && "Todo".equals(talla3) && !"Todo".equals(categoria3)){
                            resultado = az.buscar(9, modelo, marca3, talla3, categoria3);
                            
                        }else if("".equals(modelo) && !"Todo".equals(marca3) && !"Todo".equals(talla3) && "Todo".equals(categoria3)){
                            resultado = az.buscar(10, modelo, marca3, talla3, categoria3);
                            
                        }else if("".equals(modelo) && !"Todo".equals(marca3) && "Todo".equals(talla3) && !"Todo".equals(categoria3)){
                            resultado = az.buscar(11, modelo, marca3, talla3, categoria3);
                            
                        }else if("".equals(modelo) && "Todo".equals(marca3) && !"Todo".equals(talla3) && !"Todo".equals(categoria3)){
                            resultado = az.buscar(12, modelo, marca3, talla3, categoria3);    
                            
                        }else if(!"".equals(modelo) && !"Todo".equals(marca3) && !"Todo".equals(talla3) && "Todo".equals(categoria3)){
                            resultado = az.buscar(13, modelo, marca3, talla3, categoria3);                              
                            
                        }else{
                            resultado=null;
                        }
                        
                        if(resultado!=null){
                            String modelo2="";
                            int cantidad=0;
                            float precio4 = 0;
                            String descripcion="";
                            String marca4="";
                            String talla4="";
                            String categoria4 ="";
                            String catalogo = "";
                            int id=0;
                            String zaz = "";
                            String imagen = "";
                            while(resultado.next()){
                                id = resultado.getInt(1);
                                modelo2 = resultado.getString(2);
                                cantidad = resultado.getInt(3);
                                precio4 = resultado.getFloat(4);
                                descripcion = resultado.getString(5);
                                talla4 = resultado.getString(6);
                                marca4 = resultado.getString(7);
                                categoria4 = resultado.getString(8);
                                catalogo = resultado.getString(9);
                                imagen = resultado.getString(10);
                                zaz = catalogo+"-"+categoria4;
                                
                                    out.println(
                                          "<tr>"
                                                  + "<td>"+modelo2+"</td>"
                                                  + "<td>"+cantidad+"</td>"
                                                  + "<td>"+precio4+"</td>"
                                                  + "<td>"+descripcion+"</td>"
                                                  + "<td>"+talla4+"</td>"
                                                  + "<td>"+marca4+"</td>"
                                                  + "<td>"+categoria4+"</td>"
                                                  + "<td>"+catalogo+"</td>"
                                                  + "<td><img src='"+imagen+"' width=100 height=100></td>"
                                                    + "<td><a href='eliminarZapato.jsp?nose="+id+"'><i class='far fa-trash-alt' id='icono1'></i></a></td>"
                                                  + "<td><i class='far fa-edit' id='icono1' onclick=\"hola('"+modelo2+"', '"+cantidad+"'"
                                                          + ", '"+precio4+"', '"+imagen+"', '"+descripcion+"', '"+talla4+"', '"+marca4+"', '"+zaz+"', '"+id+"')\"></i></td>"+
                                          "</tr>");
                                }
                                out.print("</tbody></table></div></div>");
                            
                            }                            
                        }                                
                                out.print("<div align='center'><div class='container'>"
                                + "<div class='card text-center' id=\"divIniciar3\" style=\"background-color: #c0392b;\">"
                                    +"<div class=\"card-body\" id=\"ModificarUsuario\">"+
                                    "<h3>Modificar Zapatos</h3>"+
                                    "<BR>"+
                                    "<form action=\"ServletModificarZapato\" method='Post'>"+
                                    "<div class=\"form-group\"><input type='hidden' id='ocultoModelo' name='ocultoModelo'><input type='hidden' id='ocultoTalla' name='ocultoTalla'><input type='hidden' id='ocultoId' name='ocultoId'>"+
                                            "<input type=\"text\" class=\"form-control form-control-lg\" placeholder=\"Modelo del zapato\" name=\"modificarModelo\" id='modificarModelo'>"+
                                        "</div>"+
                                    "<div class=\"form-group\">"+
                                            "<input type=\"text\" class=\"form-control form-control-lg\" placeholder=\"Cantidad\" name=\"modificarCantidad\" id='modificarCantidad'>"+
                                        "</div>"+
                                        "<div class=\"form-group\">"+
                                            "<input type=\"text\" class=\"form-control form-control-lg\" name=\"modificarPrecio\" placeholder=\"Precio\" id='modificarPrecio'>"+
                                        "</div>"+
                                        "<div class=\"form-group\">"+
                                            "<input type=\"text\" class=\"form-control form-control-lg\" name=\"modificarImagen\" placeholder=\"Imagen de zapato\" id='modificarImagen'>"+
                                        "</div>"+
                                        "<div class=\"form-group\">"+
                                            "<textarea class=\"form-control form-control-lg\" name=\"modificarDescripcion\" placeholder=\"Descripcion del zapato\" id='modificarDescripcion'></textarea>"+
                                        "</div>"+
                                        "<div class=\"form-group\">"+
                                            "Talla   "
                                        + "<select name=\"modificarTalla\" id='modificarTalla' class='form-control'>");
                    query = am.buscarTalla(1, "");
                    talla="";
                    while(query.next()){
                        talla = query.getString(2);
                        out.print("<option value='"+talla+"'>"+talla+"</option>");
                    }                    
                        out.print("</select>"+
                                        "</div>"+
                                        "<div class=\"form-group\">"+
                                            "Marca   "
                                        + "<select name=\"modificarMarca\" id='modificarMarca' class='form-control'>");
                    query = am.buscarMarca(1, "", "");
                    marca="";
                    while(query.next()){
                        marca = query.getString(2);
                        out.print("<option value='"+marca+"'>"+marca+"</option>");
                    }       
                                
                                out.print("</select>"+
                                        "</div>"+
                                        "<div class=\"form-group\">"+
                                            "Categoria   "
                                        + "<select name=\"modificarCategoria\" id='modificarCategoria' class='form-control'>");
                    query = ac.BuscarCategoria(1, "", "", 0);
                    categoria="";
                    while(query.next()){
                        categoria = query.getString(3)+"-"+query.getString(2);
                        out.print("<option value='"+categoria+"'>"+categoria+"</option>");                           
                    }
                        out.println("</select>"+
                                        "</div>"+
                                        "<br>"+
                                        "<input type=\"submit\" class=\"btn btn-outline-light btn-block\" value=\"Modificar Zapato\">"+
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
           
           function hola(modelo, cantidad, precio, imagen, descripcion, talla, marca, categoria, id){
                $("#tabladiv456").hide();
                $("#ModificarUsuario").show();
                $("#modificarModelo").val(modelo);
                $("#modificarCantidad").val(cantidad);
                $("#modificarPrecio").val(precio);
                $("#modificarImagen").val(imagen);
                $("#modificarDescripcion").val(descripcion);
                $("#modificarTalla").val(talla);
                $("#modificarMarca").val(marca);
                $("#modificarCategoria").val(categoria);
                $("#ocultoModelo").val(modelo);
                $("#ocultoTalla").val(talla); 
                $("#ocultoId").val(id);
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
