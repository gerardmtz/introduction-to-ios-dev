//
//  ViewController.h
//  AppPlayASound
//
//  Created by geralduwu on 2025-04-09.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController : UIViewController {
    SystemSoundID soundID;
}

- (IBAction)playSound:(id)sender;

@end

