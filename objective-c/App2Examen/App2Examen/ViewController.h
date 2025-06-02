//
//  ViewController.h
//  App2Examen
//
//  Created by geralduwu on 2025-02-28.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController {
    int guessNumber;
    int userNumber;
}

@property (weak) IBOutlet NSTextFieldCell *infoLabel;

@property (weak) IBOutlet NSTextField *input;

- (IBAction)guessButton:(id)sender;

@end

