<%-- 
    Document   : eliminarUsuario
    Created on : 22/04/2019, 10:29:27 PM
    Author     : angab
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Modelo.AccesoUsuarios"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Eliminar Usuario</title>
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
                        AccesoUsuarios au = new AccesoUsuarios();
                        ResultSet resultado = au.BuscarId(id);
                        int prov=0;
                        String usuario="";
                        while(resultado.next()){
                            prov++;
                            usuario=resultado.getString(4);
                        }
                        if(prov==0){
                            out.println("<center style='padding-top: 20px;'><h1>Lo sentimos ese usuario no existe</h1><center>"
                                    + "<center style='padding-top: 20px;'><a href='ConsultaUsuarios.jsp'><input type='button' value='Regresar' class='btn btn-success' style='width: 200px;'></a></center>");
                        }else if(prov==1){
                            boolean bandera = false;
                            bandera = au.Eliminar(id);
                            if(bandera){
                            out.println("<center style='padding-top: 20px;'><h1>Usuario "+usuario+" borrado exitosamente</h1><center>"
                                    + "<center style='padding-top: 20px;'><a href='ConsultaUsuarios.jsp'><input type='button' value='Regresar' class='btn btn-success' style='width: 200px;'></a></center>");
                            }else{
                                 out.println("<center style='padding-top: 20px;'><h1>Lo sentimos pero ocurrio un error</h1><center>"
                                    + "<center style='padding-top: 20px;'><a href='ConsultaUsuarios.jsp'><input type='button' value='Regresar' class='btn btn-success' style='width: 200px;'></a></center>");
                            }              
                        }else{
                            out.println("<center style='padding-top: 20px;'><h1>Lo sentimos ese usuario no existe</h1><center>"
                                    + "<center style='padding-top: 20px;'><a href='ConsultaUsuarios.jsp'><input type='button' value='Regresar' class='btn btn-success' style='width: 200px;'></a></center>");
                        }
                    }catch(NumberFormatException ex){
                            out.println("<center style='padding-top: 20px;'><h1>Ocurrio un Error</h1><center>"
                                    + "<center style='padding-top: 20px;'><a href='ConsultaUsuarios.jsp'><input type='button' value='Regresar' class='btn btn-success' style='width: 200px;'></a></center>");

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
