<%-- 
    Document   : index
    Created on : 5/06/2020, 10:45:36 PM
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
	<link rel="stylesheet" type="text/css" href="css/Style.css">
	<meta charset="utf-8">
        <script src="js/main.js"></script>
        <script src="js/proteger.js"></script>
</head>
<body background="img/fondo2.jpg">
<div class="uno">
		<br>
		<font size="15" color="#000000" style="font-family: Bahnschrift Condensed">
			Inicio de Sesion
		</font>
		<font style="font-family: Bahnschrift Condensed">
			<p>Ingrese los siguientes datos</p>
		</font>
		<div>
                        <form action="iniciar" method="post" id="forminicio">
				<input type="text" placeholder="Ingrese su correo" id="correo1" name="correo_cliente">
				<br>
				<br>
				<input type="password" placeholder="Ingrese su contraseña" id="contrasena1" name="contra_cliente">
				<br>
				<br>
				<input type="button" id="ingresar" class="boton" value="Ingresar">
			</form>
			<br>
			<a href="Inicio_A.jsp">
			<font size="2" color="#000000" style="font-family: Bahnschrift Condensed">
			¿Eres Administrador o Empleado?
                        </font>

		</a>
		<br>
		<a href="Registro.jsp">
			<font size="2" color="#000000" style="font-family: Bahnschrift Condensed">
			¿No estas Registrado?
			</font>
		</a>
		</div>
	</div>	

</body>
</html>