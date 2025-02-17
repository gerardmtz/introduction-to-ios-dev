//
//  ViewController.h
//  AppHidingAndRevealingObjects
//
//  Created by geralduwu on 2025-02-12.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *segControl;

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet UISlider *slider;

@property (weak, nonatomic) IBOutlet UISwitch *switch1;

@property (weak, nonatomic) IBOutlet UILabel *label;


- (IBAction)showObjects:(id)sender;
- (IBAction)hideObjects:(id)sender;
- (IBAction)amIHidden:(id)sender;


@end

