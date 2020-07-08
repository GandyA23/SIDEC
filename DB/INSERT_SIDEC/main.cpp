/*
 *  Ver 1.0 Fecha desconocida XD
 *
    Ver 1.5 11/jun/2020
 *      Cambio en los codigos debido a que se cambio la BD
 *      Se elimino las struct alergias, enfermdedades y discapacidades y sus relaciones con
 *      estudiantes, se actualizo informacion clinica y se normalizaron los logros
 *
    Ver 1.5 Separar Codigo 22/Jun/2020

    Programa que genera sentencias
    INSERT para probar la BD
*/

#include <bits/stdc++.h>

//Librerias para caracteres especiales
#include <wchar.h>
#include <locale.h>

//Cantidad de sentencias en cada tabla
#define CANT_ESTUDIANTES 500
#define CANT_TUTORES 300
#define CANT_DOMICILIOS 250
#define CANT_USUARIOS 30
#define CANT_REPORTES 100
#define CANT_CONDUCTA CANT_ESTUDIANTES
#define CANT_INFORMACION_CLINICA CANT_ESTUDIANTES
#define CANT_LOGROS 200

using namespace std ;

#include "declarar.h"
#include "funciones.h"
#include "generar.h"
#include "imprimir.h"
#include "Valores_Para_Azar.h"


int main(){

    //Para caracteres especiales
    setlocale(LC_ALL, "");

    //funciones.h
    insertarValoresParaAzar();

    //generar.h
    generarTodos();

    //imprimir.h
    imprimirTodos();

    return 0 ;
}
