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

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;


@property (weak, nonatomic) IBOutlet UISegmentedControl *clockColorSeg;

@property (weak, nonatomic) IBOutlet UISegmentedControl *backgroundSeg;


@property (weak, nonatomic) IBOutlet UIButton *settingsButton;


@property (weak, nonatomic) IBOutlet UIView *settingsView;


- (IBAction)clockColor:(id)sender;

- (IBAction)backgroundSegCtrl:(id)sender;

- (IBAction)settings:(id)sender;




@end
