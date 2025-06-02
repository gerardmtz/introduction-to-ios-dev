//
//  ViewController.h
//  AppConvertidorGrados
//
//  Created by geralduwu on 2025-02-07.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController {
    float fahrenheit;
    float celcius;
}

@property (weak) IBOutlet NSTextField *display;
- (IBAction)caf:(id)sender;
- (IBAction)fac:(id)sender;

@end

