<%-- 
    Document   : comprar
    Created on : 27/04/2019, 08:14:00 PM
    Author     : angab
--%>

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
        <title>Comprar</title>
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
                                    +"<label id='Bienvenida'>Compras productos</label><br>"
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
                    
                    AccesoCatalogo ac = new AccesoCatalogo();
                    AccesoMarcas am = new AccesoMarcas();
                    ResultSet query = null;
                    query = ac.Listado();
                    if(query!=null){
                        String imagen="";
                        String catalogo = "";
                        out.println("<div class='container52' id='cartas'>");
                        int id=0;
                        while(query.next()){
                            id=query.getInt(1);
                            catalogo=query.getString(2);
                            imagen = query.getString(3);
                            out.print("<a href='comprar.jsp?opcion="+(id+489)+"'><div class='card52'>"
                                    + "<img src='"+imagen+"'>"
                                    + "<h4 >Catalogo "+catalogo+"</h4>");
                                out.println("</div></a>");
                        }
                        out.println("</div>");
                    }
                        String opcion = request.getParameter("opcion");
                        if(opcion!=null){
                            query = ac.BuscarId(Integer.parseInt(opcion)-489);
                            String catalogo="";
                            int id=0;
                            if(query!=null){
                                while(query.next()){
                                    catalogo=query.getString(2);
                                }
                                query = ac.BuscarCategoria(2, "", catalogo, 0);
                                if(query!=null){
                                    out.println("<div class='container50' id='cartasCategorias'>"
                                            + "<h4>Selecciona una Categoria del Catalogo "+catalogo+"...</h4><a href='comprar.jsp' id='otro'><i class='fas fa-undo-alt' width=100 height=100 id='icono2'></i></a>"
                                                    + "<div class='container52' id='provisional52'>");
                                    String categoria="";
                                    while(query.next()){
                                        id=query.getInt(1);
                                        categoria=query.getString(2);
      /*Aqui we*/                           out.print("<a href='comprar.jsp?opcion2="+(id+989)+"'><div class='card52' id='provisional53'>"
                                                + "<h4> "+categoria+"</h4>");
                                            out.println("</div><a>");                                        
                                    }
                                    out.println("</div></div>");                                    
                                }
                            }
                        }
                        opcion = request.getParameter("opcion2");
                        if(opcion!=null){
                            out.println("<div align='center'><div class='container'>"
                                    + "<div class='card text-center' id=\"divIniciar\" style=\"background-color: #c0392b;\">"
                                    + "<div class=\"card-body\">"+
                                    "<h3>Buscar Zapatos <a href='comprar.jsp' id='otro'><i class='fas fa-undo-alt' width=100 height=100 id='icono2'></i></a></h3>"+
                                    "<BR>"+
                                    "<form action=\"comprar.jsp\">"+
                                        "<div class=\"form-group\">"+
                                            "Busqueda por Modelo"+
                                        "</div>"+
                                        "<div class=\"form-group\">"+
                                            "<input type=\"text\" class=\"form-control form-control-lg\" placeholder=\"Buscar todo\" name=\"busquedaModelo\">"+
                                        "</div>"+
                                        "<div class=\"form-group\">"+
                                            "Busqueda por Precio"+
                                        "</div>"+
                                        "<div class=\"form-group\">"
                                        + "<div class='row'>"+
                                                "<div class=\"col-lg-6\">"+
                                                    "<input type=\"text\" class=\"form-control form-control-lg\" placeholder=\"Buscar Todo (Minimo)\" name=\"busquedaMinimo\">"
                                                + "</div>"+
                                                "<div class=\"col-lg-6\">"+
                                                    "<input type=\"text\" class=\"form-control form-control-lg\" placeholder=\"Buscar Todo (Maximo)\" name=\"busquedaMaximo\">"+
                                                "</div>"
                                        + "</div>"+
                                        "<div>"
                                    + "<div class=\"form-group\"><input type='hidden' name='opcion2' value='"+opcion+"'>"+
                                            "Busqueda por Marca     "
                                            + "<select name=\"busquedaMarca\" class='form-control'>"
                            + "<option value='Todo'>Todo</option>");
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
                                            "<br>"+
                                                    "<input type=\"submit\" class=\"btn btn-outline-light btn-block\" value=\"Buscar Zapato\" name='boton'>"+
                                                "</form>"+
                                            "</div></div></div></div>");
                        }
                                String boton = request.getParameter("boton");
                                String nose = request.getParameter("opcion2");
                                if("Buscar Zapato".equals(boton) && nose!=null){
                                    int id2 = Integer.parseInt(nose);
                                    AccesoZapatos az = new AccesoZapatos();
                                    Validacion validar = new Validacion();
                                    String modelo = request.getParameter("busquedaModelo");
                                    String precioMinimo = request.getParameter("busquedaMinimo");
                                    String precioMaximo = request.getParameter("busquedaMaximo");
                                    String marca = request.getParameter("busquedaMarca");
                                    String talla = request.getParameter("busquedaTalla");
                                    ResultSet resultado = null;
                                    if("".equals(modelo) && "".equals(precioMinimo) && "".equals(precioMaximo) && "Todo".equals(marca) && "Todo".equals(talla)){
                                        resultado = az.busquedaUsuario(1, (id2-989), 0, 0, "", "", "");

                                    }else if(!"".equals(modelo) && !"".equals(precioMinimo) && !"".equals(precioMaximo) && !"Todo".equals(marca) && !"Todo".equals(talla)){
                                        if(validar.validarPrecio(precioMinimo) && validar.validarPrecio(precioMaximo)){
                                            resultado = az.busquedaUsuario(2, (id2-989), Float.parseFloat(precioMinimo), Float.parseFloat(precioMaximo), talla, marca, modelo);                                            

                                        }else{
                                            out.println("<script>alert('Por favor introduzca valores validos en los precios');</script>");
                                            resultado = null;
                                        }
                                    }else if(!"".equals(modelo) && "".equals(precioMinimo) && "".equals(precioMaximo) && "Todo".equals(marca) && "Todo".equals(talla)){
                                        resultado = az.busquedaUsuario(3, (id2-989), 0, 0, "", "", modelo);
                                    
                                    }else if("".equals(modelo) && !"".equals(precioMinimo) && !"".equals(precioMaximo) && "Todo".equals(marca) && "Todo".equals(talla)){
                                        if(validar.validarPrecio(precioMinimo) && validar.validarPrecio(precioMaximo)){
                                            resultado = az.busquedaUsuario(4, (id2-989), Float.parseFloat(precioMinimo), Float.parseFloat(precioMaximo), "", "", "");                                            

                                        }else{
                                            out.println("<script>alert('Por favor introduzca valores validos en los precios');</script>");
                                            resultado = null;
                                        }
                                        
                                    }else if("".equals(modelo) && "".equals(precioMinimo) && "".equals(precioMaximo) && !"Todo".equals(marca) && "Todo".equals(talla)){
                                        resultado = az.busquedaUsuario(5, (id2-989), 0, 0, "", marca, "");
                                        
                                    }else if("".equals(modelo) && "".equals(precioMinimo) && "".equals(precioMaximo) && "Todo".equals(marca) && !"Todo".equals(talla)){
                                        resultado = az.busquedaUsuario(6, (id2-989), 0, 0, talla, "", "");
                                        
                                    }else if(!"".equals(modelo) && !"".equals(precioMinimo) && !"".equals(precioMaximo) && "Todo".equals(marca) && "Todo".equals(talla)){
                                        if(validar.validarPrecio(precioMinimo) && validar.validarPrecio(precioMaximo)){
                                            resultado = az.busquedaUsuario(7, (id2-989), Float.parseFloat(precioMinimo), Float.parseFloat(precioMaximo), "", "", modelo);                                            

                                        }else{
                                            out.println("<script>alert('Por favor introduzca valores validos en los precios');</script>");
                                            resultado = null;
                                        }                                        
                                    }else if(!"".equals(modelo) && "".equals(precioMinimo) && "".equals(precioMaximo) && !"Todo".equals(marca) && "Todo".equals(talla)){
                                        resultado = az.busquedaUsuario(8, (id2-989), 0, 0, "", marca, modelo);
                                        
                                    }else if(!"".equals(modelo) && "".equals(precioMinimo) && "".equals(precioMaximo) && "Todo".equals(marca) && !"Todo".equals(talla)){
                                        resultado = az.busquedaUsuario(9, (id2-989), 0, 0, talla, "", modelo);
                                        
                                    }else if("".equals(modelo) && !"".equals(precioMinimo) && !"".equals(precioMaximo) && !"Todo".equals(marca) && "Todo".equals(talla)){
                                        if(validar.validarPrecio(precioMinimo) && validar.validarPrecio(precioMaximo)){
                                            resultado = az.busquedaUsuario(10, (id2-989), Float.parseFloat(precioMinimo), Float.parseFloat(precioMaximo), "", marca, "");                                            

                                        }else{
                                            out.println("<script>alert('Por favor introduzca valores validos en los precios');</script>");
                                            resultado = null;
                                        }                                            
                                    }else if("".equals(modelo) && !"".equals(precioMinimo) && !"".equals(precioMaximo) && "Todo".equals(marca) && !"Todo".equals(talla)){
                                        if(validar.validarPrecio(precioMinimo) && validar.validarPrecio(precioMaximo)){
                                            resultado = az.busquedaUsuario(11, (id2-989), Float.parseFloat(precioMinimo), Float.parseFloat(precioMaximo), talla, "", "");                                            

                                        }else{
                                            out.println("<script>alert('Por favor introduzca valores validos en los precios');</script>");
                                            resultado = null;
                                        }                                        
                                    }else if("".equals(modelo) && "".equals(precioMinimo) && "".equals(precioMaximo) && !"Todo".equals(marca) && !"Todo".equals(talla)){
                                        resultado = az.busquedaUsuario(12, (id2-989), 0, 0, talla, marca, "");
                                        
                                    }else if(!"".equals(modelo) && !"".equals(precioMinimo) && !"".equals(precioMaximo) && !"Todo".equals(marca) && "Todo".equals(talla)){
                                        if(validar.validarPrecio(precioMinimo) && validar.validarPrecio(precioMaximo)){
                                            resultado = az.busquedaUsuario(13, (id2-989), Float.parseFloat(precioMinimo), Float.parseFloat(precioMaximo), "", marca, modelo);                                            

                                        }else{
                                            out.println("<script>alert('Por favor introduzca valores validos en los precios');</script>");
                                            resultado = null;
                                        }                                            
                                    }else if(!"".equals(modelo) && !"".equals(precioMinimo) && !"".equals(precioMaximo) && "Todo".equals(marca) && !"Todo".equals(talla)){
                                        if(validar.validarPrecio(precioMinimo) && validar.validarPrecio(precioMaximo)){
                                            resultado = az.busquedaUsuario(14, (id2-989), Float.parseFloat(precioMinimo), Float.parseFloat(precioMaximo), talla, "", modelo);                                            

                                        }else{
                                            out.println("<script>alert('Por favor introduzca valores validos en los precios');</script>");
                                            resultado = null;
                                        }                                          
                                    }else if("".equals(modelo) && !"".equals(precioMinimo) && !"".equals(precioMaximo) && !"Todo".equals(marca) && !"Todo".equals(talla)){
                                        if(validar.validarPrecio(precioMinimo) && validar.validarPrecio(precioMaximo)){
                                            resultado = az.busquedaUsuario(15, (id2-989), Float.parseFloat(precioMinimo), Float.parseFloat(precioMaximo), talla, marca, "");                                            

                                        }else{
                                            out.println("<script>alert('Por favor introduzca valores validos en los precios');</script>");
                                            resultado = null;
                                        }                                         
                                    }else if(!"".equals(modelo) && "".equals(precioMinimo) && "".equals(precioMaximo) && !"Todo".equals(marca) && !"Todo".equals(talla)){
                                        resultado = az.busquedaUsuario(16, (id2-989), 0, 0, talla, marca, modelo);
                                    
                                    }else{
                                        resultado = null;
                                        out.println("<script>alert('Esa opcion no es valida');</script>");
                                    }  
                                    
                                    if(resultado!=null){
                                        out.print("<div align='center' id='tabladiv'>"
                                            + "<div class='card text-center' id=\"divIniciar2\">"
                                            + "<table class=\"table\" id='tabla'>"
                                                +"<thead class=\"thead-dark\">"+
                                                  "<tr>"+
                                                    "<th scope=\"col\">Modelo</th>"+
                                                    "<th scope=\"col\">Precio</th>"+
                                                    "<th scope=\"col\">Talla</th>"+
                                                    "<th scope=\"col\">Marca</th>"+
                                                    "<th scope=\"col\">Categoria</th>"+
                                                    "<th scope=\"col\">Descripción</th>"+
                                                    "<th scope=\"col\">Imagen</th>"+
                                                    "<th scope=\"col\">Opciones</th>"+
                                                "</tr>"+
                                                "</thead>"
                                            + "<tbody>");
                                        String modelo2="";
                                        String precio2="";
                                        String talla2="";
                                        String marca2="";
                                        String categoria2="";
                                        String descripcion="";
                                        String imagen="";
                                        int id=0;
                                        int cant = 0;
                                        while(resultado.next()){
                                            id = resultado.getInt(1);
                                            modelo2 = resultado.getString(2);
                                            precio2 = Float.toString(resultado.getFloat(4));
                                            talla2 = resultado.getString(6);
                                            marca2 = resultado.getString(7);
                                            categoria2 = resultado.getString(9)+" - "+resultado.getString(8);
                                            descripcion = resultado.getString(5);
                                            imagen = resultado.getString(10);
                                            
                                            cant = Integer.parseInt(resultado.getString(3));
                                            if(cant>0){
                                                out.println(
                                                  "<tr>"
                                                          + "<td>"+modelo2+"</td>"
                                                          + "<td>"+precio2+"</td>"
                                                          + "<td>"+talla2+"</td>"
                                                          + "<td>"+marca2+"</td>"
                                                          + "<td>"+categoria2+"</td>"
                                                          + "<td>"+descripcion+"</td>"
                                                          + "<td><img src='"+imagen+"' width=100 height=100></td>"
                                                          + "<td><a href='añadirCarrito.jsp?nose="+(id+479)+"'><i class='fas fa-cart-plus' id='icono1'></i></a></td>"
                                                  +"</tr>");                                                
                                            }

                                        
                                        }
                                        out.print("</tbody>"+
                                            "</table></div></div></div>");
                                    }
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
            
            $("document").ready(function(){
                <%
                    String opcion2 = request.getParameter("opcion");
                    String opcion3 = request.getParameter("opcion2");
                    if(opcion2!=null || opcion3!=null){
                        out.println("$('#cartas').hide();");
                    }
                    if(opcion3!=null){
                        out.println("$('#cartasCategorias').hide();");                        
                    }
                %>
            });            
        </script>

    </body>
</html>
