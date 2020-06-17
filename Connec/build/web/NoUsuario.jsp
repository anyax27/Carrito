<%-- 
    Document   : NoUsuario
    Created on : 06-jun-2020, 14:25:29
    Author     : users
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <a href="Principal.jsp"></a>
        <title>
		Error OwO
	</title>
	<link rel="stylesheet" type="text/css" href="css/Style.css">
	<script type="text/javascript" src="js/Administrar.js"></script>
	<meta charset="utf-8">
        <script src="js/proteger.js"></script>
    </head>
    <body background="img/fondo01.jpg">
    <div class="dos">
		<br>
		<font size="15" color="#000000" style="font-family: Bahnschrift Condensed">
			Alerta!
		</font>
                <br>
                <br>
		<font style="font-family: Bahnschrift Condensed">
			No existe el usuario, o ingreso algo mal
		</font>
                <br>
                <br>
		<div>
                        <form method="post">
                            <a href="Registro.jsp">
                            <input type="button" id="ingresar" class="boton2" value="Registrarse">
                            </a>
			</form>
			<br>
			<a href="index.jsp">
			<font size="2" color="#000000" style="font-family: Bahnschrift Condensed">
			Regresar
			</font>
		</a>
		</div>
	</div>	

</body>
</html>
