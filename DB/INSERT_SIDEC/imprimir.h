void imprimirINSERTestudiantes(){
    cout << "INSERT INTO ESTUDIANTE (Matricula, Curp, Nombre, apellido1, apellido2, FechaNacimiento, Telefono, Correo, Genero, CicloEscolar, NivelActual, Status)\n" ;
    cout << "VALUES\n" ;

    for(int i=0; i<est.size(); i++ ){
        cout << "(" ;
        cout << "'" << est[i].matricula << "', " ;
        cout << "'" << est[i].curp << "', " ;
        cout << "'" << est[i].nombre << "', " ;
        cout << "'" << est[i].apellido1 << "', " ;

        if(est[i].apellido2 != "NULL")
            cout << "'" << est[i].apellido2 << "', " ;
        else
            cout << "NULL, " ;

        cout << "'" << est[i].fechaNacimiento << "', " ;

        if(est[i].telefono != "NULL")
            cout << "'" << est[i].telefono << "', " ;
        else
            cout << "NULL, " ;

        if(est[i].correo != "NULL")
            cout << "'" << est[i].correo << "', " ;
        else
            cout << "NULL, " ;

        cout << "'" << est[i].genero << "', " ;
        cout << "'" << est[i].nivelActual << "', " ;
        cout << "'" << est[i].cicloEscolar << "', " ;
        cout << est[i].status ;
        cout << ")" << (i != est.size()-1 ? ",\n" : " ") ;
    }

    cout << "\n;\n\n" ;
}

void imprimirINSERTtutores() {
    cout << "INSERT INTO TUTOR (Nombre, apellido1, apellido2, TelefonoPersonal, TelefonoTrabajo, Correo, Genero)\n" ;
    cout << "VALUES\n" ;

    for(int i=0; i<tut.size(); i++ ){
        cout << "(" ;
        cout << "'" << tut[i].nombre << "', " ;
        cout << "'" << tut[i].apellido1 << "', " ;

        if(tut[i].apellido2 != "NULL")
            cout << "'" << tut[i].apellido2 << "', " ;
        else
            cout << "NULL, " ;

        cout << "'" << tut[i].telefonoPersonal << "', " ;

        if(tut[i].telefonoTrabajo != "NULL")
            cout << "'" << tut[i].telefonoTrabajo << "', " ;
        else
            cout << "NULL, " ;

        if(tut[i].correo != "NULL")
            cout << "'" << tut[i].correo << "', " ;
        else
            cout << "NULL, " ;

        cout << "'" << tut[i].genero << "' " ;
        cout << ")" << (i != tut.size()-1 ? ",\n" : " ") ;
    }

    cout << "\n;\n\n" ;
}

void imprimirINSERTdomicilios(){
    cout << "INSERT INTO DOMICILIO (MatEstudiante, IdTutor, Calle, NoExterior, NoInterior, Colonia, Municipio, CodigoPostal)\n" ;
    cout << "VALUES\n" ;

    for(int i=0; i<dom.size(); i++ ){
        cout << "(" ;
        cout << "'" << dom[i].matEstudiante << "', " ;
        cout << dom[i].idTutor << ", " ;
        cout << "'" << dom[i].calle << "', " ;
        cout << "'" << dom[i].noExterior << "', " ;

        if( dom[i].noInterior != "NULL" )
    		cout << "'" << dom[i].noInterior << "', " ;
    	else
    		cout << "NULL, " ;

    	cout << "'" << dom[i].colonia << "', " ;
    	cout << "'" << dom[i].municipio << "', " ;
    	cout << "'" << dom[i].codigoPostal << "'" ;

        cout << ")" << (i != dom.size()-1 ? ",\n" : " ") ;
    }

    cout << "\n;\n\n" ;
}

void imprimirINSERTusuarios(){
    cout << "INSERT INTO USUARIO (CCT, Password, Correo, Nombre, apellido1, apellido2, Rol)\n" ;
    cout << "VALUES\n" ;

    for(int i=0; i<usu.size(); i++ ){
        cout << "(" ;
        cout << "'" << usu[i].cct << "', " ;
        cout << "'" << usu[i].password << "', " ;

        if(usu[i].correo != "NULL")
            cout << "'" << usu[i].correo << "', " ;
        else
            cout << "NULL, " ;

        cout << "'" << usu[i].nombre << "', " ;
        cout << "'" << usu[i].apellido1 << "', " ;

        if(usu[i].apellido2 != "NULL")
            cout << "'" << usu[i].apellido2 << "', " ;
        else
            cout << "NULL, " ;

        cout << "'" << usu[i].rol << "' " ;
        cout << ")" << (i != usu.size()-1 ? ",\n" : " ") ;
    }

    cout << "\n;\n\n" ;
}

