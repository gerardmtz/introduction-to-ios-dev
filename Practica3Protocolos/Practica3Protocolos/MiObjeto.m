//
//  MiObjeto.m
//  Practica3Protocolos
//
//  Created by geralduwu on 2025-02-05.
//

#import "MiObjeto.h"

@implementation MiObjeto
-(MiObjeto *) init {
    self = [super init];
    if (self) {
        intNum = 20;
        floatNum = 3.5;
    }
    return self;
}

-(MiObjeto *) initConNumeroEntero: (int) intNum NumFraccion: (float) floatNum {
    self = [super init];
    if (self) {
        [self setIntNum: intNum];
        [self setFloatNum: floatNum];
    }
    return self;
}

-(void) print {
    NSLog(@"Soy un objeto de tipo MiObjeto que implementa mi primer protocolo Protocolo!\n");
}


- (int)getIntNum {
    return intNum;
}

- (void)printNum {
    printf("Numero entero: %d\n", intNum);
    printf("Numero flotante: %2.2f\n", floatNum);
}

- (void)setFloatNum:(float)floatNum {
    self.floatNum = intNum;
}

- (void)setIntNum:(int)intNum floatNum:(float)floatNum {
    self.intNum = intNum;
    self.floatNum = floatNum;
}

- (float)getFloatNum {
    return floatNum;
}

- (void)setIntNum:(int)intNum {
    self.intNum = intNum;
}

@end
