/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function validar(){
 
  return validarnom();

}

 

function validarnom(){
     var nom = document.getElementById("Nombre").value;
     var apell = document.getElementById("Apellido").value;
     var vali = /^[a-z-A-Z]{1,64}$/;
     var email = document.getElementById("correo3").value;
     var contra = document.getElementById("contrasena3").value;
     vali2 = /^[a-z-0-9]+@+[a-z]+.+[a-z]$/;

    if (nom === "" || apell === "") {
        alert("Apellido o Nombre vacio");
    }else if (email === "") {
        alert ("Email vacio");
    } else if(contra === ""){
        alert("La contraseña esta vacia");
    }else if(nom.length > 10 || apell.length > 15){
        alert("Muchas letras");
    }else if (email.length > 26 ){
        alert("Muchas letras en correo");
    }else if ( contra.length > 15 ){
        alert("Muchas letras en contraseña");
    }else if (nom.length <=2 || apell.length <=2){
        alert("Pocas letras");
    }else if (email.length <=1 || email.length <=5 ){
        alert("Correo corto");
    }else if (contra.length<=5){
        alert(" Contraseña insegura");

    }else if (!vali.test(nom) || !vali.test(apell)){
        alert("Solo coloca letras en nombre y apellido");
        return false;
    }else if(!vali2.test(email)){
        alert ("Correo no valido");
    } else {
        document.getElementById('formregistro').submit();
    }

}


