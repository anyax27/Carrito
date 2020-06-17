<%-- 
    Document   : eliminarMarca
    Created on : 25/04/2019, 02:45:51 AM
    Author     : angab
--%>

<%@page import="Modelo.AccesoMarcas"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Eliminar Marca</title>
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
                            AccesoMarcas am = new AccesoMarcas();
                            ResultSet resultado = am.buscarId(1, id);
                            int prov=0;
                            String marca="";
                            while(resultado.next()){
                                prov++;
                                marca=resultado.getString(2);
                            }
                            if(prov==0){
                            out.println("<center style='padding-top: 20px;'><h1>Lo sentimos esa marca no existe</h1><center>"
                                    + "<center style='padding-top: 20px;'><a href='marcas.jsp'><input type='button' value='Regresar' class='btn btn-success' style='width: 200px;'></a></center>");
                            }else{
                                am.eliminarMarca(marca, id);
                            out.println("<center style='padding-top: 20px;'><h1>Marca "+marca+" borrada exitosamente</h1><center>"
                                    + "<center style='padding-top: 20px;'><a href='marcas.jsp'><input type='button' value='Regresar' class='btn btn-success' style='width: 200px;'></a></center>");
                            }  
                        }catch(NumberFormatException ex){
                            out.println("<center style='padding-top: 20px;'><h1>Ocurrio un Error</h1><center>"
                                    + "<center style='padding-top: 20px;'><a href='marcas.jsp'><input type='button' value='Regresar' class='btn btn-success' style='width: 200px;'></a></center>");
                            
                        }
                    }else if("Hola2".equals(boton)){
                        try{
                            int id = Integer.parseInt(request.getParameter("nose"));
                            AccesoMarcas am = new AccesoMarcas();
                            ResultSet resultado = am.buscarId(2, id);
                            int prov=0;
                            String talla="";
                            while(resultado.next()){
                                prov++;
                                talla=resultado.getString(2);
                            }
                            if(prov==0){
                            out.println("<center style='padding-top: 20px;'><h1>Lo sentimos esa talla no existe</h1><center>"
                                    + "<center style='padding-top: 20px;'><a href='marcas.jsp'><input type='button' value='Regresar' class='btn btn-success' style='width: 200px;'></a></center>");
                            }else{
                                am.eliminarTalla(talla, id);
                            out.println("<center style='padding-top: 20px;'><h1>Talla "+talla+" borrado exitosamente</h1><center>"
                                    + "<center style='padding-top: 20px;'><a href='marcas.jsp'><input type='button' value='Regresar' class='btn btn-success' style='width: 200px;'></a></center>");
                            }   
                        }catch(NumberFormatException ex){
                            out.println("<center style='padding-top: 20px;'><h1>Ocurrio un Error</h1><center>"
                                    + "<center style='padding-top: 20px;'><a href='marcas.jsp'><input type='button' value='Regresar' class='btn btn-success' style='width: 200px;'></a></center>");
                            
                        }
                    }else{
                        response.sendRedirect("marcas.jsp");
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