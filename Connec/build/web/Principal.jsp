<%-- 
    Document   : Principal
    Created on : 5/06/2020, 10:43:37 PM
    Author     : Eda
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controlador.*" %>
<%@page import="java.util.*" %>
<%
    HttpSession objsesion = request.getSession(false);
    String usuario = (String)objsesion.getAttribute("usuario");
    if(usuario.equals("")){
        response.sendRedirect("index.jsp");
    }
%>


    <%
       Vector<Producto>vecPro=new Producto().listaProductos();  
    %>


<!DOCTYPE html>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<html>
<head>
	<title>
		Compras 
	</title>
        <link rel="stylesheet" type="text/css" href="css/Style.css">
        <script type="text/javascript" src="js/Administrar.js"></script>
	<meta charset="utf-8">
        <script src="js/proteger.js"></script>
         
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
                                <a href="SCerrarSesion">Cerrar sesión</a>
			</nav>
		</div>
        <br>
    </header>
    <br>
    
    <div class="carri" id="carri">
         <div class="titulo">
         <font style="font-family: Bahnschrift Condensed"  style="color:#202022 " >
         <i>Producto</i>
         </font>
         <img src="img/img.png" width="60" height="50">
         </div>
        <div>
            <table align="center" width="250">
                <tr class="tabla" style="color: #FFFFFF">
                    <td>Nombre</td>
                    <td>Stock</td>
                    <td> Precio</td>
                </tr>
            <%
                for(Producto pro:vecPro){
            %>
           <tr>
               <td><%=pro.getNombres()%></td>
               <td align="right" valign="top"><%=pro.getStock()%> </td>
               <td align="right" valign="top"><%=pro.getPrecio()%> </td>
            </tr>
            <%}%>
            </table>
        </div>
    </div>
          
     <div class="fotos">
         <br>
         <br>
         
         <div class="titulo">
         <font style="font-family: Bahnschrift Condensed"  style="color:#202022 " >
         <i>FLORES</i>
         </font>
         </div>
         <br>
         <br>
         <br>
         <br>
         <br>
         <br>
         <br>
         <div class="flor">
             <img src="img/flor.jpeg" width="200" height="200"> 
             <br>
             <br>
             <br>
             <a href="#ventana">
                 <font style="font-family: Bahnschrift Condensed">
                     INFORMACION
                 </font>
             </a>
             <br>
             <form>
            
                 <a href="Compra.jsp?cod=1">
                 <input class="boton"type="button" value="Añadir al carrito" id="caja">
                 </a>
                </form>
         </div>
                 
    
         <div class="flor">
             <img src="img/flor2.jpeg"width="200" height="300" id="1">
             <a href="#ventana2">
                 <font style="font-family: Bahnschrift Condensed">
                     INFORMACION
                 </font>
             </a>
             <br>
             <br>
             <form>
                 <a href="Compra.jsp?cod=2">
                 <input class="boton" type="button" value="Añadir al carrito" id="caja2">   
                 </a>
                </form>
         </div>
         <div class="flor">
             <img src="img/flor3.jpeg" width="200" height="300" id="2">
             <a href="#ventana3">
                 <font style="font-family: Bahnschrift Condensed">
                     INFORMACION
                 </font>
             </a>
             <form>
                <a href="Compra.jsp?cod=3">
                <input class="boton" type="button" value="Añadir al carrito" id="caja3">  
                </a>
             </form>
         </div>
         <div class="flor">
             <img src="img/flor4.jpeg"  width="200" height="300">
              <a href="#ventana4">
                 <font style="font-family: Bahnschrift Condensed">
                     INFORMACION
                 </font>
             </a>
             <form>
                 <a href="Compra.jsp?cod=4">
                 <input class="boton" type="button" value="Añadir al carrito" id="caja4"> 
                 </a>
                </form>
         </div>
         <div class="flor">
             <img src="img/flor5.jpeg"  width="200" height="300">
             <a href="#ventana5">
                 <font style="font-family: Bahnschrift Condensed">
                     INFORMACION
                 </font>
             </a>
             <form>
                 <a href="Compra.jsp?cod=5">
                 <input class="boton" type="button" value="Añadir al carrito" id="caja5"> 
                 </a>
                </form>
         </div>
         
         <div class="flor" >
             <img src="img/flor6.jpeg"  width="200" height="300">
             <a href="#ventana6">
                 <font style="font-family: Bahnschrift Condensed">
                     INFORMACION
                 </font>
             </a>
             <form>
                 <a href="Compra.jsp?cod=6">
                 <input class="boton" type="button" value="Añadir al carrito" id="caja6">  
                 </a>
                </form>
         </div>
        
          <div class="flor">
             <img src="img/flor7.jpeg"  width="200" height="300">
             <a href="#ventana7">
                 <font style="font-family: Bahnschrift Condensed">
                     INFORMACION
                 </font>
             </a>
             <form>
                 <a href="Compra.jsp?cod=7">
                 <input class="boton" type="button" value="Añadir al carrito" id="caja7" > 
                 </a>
                </form>
         </div>
          <div class="flor">
             <img src="img/flor8.jpeg"  width="200" height="300"> 
             <a href="#ventana8">
                 <font style="font-family: Bahnschrift Condensed">
                     INFORMACION
                 </font>
             </a>
             <form>
                 <a href="Compra.jsp?cod=8">
                 <input class="boton" type="button" value="Añadir al carrito" id="caja8"> 
                 </a>
                </form>
        </div>
         
         <div class="flor">
             <img src="img/flor9.jpeg"  width="200" height="300">
             <a href="#ventana9">
                 <font style="font-family: Bahnschrift Condensed">
                     INFORMACION
                 </font>
             </a>
             <form>
                 <a href="Compra.jsp?cod=9">
                 <input class="boton" type="button" value="Añadir al carrito" id="caja9"> 
                 </a>
                </form>
        </div>
           <div class="flor">
             <img src="img/flor10.jpeg"  width="200" height="200">
             <a href="#ventana10">
                 <font style="font-family: Bahnschrift Condensed">
                     INFORMACION
                 </font>
             </a>
             <form>
                 <a href="Compra.jsp?cod=10">
                 <input class="boton" type="button" value="Añadir al carrito" id="caja10" > 
                 </a>
                </form>
        </div>  
          
         
         <div class="titulo">
         <font style="font-family: Bahnschrift Condensed"  style="color:#202022 " >
         <i>NATURALEZA</i>
         </font>
         </div>
         <br>
         <br>
         <br>
         <div class="flor">
             <img src="img/na1.jpeg" width="200" height="300" >
             <a href="#ventana11">
                 <font style="font-family: Bahnschrift Condensed">
                     INFORMACION
                 </font>
             </a>
              <form>
                  <a href="Compra.jsp?cod=11">
                 <input class="boton" type="button" value="Añadir al carrito" id="caja11" > 
                  </a>
              </form>
         </div>
         <div class="flor">
             <img src="img/na2.jpeg"width="200" height="300">
             <a href="#ventana12">
                 <font style="font-family: Bahnschrift Condensed">
                     INFORMACION
                 </font>
             </a>
              <form>
                  <a href="Compra.jsp?cod=12">
                 <input class="boton" type="button" value="Añadir al carrito" id="caja12" > 
                  </a>
              </form>
         </div>
         <div class="flor">
             <img src="img/na3.jpeg" width="200" height="300">
             <a href="#ventana13">
                 <font style="font-family: Bahnschrift Condensed">
                     INFORMACION
                 </font>
             </a>
              <form>
                  <a href="Compra.jsp?cod=13">
                 <input class="boton" type="button" value="Añadir al carrito" id="caja13" > 
                  </a>
              </form>
         </div>
         <div class="flor">
             <img src="img/na4.jpeg"  width="200" height="300">
             <a href="#ventana14">
                 <font style="font-family: Bahnschrift Condensed">
                     INFORMACION
                 </font>
             </a>
              <form>
                  <a href="Compra.jsp?cod=14">
                 <input class="boton" type="button" value="Añadir al carrito" id="caja14"> 
                  </a>
              </form>
         </div>
         <div class="flor">
             <img src="img/na5.1.jpeg"  width="200" height="300">
             <a href="#ventana15">
                 <font style="font-family: Bahnschrift Condensed">
                     INFORMACION
                 </font>
             </a>
              <form>
                  <a href="Compra.jsp?cod=15">
                 <input class="boton" type="button" value="Añadir al carrito" id="caja15"> 
                  </a>
              </form>
         </div>
         <div class="flor">
             <img src="img/na6.jpeg"  width="200" height="300">
             <a href="#ventana16">
                 <font style="font-family: Bahnschrift Condensed">
                     INFORMACION
                 </font>
             </a>
              <form>
                  <a href="Compra.jsp?cod=16">
                 <input class="boton" type="button" value="Añadir al carrito" id="caja16" > 
                  </a>
              </form>
         </div>
         <div class="flor">
             <img src="img/na7.jpeg"  width="200" height="300">
             <a href="#ventana17">
                 <font style="font-family: Bahnschrift Condensed">
                     INFORMACION
                 </font>
             </a>
              <form>
                  <a href="Compra.jsp?cod=17">
                    <input class="boton" type="button" value="Añadir al carrito" id="caja17" > 
                  </a>
             </form>
         </div>
           
         <div class="titulo">
         <font style="font-family: Bahnschrift Condensed"  style="color:#202022 " >
         <i>OTROS</i>
         </font>
         </div>
          <div class="flor">
             <img src="img/mu1.jpeg"  width="200" height="300">
             <a href="#ventana18">
                 <font style="font-family: Bahnschrift Condensed">
                     INFORMACION
                 </font>
             </a>
             <br>
             <a href="Compra.jsp?cod=18">
              <input class="boton" type="button" value="Añadir al carrito" id="caja18">  
             </a>
         </div>
         <div class="flor">
             <img src="img/mu2.jpeg"  width="200" height="300">
             <a href="#ventana19">
                 <font style="font-family: Bahnschrift Condensed">
                     INFORMACION
                 </font>
             </a>
             <br>
             <a href="Compra.jsp?cod=19">
              <input class="boton" type="button" value="Añadir al carrito" id="caja19"> 
             </a>
         </div>
         <div class="flor">
             <img src="img/mu3.jpeg"  width="200" height="300">
             <a href="#ventana20">
                 <font style="font-family: Bahnschrift Condensed">
                     INFORMACION
                 </font>
             </a>
             <br>
             <a href="Compra.jsp?cod=20">
              <input class="boton" type="button" value="Añadir al carrito" id="caja20">  
             </a>
         </div>
         <div class="flor">
             <img src="img/mu4.jpeg"  width="200" height="300">
             <a href="#ventana21">
                 <font style="font-family: Bahnschrift Condensed">
                     INFORMACION
                 </font>
             </a>
             <br>
             <a href="Compra.jsp?cod=21">
              <input class="boton" type="button" value="Añadir al carrito" id="caja21">  
             </a>
         </div>
           <div class="flor">
             <img src="img/mu5.jpeg"  width="200" height="300">
             <a href="#ventana22">
                 <font style="font-family: Bahnschrift Condensed">
                     INFORMACION
                 </font>
             </a>
             <br>
             <a href="Compra.jsp?cod=22">
              <input class="boton" type="button" value="Añadir al carrito" id="caja22"> 
             </a>
         </div>
         <br> 
       
        </div>
   
         
     
    
    
    
    
    
    <div id="ventana" class="modalDialog">
	<div>
            <a href="#close" title="Close" class="close" onclick="cerrar()">X</a>
		<h2>Bugambilia</h2>
		<p>Tamaño de la foto: 1280 x 1280</p>
		<p>Precio: $79 </p>
               
                
    </div>
    </div>    
     
      <div id="ventana2" class="modalDialog">
	<div>
		<a href="#close" title="Close" class="close" onclick="cerrar()">X</a>
		<h2>Arbusto</h2>
		<p>Tamaño de la foto: 720 x 1280</p>
		<p>Precio: $79 </p>
               
                
            </div>
       </div>
        
     <div id="ventana3" class="modalDialog">
	<div>
		<a href="#close" title="Close" class="close">X</a>
                <h2>Malvon Rosa</h2>
		<p>Tamaño de la foto: 960 x 1280</p>
		<p>Precio: $79 </p>
                 
                
            </div>
       </div>
        
       <div id="ventana4" class="modalDialog">
	<div>
		<a href="#close" title="Close" class="close">X</a>
                <h2>Bugambilia</h2>
		<p>Tamaño de la foto: 960 x 1280</p>
		<p>Precio: $79 </p>
                 
            </div>
       </div>  
        
      <div id="ventana5" class="modalDialog">
	<div>
		<a href="#close" title="Close" class="close">X</a>
                <h2>Lavanda</h2>
		<p>Tamaño de la foto: 486 x 648</p>
		<p>Precio: $79 </p>
                 
                
            </div>
       </div> 
    
      <div id="ventana6" class="modalDialog">
	<div>
		<a href="#close" title="Close" class="close">X</a>
                <h2>Bugambilia</h2>
		<p>Tamaño de la foto: 960 x 1280</p>
		<p>Precio: $79 </p>
               
                
            </div>
       </div>
    
      <div id="ventana7" class="modalDialog">
	<div>
		<a href="#close" title="Close" class="close">X</a>
                <h2>Malvon Blanco</h2>
		<p>Tamaño de la foto: 640 x 852</p>
		<p>Precio: $79 </p>
                
                
            </div>
       </div>
    
      <div id="ventana8" class="modalDialog">
	<div>
		<a href="#close" title="Close" class="close">X</a>
                <h2>Flor de maravilla</h2>
		<p>Tamaño de la foto: 640 x 852</p>
		<p>Precio: $79 </p>
                
                
            </div>
       </div>
   
     <div id="ventana9" class="modalDialog">
	<div>
		<a href="#close" title="Close" class="close">X</a>
                <h2>Corona de Cristo</h2>
		<p>Tamaño de la foto: 640 x 852</p>
		<p>Precio: $79 </p>
                 
                
            </div>
       </div>
    
    <div id="ventana10" class="modalDialog">
	<div>
		<a href="#close" title="Close" class="close">X</a>
                <h2>Flor callejera</h2>
		<p>Tamaño de la foto: 640 x 641</p>
		<p>Precio: $79 </p>
                
                
            </div>
       </div>
    
     <div id="ventana11" class="modalDialog">
	<div>
		<a href="#close" title="Close" class="close">X</a>
                <h2>Hojas de naranjo</h2>
		<p>Tamaño de la foto: 640 x 641</p>
		<p>Precio: $79 </p>
              
                
            </div>
       </div>
    
  <div id="ventana12" class="modalDialog">
	<div>
		<a href="#close" title="Close" class="close">X</a>
                <h2>Selva</h2>
		<p>Tamaño de la foto: 960 x 1280</p>
		<p>Precio: $79 </p>
              
                
            </div>
       </div>
    
      <div id="ventana13" class="modalDialog">
	<div>
		<a href="#close" title="Close" class="close">X</a>
                <h2>Arbol</h2>
		<p>Tamaño de la foto: 960 x 1280</p>
		<p>Precio: $79 </p>
              
                
            </div>
       </div>
    
    <div id="ventana14" class="modalDialog">
	<div>
		<a href="#close" title="Close" class="close">X</a>
                <h2>Jirafa</h2>
		<p>Tamaño de la foto: 768 x 1024</p>
		<p>Precio: $79 </p>
                
                
            </div>
       </div>
    
    <div id="ventana15" class="modalDialog">
	<div>
		<a href="#close" title="Close" class="close">X</a>
                <h2>Lluvia</h2>
		<p>Tamaño de la foto: 546 x 833</p>
		<p>Precio: $79 </p>
             
                
            </div>
       </div>
    
     <div id="ventana16" class="modalDialog">
	<div>
		<a href="#close" title="Close" class="close">X</a>
                <h2>Duranta de Limon</h2>
		<p>Tamaño de la foto: 546 x 833</p>
		<p>Precio: $79 </p>
               
                
            </div>
       </div>
    
    <div id="ventana17" class="modalDialog">
	<div>
		<a href="#close" title="Close" class="close">X</a>
                <h2>Planta</h2>
		<p>Tamaño de la foto: 546 x 833</p>
		<p>Precio: $79 </p>
                
                
            </div>
       </div>
     <div id="ventana17" class="modalDialog">
	<div>
		<a href="#close" title="Close" class="close">X</a>
                <h2>Calanchoe</h2>
		<p>Tamaño de la foto: 720 x 1280</p>
		<p>Precio: $79 </p>
               
                
            </div>
       </div>
    
    <div id="ventana18" class="modalDialog">
	<div>
		<a href="#close" title="Close" class="close">X</a>
                <h2>Museo de Arte Moderno</h2>
		<p>Tamaño de la foto: 960 x 1280</p>
		<p>Precio: $79 </p>
                
                
            </div>
       </div>
    <div id="ventana19" class="modalDialog">
	<div>
		<a href="#close" title="Close" class="close">X</a>
                <h2>Museo de Economia</h2>
		<p>Tamaño de la foto: 960 x 1280</p>
		<p>Precio: $79 </p>
                 
                
            </div>
       </div>
      <div id="ventana20" class="modalDialog">
	<div>
		<a href="#close" title="Close" class="close">X</a>
                <h2>Museo de Economia</h2>
		<p>Tamaño de la foto: 960 x 1280</p>
		<p>Precio: $79 </p>
 
                
            </div>
       </div>
     <div id="ventana21" class="modalDialog">
	<div>
		<a href="#close" title="Close" class="close">X</a>
                <h2>Museo de Economia</h2>
		<p>Tamaño de la foto: 960 x 1280</p>
		<p>Precio: $79 </p>
               
                
            </div>
       </div>
     <div id="ventana22" class="modalDialog">
	<div>
		<a href="#close" title="Close" class="close">X</a>
                <h2>Batiz</h2>
		<p>Tamaño de la foto: 720 x 1280</p>
		<p>Precio: $79 </p>
               
                
            </div>
       </div>
       
    
</body>
</html>
