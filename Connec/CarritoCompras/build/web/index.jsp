<%-- 
    Document   : index
    Created on : 21/04/2019, 10:04:41 PM
    Author     : angab
--%>

<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Inicio</title>
        <meta charset="iso-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/all.js"></script>
        <link rel="stylesheet" href="css/main.css">
        <link rel="icon" type="image/jpeg" href="img/logo2.jpg">
        <link rel="icon" type="image/jpeg" href="img/logo2.jpg">

    </head>
    <body>
        <%
               if(request.getParameter("cerrar")!=null){
                    HttpSession sesion = request.getSession();
                    sesion.invalidate();
                }     
        %>
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
            <div class="container">
                <a href="index.html" class="navbar-brand">
                    <strong><img src="img/logo2.jpg" width="70" height="50"> SOMA SHOES</strong>
                </a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a href="#home-section" class="nav-link">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a href="#info-section" class="nav-link">Informacion</a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link">Contacto</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    <header id="home-section" style="background: url('img/bg.jpg') no-repeat;
            min-height: 137vh; background-size: cover; background-attachment: fixed;">
        <div class="dark-overlay">
            <div class="home-inner">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <h1 class="display-4"><strong>Zapateria en Linea</strong></h1>
                            <div class="d-flex flex-row">
                                <div class="p-4">
                                    <i class="fas fa-certificate"></i>
                                </div>
                                <div class="p-4" style="font-size: 25px;">
                                    Registrate ahora y podras comprar los mejores y mas modernos pares de zapatos 
                                </div>
                            </div>
                            <div class="d-flex flex-row">
                                <div class="p-4">
                                    <i class="fas fa-certificate"></i>
                                </div>
                                <div class="p-4" style="font-size: 25px;">
                                    Todos los precios incluyen iva iva
                                </div>
                            </div>
                            <div class="d-flex flex-row">
                                <div class="p-4">
                                    <i class="fas fa-certificate"></i>
                                </div>
                                <div class="p-4" style="font-size: 25px;">
                                    Esta pagina fue elaborada con <i class="fab fa-js-square" style="font-size: 40px;"></i>
                                    <i class="fab fa-css3-alt" style="font-size: 40px;"></i>
                                    <i class="fab fa-html5" style="font-size: 40px;"></i>
                                    <img src="img/java.svg" style="background-color: white;" height="40px" width="40px">
                                </div>
                            </div>   
                        </div>
                        <div class="col-lg-4">
                            <div class="card text-center" style="background-color: #c0392b;">
                                <div class="card-body">
                                    <form>
                                        <input type="button" id="Iniciar_Sesion" value="Iniciar Sesion" class="btn btn-outline-light">
                                        <input type="button" id="Registrarse2" value="Registrarse" class="btn btn-outline-light">
                                    </form>                                
                                </div>
                                <div class="card-body" id="Iniciar">
                                    <h3>Iniciar Sesión</h3>
                                    <BR>
                                    <form method="Post" action="ServletEntrar">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-lg" placeholder="Usuario" name="user"> 
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-lg" placeholder="Contraseña" name="password"> 
                                        </div>
                                        <br>
                                        <input type="submit" class="btn btn-outline-light btn-block" value="Ingresar">
                                    </form>
                                </div>
                                <div class="card-body" id="Registrarse">
                                    <h3>Registrate</h3>
                                    <BR>
                                    <form method="Post" action="ServletRegistro" id="registro">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-lg" placeholder="Nombre" name="nombre"> 
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-lg" name="app" placeholder="Apellido Paterno"> 
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-lg" name="apm" placeholder="Apellido Materno"> 
                                        </div>
                                        <div class="form-group">
                                            <label>Sexo</label>
                                            <select name="sexo" class='form-control'>
                                                <option value="Masculino">Masculino</option>
                                                <option values="Femenino">Femenino</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-lg" name="usuario" placeholder="Usuario"> 
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-lg" name="password" placeholder="Contraseña"> 
                                        </div>
                                            <br>
                                            <input type="submit" class="btn btn-outline-light btn-block" value="Registrarse">
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
        <script src="js/jquery-3.3.1.slim.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script>
            $("document").ready(function(){
                    $('#Registrarse').hide();
                    $('#Iniciar').show();
                    $('#Iniciar_Sesion').css("background-color","white");
                    $('#Iniciar_Sesion').css("color","black");        
            });
            $("#Iniciar_Sesion").click(function(){
                    $('#Registrarse').hide();
                    $('#Iniciar').show();  
                    $('#Iniciar_Sesion').css("background-color","white");
                    $('#Iniciar_Sesion').css("color","black"); 
                    $('#Registrarse2').css("background-color","#C0392B");
                    $('#Registrarse2').css("color","white"); 
            });

            $("#Registrarse2").click(function(){
                    $('#Iniciar').hide();
                    $('#Registrarse').show(); 
                    $('#Iniciar_Sesion').css("background-color","#C0392B");
                    $('#Iniciar_Sesion').css("color","white"); 
                    $('#Registrarse2').css("background-color","white");
                    $('#Registrarse2').css("color","black");
            });
        </script>
    </body>
</html>
