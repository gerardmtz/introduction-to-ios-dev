//
//  AppDelegate.h
//  AppCalculadora1
//
//  Created by geralduwu on 2025-02-10.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (weak) IBOutlet NSTextField *txtOp;
@property (weak) IBOutlet NSTextField *textIgual;
@property (weak) IBOutlet NSTextField *textResul;

@property (weak) IBOutlet NSTextField *txtNum1;
@property (weak) IBOutlet NSTextField *txtNum2;


- (IBAction)btnSuma:(id)sender;
- (IBAction)btnResta:(id)sender;
- (IBAction)btnMultiplica:(id)sender;
- (IBAction)btnDivide:(id)sender;



@end

