//
//  ViewController.m
//  AppConvertidorGrados
//
//  Created by geralduwu on 2025-02-07.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


- (IBAction)fac:(id)sender {
    NSString *screen = [_display stringValue];
    fahrenheit = [screen floatValue];
    celcius = (5.0/9.0)*(fahrenheit-32);
    
    [_display setStringValue: [NSString stringWithFormat:@"%.2f", celcius]];
    
}

- (IBAction)caf:(id)sender {
    
    NSString *screen = [_display stringValue];
    celcius = [screen floatValue];
    fahrenheit = celcius * 9/5 + 32;
    
    [_display setStringValue: [NSString stringWithFormat:@"%.2f", fahrenheit]];
}
@end
