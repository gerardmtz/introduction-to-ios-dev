//
//  ViewController.h
//  AppTimer
//
//  Created by geralduwu on 2025-02-18.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    NSTimer* timer;
    int counter;
    
}

- (IBAction)startTimer:(id)sender;
- (IBAction)pauseTimer:(id)sender;
- (IBAction)restartTimer:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *display;


@end

