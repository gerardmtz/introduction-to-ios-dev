//
//  main.m
//  AppPuntero
//
//  Created by geralduwu on 2025-03-14
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        int iValor = 100; // declaración de una variable entera
        int *iPuntero; // declaración de un puntero a un entero
        iPuntero = &iValor; // se guarda la dirección de iValor en iPuntero
        NSLog(@"La dirección de memoria de la variable iValor es: %x\n", &iValor );
        NSLog(@"La dirección almacenada en el puntero iPuntero es: %x\n", iPuntero );
        NSLog(@"El valor que contiene el puntero es: %d\n", *iPuntero );
    }
    return 0;
}
