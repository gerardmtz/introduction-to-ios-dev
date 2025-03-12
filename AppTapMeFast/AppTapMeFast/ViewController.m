//
//  ViewController.m
//  AppTapMeFast
//
//  Created by geralduwu on 2025-03-10.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    timeInt = 10;
    scoreInt = 0;
    gameMode = 0;
    
    self.timeLabel.text = [NSString stringWithFormat:@"%i", timeInt];
    self.scoreLable.text = [NSString stringWithFormat:@"%i", scoreInt];
    
}


- (IBAction)startGame:(id)sender {
    
    if (timeInt == 10) {
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(startCounter) userInfo:nil repeats:YES];
    }
    
}

-(void) startCounter {
    timeInt -= 1;
    self.timeLabel.text = [NSString stringWithFormat:@"%i", timeInt];
}


@end
