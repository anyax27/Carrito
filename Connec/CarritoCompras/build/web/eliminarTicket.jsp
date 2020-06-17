<%-- 
    Document   : eliminarTicket
    Created on : 10/05/2019, 04:43:56 PM
    Author     : angab
--%>

<%@page import="Modelo.AccesoTicket"%>
<%@page import="java.io.ObjectInputStream"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Eliminar Ticket</title>
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
                    String folio = request.getParameter("fol");
                    try{
                      System.out.println(folio);
                      String a = "";
                      for(String s : folio.split(" ")){ //los numeros estan separados por espacios
                         a+=String.valueOf((char)Integer.parseInt(s, 2));// vease API
                      }
                      AccesoTicket at = new AccesoTicket();
                      boolean bandera = at.eliminarTicket(a);
                      if(bandera){
                            out.println("<center style='padding-top: 20px;'><h1>Folio "+a+" de venta eliminado correctamente</h1><center>"
                                    + "<center style='padding-top: 20px;'><a href='Compras.jsp'><input type='button' value='Regresar' class='btn btn-success' style='width: 200px;'></a></center>");
                      }else{
                            out.println("<center style='padding-top: 20px;'><h1>Ocurrio un error por favor vuelve a intentarlo</h1><center>"
                                    + "<center style='padding-top: 20px;'><a href='Compras.jsp'><input type='button' value='Regresar' class='btn btn-success' style='width: 200px;'></a></center>");
                      }
                    }catch(NumberFormatException ex){
                            out.println("<center style='padding-top: 20px;'><h1>Ocurrio un Error</h1><center>"
                                    + "<center style='padding-top: 20px;'><a href='Compras.jsp'><input type='button' value='Regresar' class='btn btn-success' style='width: 200px;'></a></center>");
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
