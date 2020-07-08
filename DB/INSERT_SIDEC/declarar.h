#define S(x) to_string(x)
#define YEAR aux.fechaNacimiento[0] + aux.fechaNacimiento[1] + aux.fechaNacimiento[2] + aux.fechaNacimiento[3]
#define MONTH aux.fechaNacimiento[5] + aux.fechaNacimiento[6]
#define DAY aux.fechaNacimiento[8] + aux.fechaNacimiento[9]
#define CORREO MATRICULA + "@gmail.com"
#define MATRICULA "Matricula" + S(x)
//#define MATRICULA aux.nombre[0] + aux.nombre[1] + aux.apellido1[0] + aux.apellido1[1]
//#define CURP FirstConsonante_Vocal(aux.apellido1) + tieneapellido2(aux.apellido2) + aux.nombre[0] + YEAR + MONTH + DAY + aux.genero[0] + "MO"

/**
    Los elementos que componen la CURP son los siguientes:

    -Primera letra y la primera vocal del primer apellido.
    -Primera letra del segundo apellido.
    -Primera letra del nombre de pila: se tomará en cuenta el primer nombre. («exceptuando los nombres compuestos cuando a estos se antepongan los nombres de MARÍA y JOSÉ») Ejemplo: Juan Francisco se tomaría la letra J. Ejemplo 2: Si se llama José Eduardo tomará E
    -Fecha de nacimiento sin espacios en orden de año, mes y día. Ejemplo: 960917 (1996, septiembre 17).
    -Letra del sexo (H o M).
    -Dos letras correspondientes a la entidad de nacimiento (en caso de haber nacido fuera del país, se marca como NE, «Nacido en el Extranjero»; véase el Catálogo de Claves de Entidades Federativas1​
    -Primera consonante interna () del primer apellido.
    -Primera consonante interna () del segundo apellido.
    -Primera consonante interna () del nombre.
    -Dígito del 0-9 para fechas de nacimiento hasta el año 1999 y A-Z para fechas de nacimiento a partir del 2000.
    -Dígito, para evitar duplicaciones.
*/

struct estudiante{
    string matricula ;
    string curp ;
    string nombre ;
    string apellido1 ;
    string apellido2 ;
    string fechaNacimiento ;
    string telefono ;
    string correo ;
    string genero ;
    string nivelActual ;
    string cicloEscolar ;
    bool status ;
};

struct tutor{
    string curp ;
    string nombre ;
    string apellido1 ;
    string apellido2 ;
    string telefonoPersonal ;
    string telefonoTrabajo ;
    string correo ;
    string genero ;
};

struct domicilio{
	string matEstudiante ;
	int idTutor ;
	string calle ;
	string noExterior ;
	string noInterior ;
	string colonia ;
	string municipio ;
	string codigoPostal ;
};

struct usuario{
    string cct ;
    string password ;
    string correo ;
    string nombre ;
    string apellido1 ;
    string apellido2 ;
    string rol ;
};

struct reporte{
    string fecha ;
    string motivo ;
    string descripcion ;
    string canalizacion ;
    string cct ;
    string matEstudiante ;
};

struct conducta{
    string matEstudiante ;
    string fechaHora ;
    string observaciones ;
};

struct informacion_clinica{
    string matEstudiante ;
    double peso ;
    double estatura ;
    double imc ;
    string tiposDeSangre ;
    string numeroSeguro ;
    string unidadMedica ;
    string alergias ;
    string enferCronicas ;
    string enferHereditarias ;
    string discapacidades ;
    string diagPsico ;
};

struct logro{
    int folio ;
    string matEstudiante;
    string tipo;
    string descripcion;
    string fecha;
};

//Para azar
vector < pair <string, string> > nombres ;
vector < string > apellidos ;
vector < string > enfermedades ;
vector < string > alergias ;
vector < string > municipios ;
vector < string > motivos ;
vector < string > canalizaciones ;
vector < string > logros ;
vector < string > roles ;
vector < string > tiposDeSangre ;
vector < bool > status ;
vector < string > niveles ;

//Para generar datos
vector < estudiante > est ;
vector < tutor > tut ;
vector < domicilio > dom;
vector < usuario > usu ;
vector < reporte > rep ;
vector < conducta > con ;
vector < informacion_clinica > info_cli ;
vector < logro > logr ;

//Auxiliar para verificar que no haya repetidos
vector < pair < string, int > > combinaciones ;

