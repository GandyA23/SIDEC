//Caracteres validos
var nombre = 'áéíóúÁÉÍÓÚabcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ. ' ;
var curp = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789' ;
var numero = '0123456789' ;
var correo = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@.' ;
var matricula = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789' ;
var texto = 'áéíóúÁÉÍÓÚabcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ.,;() ' ;
var peso = '0123456789.' ;

//Se siguio la siguiente norma para la contraseña
//https://help.pearsoncmg.com/sms4/help/es/Content/acceptable_chars_help.html#:~:text=Reglas%20para%20nombres%20de%20inicio%20de%20sesi%C3%B3n%20y%20contrase%C3%B1as&text=Su%20contrase%C3%B1a%20debe%20tener%20al,que%20se%20encuentran%20en%20diccionarios.
var password = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@.-_' ;

function quita(string, tipo){
    var out = '' ;
    var ver = '' ;

    switch(tipo){
        case 'nombre':
        case 'apellido1':
        case 'apellido2':
            ver = nombre ;
            break;

        case 'curp':
            ver = curp ;
            break;

        case 'telefono':
        case 'cicloEscolar':
            ver = numero;
            break;

        case 'correo':
            ver = correo ;
            break;

        case 'matricula':
        case 'cct':
            ver = matricula ;
            break;

        case 'observaciones':
            ver = texto ;
            break;

        case 'password':
            ver = password ;
            break ;

    }

    for (var i=0; i<string.length; i++)
        if (ver.indexOf(string.charAt(i)) != -1)
            out += string.charAt(i);

    return out;
}