//
//  main.swift
//  IntroSwift
//
//  Created by geralduwu on 2025-05-14.
//

import Foundation

// operadores logicos
let coincidePassword = true;
let pasoPruebaRetina = false;

// operador AND
if (coincidePassword && pasoPruebaRetina) {
    print("Acceso concedido");
} else {
    print("Acceso denegado");
}

// operador OR
if (coincidePassword || pasoPruebaRetina) {
    print("Acceso concedido");
} else {
    print("Acceso denegado");
}

// operador NOT
let switchOn = true;
print(switchOn);
print(!switchOn);

print();
print("+++++++++++++++++++++++++++++++++++++++");
print();

// operaciones de rango
// rango cerrado
let rango = 1...5

for index in rango {
    print("\(index) x 5 = \(index*5)");
}

// rango semi-abierto
let rango2 = 1..<5
for numero in rango2 {
    print(numero)
}

let valor = 3

if rango2.contains(valor) {
    print("Contiene el valor")
} else {
    print("No contiene el valor")
}

// rango unilateral superior
let rango3 = 1...

for numero3 in rango3 {
    if numero3 > 10 {
        break
    }
    print(numero3);
}

// rango unilateral inferior
var meses  = ["Enero", "Febero", "Marzo", "Abril", "Mayo", "Junio"]
for nombre in meses [...3] {
    print(nombre);
}

print();
print("+++++++++++++++++++++++++++++++++++++++");
print();

// operation relacion
let a = 5
let b = 10

// operador igual que
if (a == b) {
    print("son iguales")
} else {
    print("son diferentes")
}

// operador diferente que
if (a != b) {
    print("son diferentes")
    
} else {
    print("son iguales");
}

// operador mayor que
if (a > b) {
    print("a es mayor que b")
} else {
    print("a es menor que b")
}

if (a < b) {
    print("a es menor que b")
} else {
    print("a no es mayor o igual que b")
}

print();
print("+++++++++++++++++++++++++++++++++++++++");
print();

// ***** USO DE CADENAS Y EMOJI *****
let texto: String = "Hola 👋";
let texto2: String = " Mundo 🌎";
let texto3: String = texto + texto2;
print(texto3);

// desplegar cada caracter
for character in texto3 {
    print(character);
}

print("Numero de caraceres: ", texto3.count);

var texto4: String = texto;
texto4 += texto2;
print("Texto4 ", texto4);

print();
print("+++++++++++++++++++++++++++++++++++++++");
print();

// Uso de colecciones
// 1. Array
var colores : [String] = ["rojo", "verde","azul"];

colores.append("rosa");
print("Array de colores: ", colores);
print("Primer color: ", colores.first ?? "vacio");

// 2. set
var conjunto: Set = [1, 2, 3, 4, 5];
print("Set de numeros: ", conjunto);
conjunto.insert(6);
print("Set de numeros: ", conjunto);

// 3. Diccionario
var capitales = ["Coahuila" : "Saltillo", "Nuevo Leon" : "Monterrey", "Vera Cruz" : "Jalapa", "Chiapas" : "Tuxtla Gutierrez"];
print("Capitales", capitales);
print("Capital de Chiapa: ", capitales["Chiapas"] ?? "Vacio");

// 4. Tuplas
// Tupla simple
let coordenada = (x: 10, y: 20);
print("x = \(coordenada.x)");
print("Y = \(coordenada.y)");
print();

//2. Tupla sin nombres (acceso por medio de indice)
let usuario = ("Lina", 1997, true);
print("Nombre: \(usuario.0)");
print("Año ingreso: \(usuario.1)");
print("Activo(a): \(usuario.2 ? "Si" : "No")");
print();

// 3. ignorar valores (usamos guion bajo)
let punto3D = (x: 1, y:2, z:3);
let (soloX, _, _) = punto3D;
print("Solo coordenada x: \(soloX)");
let (_, soloY, _) = punto3D;
print("Solo coordenada x: \(soloY)");
print();

// 4. Tupla como valor de retorno de una funcion
func obtenerResultado() -> (nombre:String, edad:Int) {
    return ("Javier", 19);
}
let usuario2 = obtenerResultado();
print("Nomrbe \(usuario2.nombre), edad: \(usuario2.edad)");
print();

// 5. tuplas anidadas
let libro = (titulo: "1984", autor: ("George", "Orwell"));
print("Titulo: \(libro.titulo), Autor: \(libro.autor.0) \(libro.autor.1)");
print();

// 6. comparacion de tuplas
let t1 = (2, "Swift");
let t2 = (3, "Kotlin");
let t3 = (1, "C++");
let t4 = (3, "Kotlin");
print("t1 es igual a la tupla t2: \(t1==t2)");
print ("t2 es igual a la t4: \(t2==t4)");
print();

print();
print("+++++++++++++++++++++++++++++++++++++++");
print();

// Uso de Struct
//1. Definicion de una estructura
struct Usuario {
    var nombre: String
    var year: String
    var activo: Bool
};
// 2 Creamos instancia
var usuario3 = Usuario(nombre: "Lina", year: "1997", activo: true);
print("Datos del usuario");
print("Nombre: \(usuario3.nombre)")
print("Fecha de ingreso: \(usuario3.year)");
print("Activo(a): \(usuario3.activo ? "Si" : "No")");
print();

// 3. Combinar datos:
usuario3.nombre = "otro profesor";
usuario3.year = "2012";

print();
print("+++++++++++++++++++++++++++++++++++++++");
print();

// 5. declarar funciones dentro de las estructuras
struct Rectangulo {
    var base: Double
    var altura: Double
    
    func area() -> Double {
        return base * altura
    }
};

let rect = Rectangulo(base: 10, altura: 20);
print("Area del rectangulo: \(rect.area())");
print();

// 6. Otra forma:
struct Circulo {
    var radio: Double
    var area: Double {
        return Double.pi*radio*radio;
    }
};

let circ = Circulo(radio: 2.0);
print("Area del ciruclo = \(circ.area)");

// 7. Tuple vs Sctruct
let tuplaUsuario = (nombre: "Lina", yearIngreso : 1997, activo: true);
print("Tupla: \(tuplaUsuario.nombre), \(tuplaUsuario.yearIngreso)");
print("Struct: \(usuario3.nombre), \(usuario3.year)");
