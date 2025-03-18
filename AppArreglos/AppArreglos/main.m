//
//  main.m
//  AppArreglos
//
//  Created by geralduwu on 2025-03-14
//

#import <Foundation/Foundation.h>
#import "Arreglo.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int n = 6;
        int arr[] = {7, 4, 0, 1, 5, 3};
        
        // Ordena el arreglo y devuelve un nuevo arreglo ordenado
        int *resul = [Arreglo ordenar:arr tamaño:n];
        if (resul == NULL) {
            NSLog(@"Error al ordenar el arreglo.");
            return 1;
        }
        
        NSLog(@"Arreglo original:");
        for (int i = 0; i < n; i++) {
            NSLog(@"arreglo [%d] = %d", i, arr[i]);
        }
        
        NSLog(@"Arreglo ordenado:");
        for (int i = 0; i < n; i++) {
            NSLog(@"arreglo [%d] = %d", i, resul[i]);
        }
        
        int valorBuscado = 1213;
        int *resultado = [Arreglo busquedaSecuencial:arr tamaño:n valor:valorBuscado];
        
        if (resultado != -1) {
            // Calculamos el índice usando la diferencia de punteros
            int indice = (int)(resultado - arr);
            NSLog(@"El valor %d se encontró en la posición %d.", valorBuscado, indice);
        } else {
            NSLog(@"El valor %d no se encontró en el arreglo.", valorBuscado);
        }
        // Liberar la memoria reservada para el arreglo ordenado
        free(resul);
    }
    return 0;
}
