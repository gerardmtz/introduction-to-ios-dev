//
//  ViewController.m
//  AppEnabling
//
//  Created by Adrian Nuñez on 18/02/25.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)btnDisable:(id)sender {
    self.slider.enabled = NO;
    self.segControl.enabled = NO;
}

- (IBAction)btnEnable:(id)sender {
    self.slider.enabled = YES;
    self.segControl.enabled = YES;
    
}
@end
