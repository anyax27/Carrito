<%-- 
    Document   : eliminarCarrito
    Created on : 30/04/2019, 11:16:28 PM
    Author     : angab
--%>

<%@page import="java.util.List"%>
<%@page import="Modelo.AccesoZapatos"%>
<%@page import="Modelo.AccesoMarcas"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Eliminar de Carrito</title>
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
                if(tipo==3){
                    try{
                        int id = Integer.parseInt(request.getParameter("nose"))-479;    
                        List<String> listaElementos = (List<String>) session.getAttribute("carrito");
                        AccesoZapatos az = new AccesoZapatos();
                        ResultSet query = az.buscar(0, Integer.toString(id), "", "", "");
                        if(query!=null){
                            int prov=0;
                            int posicion=0;
                            int i=0;
                            for (String elem : listaElementos) {
                                if(elem.equals(Integer.toString(id))){
                                    prov++;
                                    posicion=i;
                                }
                                i++;
                            }
                            if(prov!=0){
                                listaElementos.remove(posicion);
                            out.println("<center style='padding-top: 20px;'><h1>Zapato eliminado correctamente</h1></center>"
                                    + "<center style='padding-top: 20px;'><a href='carrito.jsp'><input type='button' value='Regresar' class='btn btn-success' style='width: 200px;'></a></center>");                         

                            }else{
                            out.println("<center style='padding-top: 20px;'><h1>Ese registro no existe en tu carrito de compras</h1></center>"
                                    + "<center style='padding-top: 20px;'><a href='carrito.jsp'><input type='button' value='Regresar' class='btn btn-success' style='width: 200px;'></a></center>");                         

                            }
                        }else{
                            out.println("<center style='padding-top: 20px;'><h1>Ese registro no existe</h1></center>"
                                    + "<center style='padding-top: 20px;'><a href='carrito.jsp'><input type='button' value='Regresar' class='btn btn-success' style='width: 200px;'></a></center>");                         

                        }
                    }catch(NumberFormatException ex){
                            out.println("<center style='padding-top: 20px;'><h1>Ocurrio un error</h1></center>"
                                    + "<center style='padding-top: 20px;'><a href='carrito.jsp'><input type='button' value='Regresar' class='btn btn-success' style='width: 200px;'></a></center>");                         
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