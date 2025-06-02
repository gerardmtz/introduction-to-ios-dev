//
//  main.m
//  Practica2Acceso
//
//  Created by geralduwu on 2025-02-04.
//

#import <Foundation/Foundation.h>
#import "Cliente.h"

int main(int argc, const char * argv[]) {
        Cliente *client = [[Cliente alloc] init];
        
        // accessing public atributes
        client->phone = @"8711060231";
        client->credit = 10000.0;
        
        // adding private atributes:
        [client setName:(@"John")];
        
    NSLog(@"Nombre: %@", [client getName]);
                
    return 0;
}
