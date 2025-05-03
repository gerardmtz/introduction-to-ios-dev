//
//  ViewController.m
//  AppDatePicker2
//
//  Created by geralduwu on 2025-04-29.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.datePicker.maximumDate = [NSDate date];
    
}

- (IBAction)nombre:(id)sender {
}

- (IBAction)calcularEdad:(id)sender {
    
    NSString *name = self.nombre.text;
    NSDate *fechaNacimiento = self.datePicker.date;
    NSInteger edad = [self calcularEdadDesde:fechaNacimiento];
    self.edad.text = [NSString stringWithFormat: @"Hola %@, tienes %li años", name, (long)edad];
    
}

-(NSInteger) calcularEdadDesde: (NSDate *) fechaNacimiento {
    NSDate *fechaActual = [NSDate date];
//    NSDateComponents *edadComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitYear];
    
    
    NSDateComponents *edadComponents = [ [ NSCalendar currentCalendar ]
                                         components:NSCalendarUnitYear
                                         fromDate:fechaNacimiento
                                         toDate:fechaActual options:0 ];
    
    return edadComponents.year;
}

@end
