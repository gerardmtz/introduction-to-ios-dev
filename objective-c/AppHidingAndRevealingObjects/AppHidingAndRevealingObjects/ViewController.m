//
//  ViewController.m
//  AppHidingAndRevealingObjects
//
//  Created by geralduwu on 2025-02-12.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)amIHidden:(id)sender {
    if (self.slider.hidden == YES)
        self.label.text = @"The objects are hidden";
    else
        self.label.text = @"The objects are displayed";
}

- (IBAction)hideObjects:(id)sender {
    self.segControl.hidden  = YES;
    self.textField.hidden   = YES;
    self.slider.hidden      = YES;
    self.switch1.hidden     = YES;
}

- (IBAction)showObjects:(id)sender {
    self.segControl.hidden  = NO;
    self.textField.hidden   = NO;
    self.slider.hidden      = NO;
    self.switch1.hidden     = NO;
}
@end
