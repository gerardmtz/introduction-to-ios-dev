//
//  Cliente.h
//  Practica2Acceso
//
//  Created by geralduwu on 2025-02-04.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Cliente : NSObject {
@public // all the variables will accessible outside the class
    int clientNumber;
    NSString *phone;
    double credit;
    
@private // all variables are proper to the clase
    NSString *ine;
    NSString *name;
    NSString *lastname;
    NSString *address;
}

-(void) setName: (NSString *) name;
-(NSString *) getName;
@end

NS_ASSUME_NONNULL_END
