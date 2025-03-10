//
//  ViewController.m
//  AppTrafficLights
//
//  Created by geralduwu on 2025-03-04.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    scoreInt = 0;
    self.scoreLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
    
//    for( NSString *strFamilyName in [UIFont familyNames] ) {
//      for( NSString *strFontName in [UIFont fontNamesForFamilyName:strFamilyName] ) {
//        NSLog(@"%@", strFontName);
//      }
//    }
}

-(void) startTimer {
    timerInt -= 1;
    
    if (timerInt == 2)
    {
        self.trafficLight.image = [UIImage imageNamed:@"trafficLight3"];
    }
    else if (timerInt == 1)
    {
        self.trafficLight.image = [UIImage imageNamed:@"trafficLight2"];
        
    }
    else if (timerInt == 0)
    {
        self.trafficLight.image = [UIImage imageNamed:@"trafficLight1"];
        [timer invalidate];
        
        // starts counter timer
        scoreTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(scoreCounter) userInfo:nil repeats:YES];
        
        [self.startButton setTitle: @"Stop" forState:UIControlStateNormal];
//        self.startButton.titleLabel.font = [UIFont fontWithName:@"Futura Bold" size:40];
        
        NSDictionary *attributes = @{ NSFontAttributeName: [UIFont fontWithName:@"Futura Bold" size:40] };
        NSAttributedString *attributedTitle = [[NSAttributedString alloc] initWithString:@"Stop" attributes:attributes];
        [self.startButton setAttributedTitle:attributedTitle forState:UIControlStateNormal];


    }
        
}	

-(void) scoreCounter {
    scoreInt += 1;
    self.scoreLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
}

- (IBAction)startGame:(id)sender {
    if (scoreInt == 0) {
        timerInt = 3;
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(startTimer) userInfo:nil repeats:YES];
    }
    else {
        [scoreTimer invalidate];
    }
}

@end
