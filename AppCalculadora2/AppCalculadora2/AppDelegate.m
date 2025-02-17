//
//  AppDelegate.m
//  AppCalculadora2
//
//  Created by geralduwu on 2025-02-11.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@property (nonatomic, strong) NSMutableString *currentInput; // using a mutable string to sotre digits
@property (nonatomic, assign) double result;
@property (nonatomic, assign) char operation;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    self.currentInput = [NSMutableString string];
    self.result = 0;
    self.operation = ' ';
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}

// In case we used id
// - (IBAction)pressDigit:(id)sender {
// NSString *digit = [sender title];


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
    self.operation = [[sender title] characterAtIndex:0];
}

- (IBAction)pressEqual:(id)sender {
    double secondNumber = [self.currentInput doubleValue];
    
    switch (self.operation) {
        case '+': self.result+= secondNumber; break;
        case '-': self.result-= secondNumber; break;
        case 'x': self.result*= secondNumber; break;
        case '/': self.result/= secondNumber; break;
    }
    
    self.display.stringValue = [NSString stringWithFormat:@"%.2f", self.result];
    [self.currentInput setString:@""];
}
@end
