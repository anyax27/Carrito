<%-- 
    Document   : eliminarCatalogo
    Created on : 23/04/2019, 07:06:29 PM
    Author     : angab
--%>

<%@page import="Modelo.AccesoCatalogo"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Eliminar Catalogo</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/all.js"></script>
        <link rel="stylesheet" href="css/main.css">
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
                    String boton = request.getParameter("boton");

                    if("Hola".equals(boton)){
                        try{
                            int id = Integer.parseInt(request.getParameter("nose"));
                            AccesoCatalogo ac = new AccesoCatalogo();
                            ResultSet resultado = ac.BuscarId(id);
                            int prov=0;
                            String catalogo="";
                            while(resultado.next()){
                                prov++;
                                catalogo=resultado.getString(2);
                            }
                            if(prov==0){
                                out.println("<center style='padding-top: 20px;'><h1>Lo sentimos ese catalogo no existe</h1><center>"
                                        + "<center style='padding-top: 20px;'><a href='catalogo.jsp'><input type='button' value='Regresar' class='btn btn-success' style='width: 200px;'></a></center>");
                            }else{
                                resultado = ac.BuscarCategoria(6, "", "", id);
                                int idCategoria = 0;
                                while(resultado.next()){
                                    idCategoria = resultado.getInt(1);
                                }
                                ac.Eliminar(catalogo, id, idCategoria);
                                out.println("<center style='padding-top: 20px;'><h1>Catalogo "+catalogo+" borrado exitosamente</h1><center>"
                                        + "<center style='padding-top: 20px;'><a href='catalogo.jsp'><input type='button' value='Regresar' class='btn btn-success' style='width: 200px;'></a></center>");
                            }             
                        }catch(NumberFormatException ex){
                            out.println("<center style='padding-top: 20px;'><h1>Ocurrio un Error</h1><center>"
                                    + "<center style='padding-top: 20px;'><a href='catalogo.jsp'><input type='button' value='Regresar' class='btn btn-success' style='width: 200px;'></a></center>");
       
                        }
                    }else if("Hola2".equals(boton)){
                        try{
                            int id = Integer.parseInt(request.getParameter("nose"));
                            AccesoCatalogo ac = new AccesoCatalogo();
                            ResultSet resultado = ac.BuscarCategoria(5, "","",id);
                            int prov=0;
                            String categoria="";
                            String catalogo="";
                            while(resultado.next()){
                                prov++;
                                categoria=resultado.getString(2);
                                catalogo=resultado.getString(3);
                            }
                            if(prov==0){
                                out.println("<center style='padding-top: 20px;'><h1>Lo sentimos esa categoria no existe</h1><center>"
                                        + "<center style='padding-top: 20px;'><a href='catalogo.jsp'><input type='button' value='Regresar' class='btn btn-success' style='width: 200px;'></a></center>");

                            }else{
                                ac.EliminarCategoria(id);
                                out.println("<center style='padding-top: 20px;'><h1>Categoria "+categoria+" del Catalogo "+catalogo+" borrado exitosamente</h1><center>"
                                        + "<center style='padding-top: 20px;'><a href='catalogo.jsp'><input type='button' value='Regresar' class='btn btn-success' style='width: 200px;'></a></center>");

                            }   
                        }catch(NumberFormatException ex){
                            out.println("<center style='padding-top: 20px;'><h1>Ocurrio un Error</h1><center>"
                                    + "<center style='padding-top: 20px;'><a href='catalogo.jsp'><input type='button' value='Regresar' class='btn btn-success' style='width: 200px;'></a></center>");

                        }
                    }else{
                        response.sendRedirect("catalogo.jsp");
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

