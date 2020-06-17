<%-- 
    Document   : Compra
    Created on : 5/06/2020, 09:05:15 PM
    Author     : Eda
--%>


<%--
AgregarProducto2
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
    Producto pro=new Producto().buscarProducto(Integer.parseInt(request.getParameter("cod")));
    %>
<!DOCTYPE html>
<html>
    <head>
        <script src="js/proteger.js"></script>
        <title>
		Compras 
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
        <br>
        <div class="in">
            <div class="titulo">
          
         <font style="font-family: Bahnschrift Condensed"  style="color:#202022 " >
         <i>PEDIDO</i>
         <img src="img/img.png" width="60" height="50">
         </font>
         </div>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <form name="frmPrincipal" action="SAgregarCarro"  method="post">

        <table width="50%" border="0" cellpadding="0" align="center" >
        <tr>
            <td width="30%">
                <br>
                <span><i>Codigo:</i></span>
                <br>
            </td>
        <td width="50%"><label>
          <input name="txtCodigo" type="text" id="txtCodigo" size="10" readonly value="<%=pro.getIdProducto()%>" >
        </label></td>
      </tr>
      <br>
      <tr>
          <td>
              <br>
              <span><i>Producto:</i></span>
              <br>
          </td>
        <td><input name="txtProducto" type="text" id="txtProducto" size="20" readonly value="<%=pro.getNombres()%>" ></td>
      </tr>
      <tr>
        <td>
            <br>
            <span><i>Precio:</i></span>
            <br>
        </td>
        <td><input name="txtPrecio" type="text" id="txtPrecio" size="15" readonly value="<%=pro.getPrecio()%>">  </td>
      </tr>
      <tr>
        <td>
            <br>
            <span><i>Stock:</i></span>
            <br
        </td>
        <td><input name="txtStock" type="text" id="txtStock" size="15" readonly value="<%=pro.getStock()%>" ></td>
      </tr>
      <tr>
        <td >
            <br>
            <span><i>Cantidad Pedir :</i></span>
            <br>
        </td>
        <td><input name="txtCantidadPedir" type="text" id="txtCantidadPedir" value="1" size="15"></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>
            <br>
            <label>
                <input type="submit" name="button" id="button" value="Registrar" class="boton">
        </label>
        <br>
        </td>
      
      </tr>
    </table>

    </form>
        </div> 
        
    </body>
</html>
