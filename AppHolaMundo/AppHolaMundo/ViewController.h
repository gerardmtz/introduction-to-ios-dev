//
//  ViewController.h
//  AppHolaMundo
//
//  Created by geralduwu on 2025-02-05.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController
@property (weak) IBOutlet NSTextField *texto;
- (IBAction)saluda:(id)sender;
- (IBAction)limpia:(id)sender;


@end

