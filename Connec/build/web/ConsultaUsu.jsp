<%-- 
    Document   : ConsultaUsu
    Created on : 17-jun-2020, 0:26:05
    Author     : users
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Controlador.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
    <%
       Vector<Usuarios>vecPro=new Usuarios().listaUsuarios();  
    %>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/Style.css">
        <script src="js/proteger.js"></script>
        <title>Productos</title>
    </head>
    <body style="background-color:#F2BEA0">
        <header>
        <div class="wrapper" style="font-family: Bahnschrift Condensed">
            <br>
            <div class="logo" style="font-family:Bookman Old Style" style="font-size:"><b><i>Pictures</i></b> 
                        </div>
			<nav>
				<a href="Inicio_2.jsp">Consultar Productos</a>
				<a href="ConsultaUsu.jsp">Consultar Usuarios</a>
                                <a href="index.jsp">Cerrar sesión</a>
			</nav>
		</div>
        <br>
        </header>
        <div class="carri2" id="carri2">
            <div class="titulo" style="text-align: center">
         <font style="font-family: Bahnschrift Condensed"  style="color:#202022 ">
         <i>Clientes</i>
         </font>
         </div>
        <div>
            <table align="center" width="725">
                <tr class="tabla" style="color: #FFFFFF">
                    <td>Id</td>
                    <td>Nombre</td>
                    <td>Apellido</td>
                    <td>Correo</td>
                    <td>Contraseña</td>
                </tr>
            <%
                for(Usuarios pro:vecPro){
            %>
           <tr>
               <td align="center" valign="top"><%=pro.getId_usuarios()%> </td>
               <td><%=pro.getNombre_cliente()%></td>
               <td align="center" valign="top"><%=pro.getApellido_cliente()%> </td>
               <td align="center" valign="top"><%=pro.getCorreo_cliente()%> </td>
               <td align="center" valign="top"><%=pro.getContra_cliente()%> </td>
               <td align="center" valign="top">
               </td>
            </tr>
            <%}%>
            </table>
            <br>
        </div>
    </div>
    </body>
</html>