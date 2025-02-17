//
//  AppDelegate.m
//  AppCalculadora1
//
//  Created by geralduwu on 2025-02-10.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@end

@implementation AppDelegate
@synthesize txtOp, txtNum1, txtNum2, textIgual, textResul;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}


- (IBAction)btnDivide:(id)sender {
    float a = [txtNum1 floatValue];
    float b = [txtNum2 floatValue];
    float c = a / b;
    
    txtOp.stringValue = @" ÷ ";
    textResul.stringValue = [NSString stringWithFormat: @"%.2f", c];
}

- (IBAction)btnMultiplica:(id)sender {
    float a = [txtNum1 floatValue];
    float b = [txtNum2 floatValue];
    float c = a * b;
    
    txtOp.stringValue = @" 𝘅 ";
    textResul.stringValue = [NSString stringWithFormat: @"%.2f", c];
}

- (IBAction)btnResta:(id)sender {
    float a = [txtNum1 floatValue];
    float b = [txtNum2 floatValue];
    float c = a - b;
    
    txtOp.stringValue = @" − ";
    textResul.stringValue = [NSString stringWithFormat: @"%.2f", c];
    
}

- (IBAction)btnSuma:(id)sender {
    float a = [txtNum1 floatValue];
    float b = [txtNum2 floatValue];
    float c = a + b;
    
    txtOp.stringValue = @" ✚ ";
    textResul.stringValue = [NSString stringWithFormat: @"%.2f", c];
    
}
@end
