//
//  ViewController.h
//  AppFadeEffect
//
//  Created by geralduwu on 2025-02-13.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segControl;
@property (weak, nonatomic) IBOutlet UILabel *label;


- (IBAction)fadeIn:(id)sender;
- (IBAction)fadeOut:(id)sender;
- (IBAction)amIFaded:(id)sender;

@end

