/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* global google */

function  ValidarDatos(){
 
var correo=document.getElementById("correo2").value;
var contrasena = document.getElementById("contrasena2").value;
var correo2= document.getElementById("correo2").value;
var contrasena2=document.getElementById("contrasena2").value;


 
if (correo === "eda.ynora@gmail.com" && contrasena == "petunea01") {
	alert("Bienvenido");
	window.location.href= 'Inicio_Admin.jsp';
}else if(correo == "anyax.27@gmail.com" && contrasena2=="123456"){
	 alert("Bienvenido");
	 window.location.href= 'Inicio_Admin.jsp';
}else{

	alert("Mal :C");
}
}




function precio(){
    obj = document.getElementById('carri');
    numero =  obj.getElementsByTagName("img");
    cantidad =  numero.length;
    precio =document.getElementById("texto").innerHTML =((cantidad-1)*79)+'&nbsp;Pesos';
     

}
  
    
             
            google.charts.load('current', {'packages':['corechart','bar']});
            google.setOnLoadCallback(dibujar);
            google.setOnLoadCallback(dibujar2);
            google.setOnLoadCallback(dibujar3);
            google.setOnLoadCallback(dibujar4);
         

          function dibujar(){
                var data = new google.visualization.DataTable();
                data.addColumn('string','Categoria');
                data.addColumn('number','Fotos Vendidas');
                data.addRows(
                        [
                        ['Flores',20],
                        ['Naturaleza',15] ,
                        ['Otros',13]
                        ]        
                
                );
        
                var detalles = {'title':'Tendecias',
                                'width':500,
                                'height':300};
                var grafica = new google.visualization.PieChart(document.getElementById("grafica"));
                grafica.draw(data,detalles);
            }
                
                function dibujar2(){
                var data = new google.visualization.DataTable();
                data.addColumn('string','Ventas');
                data.addColumn('number','Categoria');
                data.addRows(
                        [
                        ['Flores',10],
                        ['Naturaleza',8] ,
                        ['Otros',5]
                        ]        
                
                );
        
                var detalles = {'title':'Compras Semanales',
                                'width':500,
                                'height':300};
                var grafica2 = new google.visualization.LineChart(document.getElementById("grafica2"));
                grafica2.draw(data,detalles);
            }
                 
            function dibujar3(){
                var data = new google.visualization.DataTable();
                data.addColumn('string','Ventas',"#b87333");
                data.addColumn('number','Categoria');
                data.addRows(
                        [
                        ['Flores',30],
                        ['Naturaleza',24] ,
                        ['Otros',15]
                        ]        
                
                );
        
                var detalles = {'title':'Compras Mensuales',
                                'width':500,
                                'height':300};
                var grafica2 = new google.visualization.BarChart(document.getElementById("grafica3"));
                grafica2.draw(data,detalles);
            }
            
            function dibujar4(){
                var data = new google.visualization.DataTable();
                data.addColumn('string','Ventas');
                data.addColumn('number','Categoria');
                data.addRows(
                        [
                        ['Flores',15],
                        ['Naturaleza',12] ,
                        ['Otros',7]
                        ]        
                
                );
        
                var detalles = {'title':'Compras Quincenales',
                                'width':500,
                                'height':300,
                                hAxis: {title: 'Categoria',  titleTextStyle: {color: '#BF1736'}},
                                vAxis: {minValue: 0}
                                };
                var grafica2 = new google.visualization.AreaChart(document.getElementById("grafica4"));
                grafica2.draw(data,detalles);
            }
            