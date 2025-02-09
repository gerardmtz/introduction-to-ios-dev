//
//  ViewController.m
//  AppHolaMundo
//
//  Created by geralduwu on 2025-02-05.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_texto setStringValue:@"Hola desde el Tec Laguna!"];
}

- (IBAction)texto:(NSTextField *)sender {
}

- (IBAction)saludar:(NSButton *)sender {
}

- (IBAction)limpiar:(NSButton *)sender {
}

//- (void)setRepresentedObject:(id)representedObject {
//    [super setRepresentedObject:representedObject];
//
//    // Update the view, if already loaded.
//}
//
//
//- (IBAction)limpia:(id)sender {
//    [_texto setStringValue: @""];
//}
//
//- (IBAction)saluda:(id)sender {
//    [_texto setStringValue:@"Hola iOS!"];
//}
@end
