// Gerardo Martinez - C20131354

// Al momento de introducir el código y
// ejecutarlo en mycompiler.io
// el programa fallará porque necesita
// de una entrada de datos.

// Sólo una vez introducidos 
// los datos de entrada
// el programa se ejecutará
// correctamente

import Foundation

struct Estudiante {
    var nombre: String
    var calificacion: Int
}

func clasificar(calificacion: Int) -> String {
    switch calificacion {
    case 90...100:
        return "Aprobado con Excelencia"
    case 70..<90:
        return "Aprobado"
    case 60..<70:
        return "Extraordinario"
    case 0..<60:
        return "Reprobado"
    default:
        return "Calificación inválida"
    }
}

var listaEstudiantes: [Estudiante] = []
var continuar = true

print("**** Clasificador de Alumnos ****")
print("Introduzca los alumnos a calificar...")

repeat {
    print("Nombre: ", terminator: "")
    guard let nombreAlumno = readLine(), !nombreAlumno.isEmpty else {
        print("Nombre inválido.")
        continue
    }

    print("Calificación (0 a 100): ", terminator: "")
    guard let calificacionInput = readLine(),
        let calificacion = Int(calificacionInput),
        calificacion >= 0 && calificacion <= 100
    else {
        print("Calificación inválida.")
        continue
    }

    listaEstudiantes.append(
        Estudiante(nombre: nombreAlumno, calificacion: calificacion)
    )

    print("¿Desea continuar registrando alumnos? (s/n): ", terminator: "")
    if let respuesta = readLine()?.lowercased(), respuesta != "s" {
        continuar = false
    }

} while continuar

print("\n📋 RESULTADOS:")

for estudiante in listaEstudiantes {
    let estado = clasificar(calificacion: estudiante.calificacion)

    print(
        "👤 \(estudiante.nombre)\n" + 
        "Calificación: \(estudiante.calificacion)\n" +
        "Estado: \(estado)"
    )
}
