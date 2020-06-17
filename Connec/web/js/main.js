/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

window.addEventListener('load', function () {
    document.getElementById('ingresar').addEventListener('click', function(){
       var correo = document.getElementById('correo1').value;
       var contra = document.getElementById('contrasena1').value;
       
       var bandera = false;
       
       if(correo.length > 0 && contra.length > 0){
           bandera = true;
       }
       
       if(bandera){
           document.getElementById('forminicio').submit();
       }else{
           alert('Por favor rellene todos los campos');
       }
    });
});


