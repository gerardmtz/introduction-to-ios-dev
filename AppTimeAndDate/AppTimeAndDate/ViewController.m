//
//  ViewController.m
//  AppTimeAndDate
//
//  Created by Adrian Nuñez on 21/02/25.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateTimer];
    // Do any additional setup after loading the view.
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    
}


-(void)updateTimer{
    NSDateFormatter *  timeFormat = [[NSDateFormatter alloc]init];
    
    [timeFormat setDateFormat:@"HH:mm:ss"];
    self.timeLabel.text=[timeFormat stringFromDate:[NSDate date]];
    NSDateFormatter *  dateFormat = [[NSDateFormatter alloc]init];
    
    [dateFormat setDateFormat:@"EEE, MMM d, yyyy"];
    self.dateLabel.text=[dateFormat stringFromDate:[NSDate date]];
}

@end
