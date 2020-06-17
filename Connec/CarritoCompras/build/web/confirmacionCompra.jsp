<%-- 
    Document   : confirmacionCompra
    Created on : 1/05/2019, 01:17:53 AM
    Author     : angab
--%>

<%@page import="Modelo.Validacion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Modelo.AccesoZapatos"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/all.js"></script>
        <link rel="stylesheet" href="css/main.css">
        <title>Comprar</title>
        <link rel="icon" type="image/jpeg" href="img/logo2.jpg">

    <body>
        <%
            HttpSession sesion = request.getSession();
            
            if(sesion.getAttribute("usuario")!=null && sesion.getAttribute("tipo")!=null){
                int tipo = Integer.parseInt(sesion.getAttribute("tipo").toString());
                if(tipo==3){
                    String [] elementos = request.getParameterValues("zapatos");

                    if(elementos!=null){

                        int prov=0;
                        int j=0;
                        Validacion validar = new Validacion();
                        String [] shoes = new String[elementos.length];
                        for (String elem : elementos) {
                            if(validar.validarCantidad(request.getParameter("cantidad"+elem))){
                                shoes[j]=elem+"-"+request.getParameter("cantidad"+elem);
                            }else{
                                prov++;
                            }
                            j++;
                        }
                        if(prov==0){
                            out.println("<div align='center'><div class='container'>"
                                + "<div class='card text-center' id=\"confirmacion\" style=\"background-color: #c0392b;\">"
                                    + "<div class='card-body'>"+
                                    "<h3>Confirmación Pedido</h3>"+
                                    "<BR>"+
                                    "<form action=\"ServletTicket\" method='Post'>"+
                                    "<div class=\"form-group\" style='background-color: white;'>"+
                                            "<table class=\"table\" style='color: white;'>"
                                    +"<thead class=\"thead-dark\">"+
                                                  "<tr>"+
                                                    "<th scope=\"col\">Modelo</th>"+
                                                    "<th scope=\"col\">Talla</th>"+
                                                    "<th scope=\"col\">Descripción</th>"+
                                                    "<th scope=\"col\">Cantidad</th>"+
                                                    "<th scope=\"col\">Precio</th>"+
                                                "</tr>"+
                                                "</thead>"
                                            + "<tbody>");
                                    AccesoZapatos az = new AccesoZapatos();
                                    ResultSet query = null;
                                    float total = 0;
                                    for (int i = 0; i < shoes.length; i++) {
                                        String [] zapatos = shoes[i].split("-");
                                                
                                        query = az.buscar(0, zapatos[0], "", "", "");
                                        int cantidad=0;
                                        int id2=0;
                                        String modelo="";
                                        String talla = "";
                                        String descripcion="";
                                        float precio = 0;
                                        while(query.next()){
                                            id2 = query.getInt(1);
                                            modelo = query.getString(2);
                                            talla = query.getString(6);
                                            descripcion = query.getString(5);
                                            precio = query.getFloat(4);
                                            cantidad = query.getInt(3);
                                            total = total+(Float.parseFloat(zapatos[1])*precio);
                                            out.println("<tr>"
                                                    + "<td><input type='hidden' value='"+id2+"' name='losids'>"+modelo+"</td>"
                                                    + "<td>"+talla+"</td>"
                                                    + "<td>"+descripcion+"</td>"
                                                    + "<td><input type='hidden' value='"+zapatos[1]+"' name='"+id2+"'>"+zapatos[1]+"</td>"
                                                    + "<td>"+precio+"</td>"
                                                    + "</tr>");
                                        }
                                    }
                                    out.print("<tr>"
                                            + "<td colspan='4' style='text-align: right;'>Subtotal: </td>"
                                            + "<td>"+(total-total*.16)+"</td>"
                                            + "</tr>"
                                            +"<tr>"
                                            + "<td colspan='4' style='text-align: right;'>IVA: </td>"
                                            + "<td>"+(total*.16)+"</td>"
                                            + "</tr>"
                                            +"<tr>"
                                            + "<td colspan='4' style='text-align: right;'>Total a Pagar: </td>"
                                            + "<td><input type='hidden' value='"+total+"' name='yanose'>"+total+"</td>"
                                            + "</tr>");
                                    out.print("</tbody>"
                                    + "</table>"+
                                        "</div>"+
                                        "<div class=\"form-group\">"+
                                        "<h2>¿Cuál va a ser su metodo de Pago?</h2>"+
                                        "</div>"+
                                        "<div class=\"form-group\">"+
                                        "<div class='btn-group' data-toggle='buttons'>"+
                                        "<label class='btn btn-primary active'>"+
                                        "<input type='radio' name='pago' id='paypal' value='paypal' autocomplete='off' checked>"+
                                        "<i class='fab fa-cc-paypal' id='icon'></i></label>"+
                                        "<label class='btn btn-primary'>"+
                                        "<input type='radio' name='pago' id='tarjeta' value='Tarjeta de Debito o Credito' autocomplete='off'>"+
                                        "<i class='far fa-credit-card' id='icon'></i></label>"+
                                        "<label class='btn btn-primary'>"+
                                        "<input type='radio' name='pago' id='efectivo' value='Efectivo' autocomplete='off'>"+
                                        "<i class='fas fa-money-bill-alt' id='icon'></i></label>"+    
                                        "</div></div>"+                        
                                        "<br>"+
                                        "<div class='row'>"+
                                        "<div class='col-lg-6'>"+
                                        "<input type=\"submit\" class=\"btn btn-success btn-block\" value=\"Comprar\">"+
                                        "</div>"+
                                        "<div class='col-lg-6'>"+
                                        "<a href='carrito.jsp'><input type=\"button\" class=\"btn btn-danger btn-block\" value=\"Cancelar\"></a>"+
                                        "</div>"+
                                        "</div>"+    
                                    "</form>"+
                                "</div>"
                            + "</div></div></div>");

                        }else{
                            out.println("<center style='padding-top: 20px;'><h1>La cantidad no puede estar vacia</h1></center>"
                                    + "<center style='padding-top: 20px;'><a href='carrito.jsp'><input type='button' value='Regresar' class='btn btn-success' style='width: 200px;'></a></center>");                         
                        }

                    }else{
                            out.println("<center style='padding-top: 20px;'><h1>Debe escoger zapatos para comprar</h1></center>"
                                    + "<center style='padding-top: 20px;'><a href='carrito.jsp'><input type='button' value='Regresar' class='btn btn-success' style='width: 200px;'></a></center>");                         
                    }                    
                }else{
                    response.sendRedirect("index.jsp");
                }
            }else{
                response.sendRedirect("index.jsp");
            }
            
        %>
        <script src="js/jquery-3.3.1.slim.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
