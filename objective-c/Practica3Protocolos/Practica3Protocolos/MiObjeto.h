//
//  MiObjeto.h
//  Practica3Protocolos
//
//  Created by geralduwu on 2025-02-05.
//

#import <Foundation/Foundation.h>
#import "Protocolo.h"

NS_ASSUME_NONNULL_BEGIN

@interface MiObjeto : NSObject <Protocolo> {
    // Declaración de atributos de tipo
    // entero y de punto flotante
    int intNum;
    float floatNum;
}

-(MiObjeto *) init;
-(MiObjeto *) initConNumeroEntero: (int) intNum NumFraccion: (float) floatNum;


-(void)  setIntNum: (int) intNum;
-(void)  setFloatNum: (float) floatNum;
-(int)   getIntNum;
-(float) getFloatNum;
-(void)  printNum;
-(void) setIntNum: (int) intNum floatNum: (float) floatNum;
@end

NS_ASSUME_NONNULL_END
