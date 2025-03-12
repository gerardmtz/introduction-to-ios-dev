//
//  AppDelegate.m
//  AppCalculadora2
//
//  Created by geralduwu on 2025-02-11.
//

#import "AppDelegate.h"

// Definimos la enumeración para las operaciones fuera de la interfaz
typedef NS_ENUM(NSInteger, OperationType) {
    OperationTypeNone,
    OperationTypeAddition,
    OperationTypeSubtraction,
    OperationTypeMultiplication,
    OperationTypeDivision,
    OperationTypeSquareRoot,
    OperationInverse,
    OperationSin,
    OperationCos,
    OperationMemoryStore,
    OperationMemoryRecall,
    OperationMemoryAddition,
    OperationClearAll
};

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@property (nonatomic, strong) NSMutableString *currentInput; // Usamos un NSMutableString para almacenar los dígitos
@property (nonatomic, assign) double result;
@property (nonatomic, assign) OperationType operation; // Usamos la enumeración para la operación
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    self.currentInput = [NSMutableString string];
    self.result = 0;
    self.operation = OperationTypeNone; // Inicializamos sin operación
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {}

- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}

- (IBAction)pressDigit:(NSButton *)sender {
    NSString *digit = sender.title;
    [self.currentInput appendString:digit];
    self.display.stringValue = self.currentInput;
}

- (IBAction)pressOp:(id)sender {
    if (self.currentInput.length > 0) {
        self.result = [self.currentInput doubleValue];
        [self.currentInput setString:@""];
    }
    
    // Asignamos la operación basada en el título del botón
    NSString *opTitle = [sender title];
    if ([opTitle isEqualToString:@"+"]) {
        self.operation = OperationTypeAddition;
    } else if ([opTitle isEqualToString:@"-"]) {
        self.operation = OperationTypeSubtraction;
    } else if ([opTitle isEqualToString:@"x"]) {
        self.operation = OperationTypeMultiplication;
    } else if ([opTitle isEqualToString:@"/"]) {
        self.operation = OperationTypeDivision;
    } else if ([opTitle isEqualToString:@"√"]) {
        self.operation = OperationTypeSquareRoot;
    } else if ([opTitle isEqualToString:@"1/x"]) {
        self.operation = OperationInverse;
    } else if ([opTitle isEqualToString:@"MS"]) {
        self.operation = OperationMemoryStore;
    } else if ([opTitle isEqualToString:@"MR"]) {
        self.operation = OperationMemoryRecall;
    } else if ([opTitle isEqualToString:@"M+"]) {
        self.operation = OperationMemoryAddition;
    } else if ([opTitle isEqualToString:@"C"]) {
        self.operation = OperationClearAll;
    }
    
    NSLog(@"Título del botón: '%@', operación asignada: %ld", opTitle, (long)self.operation);

}

- (IBAction)pressEqual:(id)sender {
    double secondNumber = [self.currentInput doubleValue];
    
    switch (self.operation) {
        case OperationTypeAddition:
            self.result += secondNumber;
            break;
        case OperationTypeSubtraction:
            self.result -= secondNumber;
            break;
        case OperationTypeMultiplication:
            self.result *= secondNumber;
            break;
        case OperationTypeDivision:
            if (secondNumber != 0) {
                self.result /= secondNumber;
            } else {
                self.display.stringValue = @"Error: División por cero";
                [self.currentInput setString:@""];
                return;
            }
            break;
        case OperationTypeSquareRoot:
            if (self.result >= 0) {
                self.result = sqrt(self.result);
            } else {
                self.display.stringValue = @"Error: Raíz de número negativo";
                [self.currentInput setString:@""];
                return;
            }
            break;
        case OperationInverse:
            if (self.result != 0) {
                self.result = 1 / self.result;
            } else {
                self.display.stringValue = @"Error: División por cero";
                return;
            }
            break;
        case OperationSin:
            self.result = sin(self.result);
            break;
        case OperationCos:
            self.result = cos(self.result);
            break;
        case OperationMemoryStore:
            self->memoryValue = self.result;
            break;
        case OperationMemoryRecall:
            self.result = self->memoryValue;
            break;
        case OperationMemoryAddition:
            self->memoryValue += self.result;
            break;
        case OperationClearAll:
            self.result = 0;
            [self.currentInput setString:@""];
            self->memoryValue = 0;
            break;
        default:
            NSLog(@"Operación no válida");
            break;
    }
    
    self.display.stringValue = [NSString stringWithFormat:@"%.2f", self.result];
    [self.currentInput setString:@""];
}


@end
