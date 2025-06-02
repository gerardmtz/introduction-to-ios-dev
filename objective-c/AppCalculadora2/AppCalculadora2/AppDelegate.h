//
//  AppDelegate.h
//  AppCalculadora2
//
//  Created by geralduwu on 2025-02-11.
//

#import <Cocoa/Cocoa.h>
#import <math.h>

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    double memoryValue;
}

@property (weak) IBOutlet NSTextField *display;

- (IBAction)pressEqual:(id)sender;

- (IBAction)pressOp:(id)sender;

- (IBAction)pressDigit:(NSButton *)sender;

@end
