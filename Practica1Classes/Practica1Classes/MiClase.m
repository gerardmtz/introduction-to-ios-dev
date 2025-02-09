//
//  MiClase.m
//  Practica1Classes
//
//  Created by geralduwu on 2025-01-29.
//

#import "MiClase.h"
#import <stdio.h>

@implementation MiClase

-(MiClase *) init {
    self = [super init];
    if (self) {
        numEntero = 20;
        numFlotante = 3.5;
    }
    return self;
}

-(MiClase *) initConNumeroEntero: (int) entero NumFraccion: (float) fraccion {
    self = [super init];
    if (self) {
        [self setNumEntero: entero];
        [self setNumeroFraccion: fraccion];
    }
    return self;
}

-(void)  setNumEntero: (int) numero {
    numEntero = numero;
    
}
-(void)  setNumeroFraccion: (float) numero {
    numFlotante = numero;
}
-(int)   getNumeroEntero {
    return numEntero;
}
-(float) getNumeroFraccion {
    return numFlotante;
}
-(void)  printNumeros {
    printf("Numero entero: %d\n", numEntero);
    printf("Numero flotante: %2.2f\n", numFlotante);
}

-(void) setNumEntero: (int) numero NumFraccion: (float) fraccion {
    numEntero = numero;
    numFlotante = fraccion;
}

@end
