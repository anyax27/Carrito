<%-- 
    Document   : Inicio_2
    Created on : 14-jun-2020, 20:30:55
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
       Vector<Producto>vecPro=new Producto().listaProductos();  
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
         <font style="font-family: Bahnschrift Condensed"  style="color:#202022 " >
         <i>Productos</i>
         </font>
         </div>
        <div>
            <table align="center" width="725">
                <tr class="tabla" style="color: #FFFFFF">
                    <td>Número</td>
                    <td>Nombre</td>
                    <td>Stock</td>
                    <td>Precio</td>
                    <td>Descripción</td>
                    <td></td>
                </tr>
            <%
                for(Producto pro:vecPro){
            %>
           <tr>
               <td align="center" valign="top"><%=pro.getIdProducto()%> </td>
               <td><%=pro.getNombres()%></td>
               <td align="center" valign="top"><%=pro.getStock()%> </td>
               <td align="center" valign="top"><%=pro.getPrecio()%> </td>
               <td align="center" valign="top"><%=pro.getDescripcion()%> </td>
               <td align="center" valign="top">
               <a href="Agregar.jsp?cod=<%=pro.getIdProducto()%>">
               <input type="button" id="ingresar" class="boton2" value="Agregar producto">
               </a>
               </td>
            </tr>
            <%}%>
            </table>
        </div>
    </div>
    </body>
</html>
