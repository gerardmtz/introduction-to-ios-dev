//
//  ViewController.h
//  AppDigitalTimer
//
//  Created by geralduwu on 2025-03-01.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    NSTimer *timer;
}

@property (weak, nonatomic) IBOutlet UILabel *label;

@end
