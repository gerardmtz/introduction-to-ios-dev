//
//  ViewController.m
//  AppRelojDigital
//
//  Created by geralduwu on 2025-02-27.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    
}

-(void) updateTimer {
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
    [timeFormat setDateFormat: @"HH:mm:ss"];
    self.label.text=[timeFormat stringFromDate:[NSDate date]];
}

@end
