<%-- 
    Document   : Agregar.jsp
    Created on : 16-jun-2020, 20:41:30
    Author     : users
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="Controlador.*" %>

   <%
    Producto pro=new Producto().buscarProducto(Integer.parseInt(request.getParameter("cod")));
    %>
<!DOCTYPE html>
<html>
    <head>
        <script src="js/proteger.js"></script>
        <title>
		Agregar Productos 
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
				<a href="ConsultaUsu.jsp">Consultar Usuarios</a>
                                <a href="index.jsp">Cerrar sesión</a>
			</nav>
	</div>
        <br>
    </header>
        <br>
        <div class="in">
            <div class="titulo">
          
         <font style="font-family: Bahnschrift Condensed"  style="color:#202022 " >
         <i>AGREGAR</i>
         </font>
         </div>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <form name="frmPrincipal" action="SAgregarCarro2"  method="post">

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
            <span><i>Cantidad a Agregar :</i></span>
            <br>
        </td>
        <td><input name="txtCantidadPedir" type="text" id="txtCantidadPedir" value="1" size="15"></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>
            <br>
            <label>
                <input type="submit" name="button" id="button" value="Agregar" class="boton">
        </label>
        <br>
        </td>
      
      </tr>
    </table>

    </form>
        </div> 
        
    </body>
</html>
