//
//  ViewController.m
//  AppDigitalTimer
//
//  Created by geralduwu on 2025-03-01.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
// ***** CUSTOM FONT SETUP *****
    
// 1. Listar fuentes disponibles (solo para depuración)
    NSArray *familyNames = [[UIFont familyNames] sortedArrayUsingSelector:@selector(compare:)];
    for (NSString *family in familyNames) {
        NSArray *fontNames = [UIFont fontNamesForFamilyName:family];
        NSLog(@"Family: %@ Font names: %@", family, fontNames);
    }
    
// 2. Configurar fuente personalizada
    CGFloat fontSize = 80;
    UIFont *customFont = [UIFont fontWithName:@"digital-7" size:fontSize];
   
   if (!customFont) {
       NSString *errorMessage = @"Error cargando la fuente. Verifica:\n 1. Que el archivo .ttf/.otf está en el proyecto\n 2. Que el nombre coincide exactamente\n 3. Que está listado en Info.plist (Fonts provided by application);";
       
       NSLog(@"%@", errorMessage);
       abort(); // Solo para desarrollo, quitar en producción
   }
    
    // 3. Aplicar fuente al label con soporte Dynamic Type
    self.label.font = [[UIFontMetrics defaultMetrics] scaledFontForFont:customFont];
    self.label.adjustsFontForContentSizeCategory = YES;

// **********
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0
             target:self
             selector:@selector(updateTimer)
             userInfo:nil
             repeats:YES];
}

-(void) updateTimer {
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
    [timeFormat setDateFormat:@"HH:mm:ss"];
    self.label.text=[timeFormat stringFromDate:[NSDate date]];
}

@end
