//
//  ViewController.m
//  AppTimerDelayingActions
//
//  Created by geralduwu on 2025-02-19.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)delay:(id)sender {
    [self performSelector:@selector(delay1) withObject:nil afterDelay:5.0];
    [self performSelector:@selector(delay2) withObject:nil afterDelay:9.0];
}

- (void) delay1 {
    self.label.text = @"El retraso esta empezando...";
}

- (void) delay2 {
    self.label.text = @"Byeee uwu...";
}

@end
