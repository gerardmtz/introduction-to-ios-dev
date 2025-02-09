//
//  main.m
//  Practica3Protocolos
//
//  Created by geralduwu on 2025-02-05.
//

#import <Foundation/Foundation.h>
#import "MiObjeto.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MiObjeto *objeto = [[MiObjeto alloc]init];
        id <Protocolo> esteObjetoHacePrint = objeto;
        
        [esteObjetoHacePrint print];
        
    }
    return 0;
}
