<%-- 
    Document   : D_A
    Created on : 5/06/2020, 10:40:06 PM
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
        <title>Derechos de Autor</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/Style.css">
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
       <div class="in">
           <br>
           <br>
           <font class="titulo" style="font-family: Bahnschrift Condensed" >
            <i>
            DERECHOS DE AUTOR</i>
            </font>
            <br>
            
            
           <font style="font-family: Bahnschrift Condensed" size="5" >
        
 <p>La presente Ley, reglamentaria del artículo 28 constitucional, tiene por objeto la
salvaguarda y promoción del acervo cultural de la Nación; protección de los derechos de los autores, de
los artistas intérpretes o ejecutantes, así como de los editores, de los productores y de los organismos de
radiodifusión, en relación con sus obras literarias o artísticas en todas sus manifestaciones</p>
 <br>
 <p>Al comprar una foto obtendras los derechos de uso para esa imagen para una publicación (depende de los derechos y condiciones de cada agencia). 
     Bajo ninguna circunstancia las fotos dejarán de pertenecer al autor, podrás seguir utilizándola.</p>
   </font>
   <br>
   <div widht="100%">
       <font style="float: left" size="7" >
        <i><b>Autor de las fotos</b></i>
        </font> 
   </div>
        
        <br>
        <br>
        <br>
        <br>
        <img style="float: left" class="img" src="img/uwu.jpeg" whith="350" height="200">
        <br>
        <br>
        <br>
        <font style="float: left" size="5"><i>YUNO</i></font>
       </div>
    </body>
</html>
