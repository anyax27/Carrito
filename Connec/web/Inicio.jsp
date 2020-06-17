<%-- 
    Document   : Inicio
    Created on : 5/06/2020, 10:41:08 PM
    Author     : Eda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession objsesion = request.getSession(false);
    String usuario = (String)objsesion.getAttribute("usuario");
    if(usuario.equals("")){
        response.sendRedirect("index.jsp");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Inicio</title>
        <meta charset="UTF-8">
        <script src="js/proteger.js"></script>
        <link rel="stylesheet" type="text/css" href="css/Style.css">
	 
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
                                <a>Cliente: <%=usuario%></a>			
                        </nav>
		</div>
        <br>
    </header>
    <br>
    
     
    <div class="in"  >
            <br>
            <br>
            <br>
            <font class="titulo" >
            <i>BIENVENIDO</i>
            </font>
            <br>
            <br>
             
            <font style="font-family: Bahnschrift Condensed" size="5"  >
                Este carrito de compras va dirigido para aquellas personas que necesitan fotos unicas y especificas
                <br>
                Sientete libre de ver el catalogo de fotos que ofrecemos.
                <br>
                <br>
                <u><i>Todas las fotos estan sujetas a derechos de autor, si el equipo 
                        <br>
                        detecta que alguna de las fotos de este carrito
                         
                se ha utilizado en algun proyecto ajeno sin haber comprado los 
                <br>
                derechos de autor.Procederemos a atender el asunto.
                    </i></u>
                
             </font>
             <br>
             <br>
              
             <img   src="img/cami.jpg" width="400" height="300">
             <br>
             <br>
    </div>
 
</body>
</html>
