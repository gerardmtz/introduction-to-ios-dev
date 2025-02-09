//
//  main.m
//  Practica1Classes
//
//  Created by geralduwu on 2025-01-29.
//

#import <Foundation/Foundation.h>
#import "MiClase.h"

int main(int argc, const char * argv[]) {
    
    /*
    @autoreleasepool { // no es obligatorio
        NSLog(@"Hello, World!");
    }
    */
    
    // Declaración de un pointer a NULL
    MiClase *objeto = nil;
    
    // Almacenamiento del objeto en memoria
    objeto = [[MiClase alloc] init]; // inicializacion en memoria
    
    int num1 = 10;
    float num2 = 5.2;
    
    // asignacion de un valor la propiedad numero entero
    [objeto setNumEntero:num1];
    // asignacion de un valor a la propiedad numero flotante
    [objeto setNumeroFraccion:num2];
    
    // mostramos el contenido del objeto.
    [objeto printNumeros];
    
    // borramos el objeto de memoria
//    [objeto release];
    
    [objeto setNumEntero: 35 NumFraccion: 3.14];
    [objeto printNumeros];
    
    MiClase *objeto2 = [[MiClase alloc] init];
    [objeto2 printNumeros];
    
    MiClase *objeto3 = [[MiClase alloc] initConNumeroEntero:80 NumFraccion:2.5];
    
    [objeto3 printNumeros];
    
    
    
    return 0;
}
