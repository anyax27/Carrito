<%-- 
    Document   : grafito
    Created on : 31/05/2020, 09:50:07 PM
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
        
        <title>Graficas</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="css/Style.css">
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript" src="js/Administrar.js">
  
        </script>
      
       
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
                                <a href="SCerrarSesion">Cerrar sesión</a>  
			</nav>
		</div>
        <br>
    </header>
       <br>
            <div class="ino"   >
                <div class="titulo">
                <font style="font-family: Bahnschrift Condensed"  style="color:#202022 " >
                <i>Graficas</i>
                </font>
                </div>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <div id="grafica" class="grafica">
                </div>
                
                <br>
                
                <div id="grafica2" class="grafica">
                    
                </div>
                <br>
                <div id="grafica3" class="grafica">
                    
                </div>
                <br>
                <div id="grafica4" class="grafica">
                    
                </div>

            </div>
    </body>
</html>
