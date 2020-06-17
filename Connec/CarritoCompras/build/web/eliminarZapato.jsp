<%-- 
    Document   : eliminarZapato
    Created on : 26/04/2019, 10:39:13 PM
    Author     : angab
--%>

<%@page import="Modelo.AccesoZapatos"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Eliminar Zapato</title>
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
                    try{
                        int id = Integer.parseInt(request.getParameter("nose"));
                        AccesoZapatos az = new AccesoZapatos();
                        
                        ResultSet resultado = az.buscar(0, Integer.toString(id), "", "", "");
                        int prov=0;
                        String modelo = "";
                        while(resultado.next()){
                            modelo = resultado.getString(2);
                            prov++;
                        }
                        if(prov==0){
                            out.println("<center style='padding-top: 20px;'><h1>Lo sentimos ese registro no existe</h1><center>"
                                    + "<center style='padding-top: 20px;'><a href='inventario.jsp'><input type='button' value='Regresar' class='btn btn-success' style='width: 200px;'></a></center>");

                        }else{
                            az.eliminarZapato(id);
                            out.println("<center style='padding-top: 20px;'><h1>Modelo de Zapato "+modelo+" borrado exitosamente</h1><center>"
                                    + "<center style='padding-top: 20px;'><a href='inventario.jsp'><input type='button' value='Regresar' class='btn btn-success' style='width: 200px;'></a></center>");
                        }                             
                    }catch(NumberFormatException ex){
                            out.println("<center style='padding-top: 20px;'><h1>Ocurrio un Error</h1><center>"
                                    + "<center style='padding-top: 20px;'><a href='inventario.jsp'><input type='button' value='Regresar' class='btn btn-success' style='width: 200px;'></a></center>");
                        
                    }
                    }else{
                        response.sendRedirect("index.jsp");
                    }      
                }else{
                    response.sendRedirect("index.jsp");
                }
            
        %>
    </body>
</html>
