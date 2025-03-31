//
//  ViewController.m
//  AppShakeGesture
//
//  Created by geralduwu on 2025-03-27.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (event.subtype == UIEventSubtypeMotionShake) {
        self.label.text = @"The device was shaken";
    }
}

@end