void imprimirINSERTreportes(){
    cout << "INSERT INTO REPORTE (Fecha, Motivo, Descripcion, Canalizacion, CCT, MatEstudiante)\n" ;
    cout << "VALUES\n" ;

    for(int i=0; i<rep.size(); i++ ){
        cout << "(" ;
        cout << "'" << rep[i].fecha << "', " ;
        cout << "'" << rep[i].motivo << "', " ;
        cout << "'" << rep[i].descripcion << "', " ;
        cout << "'" << rep[i].canalizacion << "', " ;
        cout << "'" << rep[i].cct << "', " ;
        cout << "'" << rep[i].matEstudiante << "' " ;
        cout << ")" << (i != rep.size()-1 ? ",\n" : " ") ;
    }

    cout << "\n;\n\n" ;
}

void imprimirINSERTconducta(){
    cout << "INSERT INTO CONDUCTA (MatEstudiante, Fecha, Observaciones)\n" ;
    cout << "VALUES\n" ;

    for(int i=0; i<con.size(); i++){
        cout << "(" ;
        cout << "'" << con[i].matEstudiante << "', " ;
        cout << "'" << con[i].fechaHora << "', " ;
        cout << "'" << con[i].observaciones << "' " ;
        cout << ")" << (i != con.size()-1 ? ",\n" : " ") ;
    }

    cout << "\n;\n\n" ;
}

void imprimirINSERTinformacion_clinica(){
    cout << "INSERT INTO INFORMACION_CLINICA (MatEstudiante, Peso, Estatura, Imc, TipoSangre, NumeroSeguro, UnidadMedica, Alergias, EnferCronicas, EnferHereditarias, Discapacidades, DiagPsico)\n" ;
    cout << "VALUES\n" ;

    for(int i=0; i<info_cli.size(); i++){
        cout << "(" ;
        cout << "'" << info_cli[i].matEstudiante << "', " ;
        cout << info_cli[i].peso << ", " ;
        cout << info_cli[i].estatura << ", " ;
        cout << info_cli[i].imc << ", " ;
        cout << "'" << info_cli[i].tiposDeSangre << "', " ;
        cout << "'" << info_cli[i].numeroSeguro << "', " ;
        cout << "'" << info_cli[i].unidadMedica << "', " ;

        if(info_cli[i].alergias != "NULL")
            cout << "'" << info_cli[i].alergias << "', " ;
        else
            cout << "NULL, " ;

        if(info_cli[i].enferCronicas != "NULL")
            cout << "'" << info_cli[i].enferCronicas << "', " ;
        else
            cout << "NULL, " ;

        if(info_cli[i].enferHereditarias != "NULL")
            cout << "'" << info_cli[i].enferHereditarias << "', " ;
        else
            cout << "NULL, " ;

        if(info_cli[i].discapacidades != "NULL")
            cout << "'" << info_cli[i].discapacidades << "', " ;
        else
            cout << "NULL, " ;

        if(info_cli[i].diagPsico != "NULL")
            cout << "'" << info_cli[i].diagPsico << "' " ;
        else
            cout << "NULL " ;

        cout << ")" << (i != info_cli.size()-1 ? ",\n" : " ") ;
    }

    cout << "\n;\n\n" ;
}

void imprimirINSERTlogros(){
    cout << "INSERT INTO LOGRO ( Folio, MatEstudiante, Tipo, Descripcion, fecha )\n" ;
    cout << "VALUES\n" ;

    for(int i=0; i<logr.size(); i++){
        cout << "(" ;
        cout << logr[i].folio << ", " ;
        cout << "'" << logr[i].matEstudiante << "', " ;
        cout << "'" << logr[i].tipo << "', " ;
        cout << "'" << logr[i].descripcion << "', " ;
        cout << "'" << logr[i].fecha << "'" ;
        cout << ")" << (i != logr.size()-1 ? ",\n" : " ") ;
    }

    cout << "\n;\n\n" ;
}

void imprimirTodos(){
    imprimirINSERTestudiantes();
    imprimirINSERTtutores();
    imprimirINSERTdomicilios();
    imprimirINSERTusuarios();
    imprimirINSERTreportes();
    imprimirINSERTconducta();
    imprimirINSERTinformacion_clinica();
    imprimirINSERTlogros();
}
