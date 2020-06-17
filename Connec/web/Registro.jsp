<%-- 
    Document   : Registro
    Created on : 5/06/2020, 10:44:51 PM
    Author     : Eda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>
		Registro
	</title>
	<link rel="stylesheet" type="text/css" href="css/Style.css">
	<meta charset="utf-8">
        <script src="js/main2.js"></script>
        <script src="js/proteger.js"></script>
</head>
<body>
	<body background="img/fondo03.jpeg">
	<div class="tres">
		<br>
		<font size="15" color="#F2F2F2" style="font-family: Bahnschrift Condensed">
			Registro 
		</font>
                <br>
		<font color="#F2F2F2"style="font-family: Bahnschrift Condensed">
			<p>Para registrarse Ingrese los siguientes datos</p>
		</font>
		<div>
			<form action="nuevousuario" method="post" id="formregistro">
				<input type="text" placeholder="Ingrese su Nombre" id="Nombre" name="nombre_cliente">
                                <input type="text" placeholder="Ingrese su Apellido" id="Apellido" name="apellido_cliente">
				<br>
				<br>
                                <input type="text" placeholder="Ingrese su correo" id="correo3" name="correo_cliente">
                                <input type="password" placeholder="Ingrese su contraseña" id="contrasena3" name="contra_cliente">
				<br>
				<br>
				 
				<input type="button" id="registrar" class="boton3" value="Registrar" onclick="validar()">
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
