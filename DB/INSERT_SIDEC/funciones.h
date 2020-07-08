int azarLogros(){
    return rand() % logros.size();
}

int azarCanalizaciones(){
    return rand() % canalizaciones.size();
}

int azarMotivos(){
    return rand() % motivos.size();
}

int azarMunicipios(){
    return rand() % municipios.size();
}

int azarAlergias(){
    return rand() % alergias.size();
}

int azarEnfermedades(){
    return rand() % enfermedades.size();
}

int azarApellidos(){
    return rand() % apellidos.size() ;
}

int azarNombres(){
    return rand() % nombres.size();
}

//Retorna una posicion aleatoria de tipoDeSangre ;
int azarTipoDeSangre(){
    return rand() % tiposDeSangre.size() ;
}

//Retorna una posicion aleatoria de niveles
int azarNiveles(){
	return rand() % niveles.size() ;
}

//Retorna una posicion aleatoria de logr
int azarLog(){
    return rand() % logr.size() + 1 ;
}

//Retorna una posicion aleatoria de est
int azarEst(){
    return rand() % est.size() ;
}

//Retorna una posicion aleatoria de tut
int azarTut(){
	return rand() % tut.size() + 1 ;
}

//Retorna una posicion aleatoria de usu
int azarUsu(){
    return rand() % usu.size() ;
}

//Retorna una posicion aleatoria de status
int azarStatus(){
    return rand() % status.size() ;
}

//Retorna una posicion aleatoria de roles
int azarRoles(){
    return rand() % roles.size() ;
}

int azarNoExterior(){
	return rand() % 101 + 1 ;
}

int azarCodigoPostal(){
	return rand() % 99999 + 1 ;
}

bool verificarSiExiste( pair< string, int > candidato ){
    for(int i=0; i<combinaciones.size(); i++)
        if(candidato == combinaciones[i]) return 1 ;

    return 0 ;
}

string tendraUnValor(string frase){
    //Retorna 1 o 0
    if( rand() % 2 )
        return frase ;

    return "NULL" ;
}

string tendraApellido2(string apellido){
    //Retorna 1 o 0
    if( rand() % 2 ) return apellido ;

    return "NULL" ;
}

string horaAleatoria(){
    //hh:mm:ss

    int hora = rand() % 24 ;
    int minuto = rand() % 60 ;
    int segundo = rand() % 60 ;

    return S(hora) + ":" + S(minuto) + ":" + S(segundo) ;
}

string telefonoAleatorio(){
    //+lada abc-cde-fghi

    //Rango entre 10 - 99
    string lada = "+" + to_string( rand() % 99 + 10 ) ;

    //Rango entre 100 - 900
    string abc = to_string( rand() % 900 + 100 ) ;

    string cde = to_string( rand() % 900 + 100 );

    //Rango entre 1000 - 9999
    string fghi = to_string( rand() % 9000 + 1000 );

    return lada + " " + abc + "-" + cde + "-" + fghi ;
}

string fechaAleatoria(){
    //date: yyyy-mm-dd

    //Rango entre 2005 - 2015
    string anio = to_string( rand() % 10 + 2006 );

    //Rango entre 1 - 12
    string mes = to_string( rand() % 12 + 1 ) ;

    //Rango entre 1 - 28
    string dia = to_string( rand() % 28 + 1 ) ;

    return anio + "-" + mes + "-" + dia ;
}

string cicloAleatorio(string nivel){

	int aux = rand() % 5 + 2010 ;
	int aux2 ;

	//Primaria tiene 6 años de diferencia
	if( nivel == "Primaria" )
		aux2 = 6 ;
	else	//Secundaria y Kinder tienen 3 años de diferencia
		aux2 = 3 ;

	aux2 += aux ;

	return S(aux) + "-" + S(aux2);
}

string tieneApellido2(string x){
    if(x.size() > 0) return ""+x[0];

    return "N" ;
}

string FirstConsonante_Vocal(string x){
    string aux = "" ;
    int i ;

    //Buscar Consonante
    for(i=0; i<x.size(); i++){
        char letra = x[i] ;

        if(letra - 'a' > 4){
            aux += ""+letra ;
            break ;
        }
    }

    //Buscar Vocal
    for(i=0; i<x.size(); i++){
        char letra = x[i] ;

        if(letra - 'a' < 5){
            aux += ""+letra ;
            break ;
        }
    }

    return aux ;
}

double pesoAleatorio(){
    double x = 10 ;
    return ( rand() % 700 ) / x + 31;
}

double estaturaAleatoria(){
    double x = 10 ;
    return ( rand() % 180 ) / x + 21 ;
}
