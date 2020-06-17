<%-- 
    Document   : CasiFinal
    Created on : 16-jun-2020, 20:53:42
    Author     : users
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="Controlador.*" %>

 <%
        Vector<Detalleventa> vectorDetalles=(Vector<Detalleventa>)session.getAttribute("detalleVenta");
        Vector<Producto> vectorStock=null;
    %>
<!DOCTYPE html>
<html>
     <head>
        <script src="js/proteger.js"></script>
        <title>
		Final :3 
	</title>
        <link rel="stylesheet" type="text/css" href="css/Style.css">
        <script type="text/javascript" src="js/Administrar.js"></script>
	<meta charset="utf-8">
    </head>
    <body style="background-color:#F2BEA0">
         <header>
        <div class="wrapper" style="font-family: Bahnschrift Condensed">
            <br>
            <div class="logo" style="font-family:Bookman Old Style" style="font-size:"><b><i>Pictures</i></b> 
                        </div>
			<nav>
				<a href="Inicio_2.jsp">Consultar Productos</a>
				<a href="#">Consultar Usuarios</a>
                                <a href="index.jsp">Cerrar sesión</a>
			</nav>
	</div>
        <br>
    </header>
        
        <div class="in">
            <br>
            <br>
            <br>
            <br>
             <table align="center" width="50%">
                   <tr>
                       <td width="84" bgcolor="#E6B098"></td>
                       <td width="716" bgcolor="#E6B098" ><h1>Historial</h1></td>
                    <td bgcolor="#E6B098"></td>
                  </tr>
                <tr class="tabla" style="color: #FFFFFF">
                    <td>Nombre</td>
                    <td>Cantidad a Agregar</td>
                </tr>
                     <%
            for(Detalleventa det:vectorDetalles){
                Producto pro=new Producto().buscarProducto(det.getIdProducto());
          %>
                <tr bgcolor="#F2EDD5">
                    <td><%=pro.getNombres() %></td>
                    <td><%=det.getDetVenta_Cantidad()%></td>
                </tr>
              
               <%}%>       
             
            </table>
            <br>
            <br>
               <a href="SFinalizarCompra2" style="font-family: Bahnschrift Condensed">FINALIZAR</a>
        </div> 
    </body>
</html>
