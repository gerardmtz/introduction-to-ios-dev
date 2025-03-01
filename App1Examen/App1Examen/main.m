//
//  main.m
//  App1Examen
//
//  Created by geralduwu on 2025-02-28.
//

#import <Foundation/Foundation.h>

int factorial(int num) {
    
    int result = 1;
    
    for (int i = 1; i<=num; i++) {
        result = result * i;
    }
    
    return result;
}

int main(int argc, const char * argv[]) {
    
    int inputNumber = 1, factorialResult = 1;
    
    printf("***** Calculo de factorial *****\n");
    printf("Introduce un numero: ");
    scanf("%d", &inputNumber);
    
    factorialResult = factorial(inputNumber);
    
    printf("\nEl resultado es: %d\n", factorialResult);

    return 0;
}
