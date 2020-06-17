<%-- 
    Document   : Carrito
    Created on : 5/06/2020, 11:57:28 PM
    Author     : Eda
--%>
<%--
Mostrar carrito
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="Controlador.*" %>
<%
    HttpSession objsesion = request.getSession(false);
    String usuario = (String)objsesion.getAttribute("usuario");
    if(usuario.equals("")){
        response.sendRedirect("index.jsp");
    }
%>

 <%
        Vector<Detalleventa> vectorDetalles=(Vector<Detalleventa>)session.getAttribute("detalleVenta");
        Vector<Producto> vectorStock=null;
    %>
<!DOCTYPE html>
<html>
     <head>
        <script src="js/proteger.js"></script>
        <title>
		Carrito 
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
				<a href="Inicio.jsp">Inicio</a>
				<a href="Principal.jsp">Fotos</a>
                                <a href="D_A.jsp">Derechos de Autor</a>
                                <a href="grafito.jsp">Graficas</a>
			</nav>
	</div>
        <br>
    </header>
        
        <div class="in">
            <br>
            <br>
            <br>
            <br>
             <table align="center" width="80%">
                   <tr>
                       <td width="84" bgcolor="#E6B098"><img src="img/img.png" width="84" height="77" /></td>
                       <td width="700" bgcolor="#E6B098"><font style="font-family: Bahnschrift Condensed" size="20">Carrito de Compas</font></td>
                    <td bgcolor="#E6B098"></td>
                  </tr>
                <tr class="tabla" style="color: #FFFFFF">
                    <td>Nombre</td>
                    <td>Cantidad</td>
                    <td> Sub Total</td>
                </tr>
                     <%
            for(Detalleventa det:vectorDetalles){
                Producto pro=new Producto().buscarProducto(det.getIdProducto());
          %>
                <tr bgcolor="#F2EDD5">
                    <td><%=pro.getNombres() %></td>
                    <td><%=det.getDetVenta_Cantidad()%></td>
                    <td><%=det.getDetVenta_SubTotal() %></td>
                </tr>
              
               <%}%>       
             
            </table>
            <br>
            <br>
               <a href="SFinalizarCompra"> 
                <input type="button" id="ingresar" class="boton2" value="Finalizar Compras">
               </a>
        </div> 
    </body>
</html>
