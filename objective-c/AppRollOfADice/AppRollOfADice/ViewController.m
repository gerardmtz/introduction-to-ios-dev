//
//  ViewController.m
//  AppRollOfADice
//
//  Created by geralduwu on 2025-03-18.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (IBAction)rollDice:(id)sender {
    int min = 1;
    int max = 7;
    
    int randomNumber = arc4random_uniform(max - min) + min;
    self.image.image = [UIImage imageNamed:[NSString stringWithFormat:@"Dice%i.png", randomNumber]];
    
}


@end
