
void generarEstudiantes(){
    estudiante aux ;
    int x, k ;

    for(int i=0; i<CANT_ESTUDIANTES; i++){
        x = i+1 ;
        k = azarNombres();  //Nombre que viene con su genero

        aux.nombre = nombres[ k ].first ;
        aux.apellido1 = apellidos[ azarApellidos() ] ;
        aux.apellido2 = tendraApellido2( apellidos[ azarApellidos() ] ) ;
        aux.matricula = MATRICULA ;
        aux.fechaNacimiento = fechaAleatoria();
        aux.telefono = tendraUnValor( telefonoAleatorio() ) ;
        aux.correo = tendraUnValor( CORREO ) ;
        aux.genero = nombres[ k ].second ;
        aux.nivelActual = niveles[ azarNiveles() ] ;
        aux.cicloEscolar = cicloAleatorio( aux.nivelActual ) ;
        aux.status = status[ azarStatus() ] ;
        //aux.curp = CURP;
        aux.curp = "CURP" + S(x) ;

        est.push_back( aux );
    }
}

void generarTutores(){
    tutor aux ;
    int x, k ;

    for(int i=0; i<CANT_TUTORES; i++){
        x = i+1 ;
        k = azarNombres();  //Nombre que viene con su genero

        aux.nombre = nombres[ k ].first ;
        aux.apellido1 = apellidos[ azarApellidos() ] ;
        aux.apellido2 = tendraApellido2( apellidos[ azarApellidos() ] ) ;
        aux.telefonoPersonal = telefonoAleatorio();
        aux.telefonoTrabajo =  tendraUnValor( telefonoAleatorio() ) ;
        aux.correo = tendraUnValor( CORREO ) ;
        aux.genero = nombres[ k ].second;

        tut.push_back( aux );
    }
}

void generarDomicilios(){
    domicilio aux ;
    pair < string, int > candidato ;
    int x;

    for(int i=0; i<CANT_DOMICILIOS; i++){
        x = i+1;

        //Verifico que no haya iguales
        do{
            candidato.first = est[ azarEst() ].matricula ;
            candidato.second = azarTut() ;
        }while( verificarSiExiste( candidato ) ) ;

        aux.matEstudiante = candidato.first ;
        aux.idTutor = candidato.second ;

        //Los respaldo para que no se vuelvan a meter
        combinaciones.push_back( candidato ) ;

        aux.calle = "calle" + S(x) ;
        aux.noExterior = S( azarNoExterior() );
        aux.noInterior = tendraUnValor( S( azarNoExterior() ) );
        aux.colonia = "colonia" + S(x) ;
        aux.municipio = "municipio" + S(x) ;
        aux.codigoPostal = S ( azarCodigoPostal() ) ;

        dom.push_back( aux );
    }

    //Limpio mi vector para usarlo en otras funciones
    combinaciones.clear() ;
}

void generarUsuarios(){
    usuario aux ;
    int x, k ;

    for(int i=0; i<CANT_USUARIOS; i++){
        x = i+1 ;
        k = azarNombres() ;

        aux.cct = "cct" + S(x) ;
        aux.password = "UsuPassword" + S(x) ;
        aux.correo = tendraUnValor( CORREO ) ;
        aux.nombre = nombres[ k ].first ;
        aux.apellido1 = apellidos[ azarApellidos() ] ;
        aux.apellido2 = tendraApellido2( apellidos[ azarApellidos() ] ) ;
        aux.rol = roles[ azarRoles() ];

        usu.push_back( aux );
    }
}

void generarReportes(){
    reporte aux ;
    int x ;

    for(int i=0; i<CANT_REPORTES; i++){
        x = i+1 ;

        aux.fecha = fechaAleatoria();
        aux.motivo = "ReporteMotivo" + S(x) ;
        aux.descripcion = "ReporteDescripcion" + S(x) ;
        aux.canalizacion = "ReporteCanalizacion" + S(x);
        aux.cct = usu[ azarUsu() ].cct ;
        aux.matEstudiante = est[ azarEst() ].matricula ;

        rep.push_back( aux );
    }
}

void generarConducta(){
    conducta aux ;
    int x ;

    for(int i=0; i<CANT_CONDUCTA; i++){
        x = i+1 ;

        aux.matEstudiante = est[ azarEst() ].matricula ;
        aux.fechaHora = fechaAleatoria() + " " + horaAleatoria() ;
        aux.observaciones = "ObservacionesDescripcion" + S(x) ;

        con.push_back( aux );
    }
}

void generarInformacionClinica(){
    informacion_clinica aux ;
    int x ;

    //IMC = kg / m^2
    for(int i=0; i<CANT_INFORMACION_CLINICA; i++){
        x = i+1 ;

        aux.matEstudiante = est[ i ].matricula ;
        aux.peso = pesoAleatorio() ;
        aux.estatura = estaturaAleatoria() ;
        aux.imc = (double) aux.peso / aux.estatura * aux.estatura ;
        aux.tiposDeSangre = tiposDeSangre[ azarTipoDeSangre() ] ;
        aux.numeroSeguro = "NumeroSeguro" + S(x) ;
        aux.unidadMedica = "UMF-" + S(x) ;
        aux.alergias = tendraUnValor( "AlergiasDescripcion" + S(x) ) ;
        aux.enferCronicas = tendraUnValor( "EnfermedadesCronicas" + S(x) ) ;
        aux.enferHereditarias = tendraUnValor( "EnfermedadesHereditarias" + S(x) ) ;
        aux.discapacidades = tendraUnValor( "Discapacidades" + S(x) ) ;
        aux.diagPsico = tendraUnValor( "DiagnosticoPiscopedagogico" + S(x) ) ;

        info_cli.push_back( aux );
    }
}

void generarLogros(){
    logro aux ;
    int x ;

    for(int i=0; i<CANT_LOGROS; i++){
        x = i+1 ;

        aux.folio = x ;
        aux.matEstudiante = est[ azarEst() ].matricula ;
        aux.tipo = logros[ azarLogros() ];
        aux.descripcion = "Descripcion" + S(x) ;
        aux.fecha = fechaAleatoria();

        logr.push_back( aux );
    }
}

void generarTodos(){
    generarEstudiantes();
    generarTutores();
    generarDomicilios();
    generarUsuarios();
    generarReportes();
    generarConducta();
    generarInformacionClinica();
    generarLogros();
}


