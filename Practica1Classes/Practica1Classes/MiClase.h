//
//  MiClase.h
//  Practica1Classes
//
//  Created by geralduwu on 2025-01-29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MiClase : NSObject {
    // Declaración de atributos de tipo
    // entero y de punto flotante
    int numEntero;
    float numFlotante;
}

-(MiClase *) init;
-(MiClase *) initConNumeroEntero: (int) entero NumFraccion: (float) fraccion;


-(void)  setNumEntero: (int) numero;
-(void)  setNumeroFraccion: (float) numero;
-(int)   getNumeroEntero;
-(float) getNumeroFraccion;
-(void)  printNumeros;
-(void) setNumEntero: (int) numero NumFraccion: (float) fraccion;

@end

NS_ASSUME_NONNULL_END
