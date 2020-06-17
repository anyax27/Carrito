<%-- 
    Document   : añadirCarrito
    Created on : 30/04/2019, 10:13:00 PM
    Author     : angab
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.AccesoZapatos"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/all.js"></script>
        <link rel="stylesheet" href="css/main.css">
        <title>Añadir Zapato</title>
        <link rel="icon" type="image/jpeg" href="img/logo2.jpg">

    <body>
<%
        HttpSession sesion = request.getSession();
        
        if(sesion.getAttribute("usuario")!=null && sesion.getAttribute("tipo")!=null){
            
            int tipo = Integer.parseInt(sesion.getAttribute("tipo").toString());
            
            if(tipo==3){
                try{
                    int id = Integer.parseInt(request.getParameter("nose"))-479;

                    AccesoZapatos az = new AccesoZapatos();
                    ResultSet query = az.buscar(0, Integer.toString(id), "", "", "");

                    if(query!=null){
                        List<String> listaElementos = (List<String>) session.getAttribute("carrito");
                        if (listaElementos == null) {
                            listaElementos = new ArrayList<String>();
                            session.setAttribute("carrito", listaElementos);
                        }
                        int prov=0;
                        for (String elem : listaElementos) {
                            if(elem.equals(Integer.toString(id))){
                                prov++;
                            }
                        }                    
                        if(prov==0){
                            listaElementos.add(Integer.toString(id));
                            out.println("<center style='padding-top: 20px;'><h1>Zapato añadido Correctamente</h1></center>"
                                    + "<center style='padding-top: 20px;'><a href='comprar.jsp'><input type='button' value='Regresar' class='btn btn-success' style='width: 200px;'></a></center>");                         
                        }else{
                            out.println("<center style='padding-top: 20px;'><h1>Ese Zapato ya fue añadido</h1></center>"
                                    + "<center style='padding-top: 20px;'><a href='comprar.jsp'><input type='button' value='Regresar' class='btn btn-success' style='width: 200px;'></a></center>");                         

                        }

                    }else{
                        out.println("<h1>Lo sentimos pero ese modelo no esta registrado</h1>");
                    }
                }catch(NumberFormatException ex){
                            out.println("<center style='padding-top: 20px;'><h1>Ocurrio un error</h1></center>"
                                    + "<center style='padding-top: 20px;'><a href='comprar.jsp'><input type='button' value='Regresar' class='btn btn-success' style='width: 200px;'></a></center>");                         

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
