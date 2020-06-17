<%-- 
    Document   : Inicio_A
    Created on : 5/06/2020, 10:42:46 PM
    Author     : Eda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>
		Inicio de Sesion
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
			Inicio de Sesion
		</font>
                <br>
                <br>
		<font style="font-family: Bahnschrift Condensed">
			Adminitrador o Empleado
		</font>
                <br>
                <br>
		<div>
                        <form method="post">
				<input type="text" placeholder="Ingrese su correo" id="correo2">
				<br>
				<br>
				<input type="password" placeholder="Ingrese la clave" id="contrasena2">
				<br>
				<br>
				<input type="button" id="ingresar" class="boton2" value="Ingresar" onclick="ValidarDatos()">
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

