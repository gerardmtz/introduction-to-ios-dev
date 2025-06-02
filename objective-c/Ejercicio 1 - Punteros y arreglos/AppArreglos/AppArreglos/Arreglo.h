//
//  Arreglo.h
//  AppArreglos
//
//  Created by geralduwu on 2025-03-14
//

#ifndef Arreglo_h
#define Arreglo_h

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Arreglo : NSObject

+ (void)intercambia:(int *)a con:(int *)b;
+ (int *)ordenar:(int *)arr tamaño:(int)n;
+ (int *)busquedaSecuencial:(int *)arr tamaño:(int)n valor:(int)clave;

@end

NS_ASSUME_NONNULL_END
#endif /* Arreglo_h */
