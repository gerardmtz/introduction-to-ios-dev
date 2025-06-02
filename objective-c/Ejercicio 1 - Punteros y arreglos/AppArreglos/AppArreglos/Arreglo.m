//
//  Arreglo.m
//  AppArreglos
//
//  Created by geralduwu on 2025-03-14
//

#import "Arreglo.h"

@implementation Arreglo

+ (void)intercambia:(int *)a con:(int *)b {
    int tmp = *a;
    *a = *b;
    *b = tmp;
}

+ (int *)busquedaSecuencial:(int *)arr tamaño:(int)n valor:(int)clave {
    //iteramos por el arreglo para buscar el elemento
    for (int i = 0; i < n; i++) {
        //si el elemento actual iterado es igual al elemento buscado
        //devolvemos la direccion del elemento
        if (arr[i] == clave) {
            // Retornamos la dirección del elemento encontrado
            return &arr[i];
        }
    }
   //si no es encontrado devolvemos -1
    return -1;
}

+ (int *)ordenar:(int *)arr tamaño:(int)n {
    int numComp = 0, numInterc = 0;
    // Reservar memoria dinámicamente para el arreglo copiado
    int *p = malloc(n * sizeof(int));
    if (p == NULL) {
        NSLog(@"Error: No se pudo asignar memoria.");
        return NULL;
    }
    // Copiar el arreglo original
    for (int i = 0; i < n; i++) {
        p[i] = arr[i];
    }
    // Ordenar el arreglo (algoritmo bubble sort)
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - 1 - i; j++) {
            if (p[j] > p[j + 1]) {
                [Arreglo intercambia:&p[j] con:&p[j + 1]];
                numInterc++;
            }
            numComp++;
        }
    }
    
    NSLog(@"Intercambios = %d", numInterc);
    NSLog(@"Comparaciones = %d", numComp);
    
    return p;
}

@end
