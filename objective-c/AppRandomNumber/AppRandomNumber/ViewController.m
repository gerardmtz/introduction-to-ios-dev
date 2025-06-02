//
//  ViewController.m
//  AppRandomNumber
//
//  Created by geralduwu on 2025-03-12.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)randomNumber50to100:(id)sender {
    int min = 50;
    int max = 100;
    int num = arc4random_uniform(max-min) + min;
    self.label2.text =[NSString stringWithFormat:@"%i", num];
}

- (IBAction)randomNumber:(id)sender {
    int num = arc4random()%101;
    self.label1.text = [NSString stringWithFormat:@"%i", num];
}

@end
