//
//  ViewController.m
//  AppFadeEffect
//
//  Created by geralduwu on 2025-02-13.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)amIFaded:(id)sender {
    if (self.slider.alpha == 1.0) {
        self.label.text = @"The objects are visible";
    }
    else {
        self.label.text = @"The objects are invisible";
    }
}

- (IBAction)fadeOut:(id)sender {
    [UIView beginAnimations: nil context: NULL];
    [UIView setAnimationDuration: 2.0];
    [self.slider setAlpha: 0.0];
    [self.segControl setAlpha: 0.0];
    [UIView commitAnimations];
}

- (IBAction)fadeIn:(id)sender {
    [UIView beginAnimations: nil context: NULL];
    [UIView setAnimationDuration: 3.0];
    [self.slider setAlpha: 1.0];
    [self.segControl setAlpha: 1.0];
    [UIView commitAnimations];
}
@end
