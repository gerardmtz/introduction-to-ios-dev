import Cocoa

var greeting = "Hello, playground"


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
