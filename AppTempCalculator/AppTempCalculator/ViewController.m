//
//  ViewController.m
//  AppTempCalculator
//
//  Created by geralduwu on 2025-03-20.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)switchConversion:(id)sender {
    if (self.segControl.selectedSegmentIndex == 0) {
        self.enterLabel.text = @"Enter Fahrenheit";
        self.textField.text = @" ";
        self.outputLabel.text = @"0 Celcius";
    }
    else {
        self.enterLabel.text = @"Enter Celcius";
        self.textField.text = @" ";
        self.outputLabel.text = @"0 Fahrenheit";
    }
}

- (IBAction)convert:(id)sender {
    if (self.segControl.selected == 0) {
        double f = [self.textField.text doubleValue];
        double c = (f-32)/1.8;
        self.outputLabel.text = [NSString stringWithFormat:@"%4.2f Celcius", c];
        
        if (c >= 120) {
            self.imageView.image = [UIImage imageNamed:@"Temp9"];
        }
        else if (c >= 100 && c < 120) {
            self.imageView.image = [UIImage imageNamed:@"Temp8"];
        }
        
        // ...resto de temperaturas restando de 20
        
        else if (c >= -10 && c < 0) {
            self.imageView.image = [UIImage imageNamed:@"Temp4"];
        }
        
    }
    else {
        
        double c = [self.textField.text doubleValue];
        double f = c * 1.8 + 32;
        self.outputLabel.text = [NSString stringWithFormat:@"%4.2f Fahrenheit", c];
        
        if (f >= 180) {
            self.imageView.image = [UIImage imageNamed:@"Temp9"];
        }
        else if (f >= 160 && c < 180) {
            self.imageView.image = [UIImage imageNamed:@"Temp8"];
        }
        
        // ...resto de temperaturas restando de 20
        
        else if (f >= 40 && c < 80) {
            self.imageView.image = [UIImage imageNamed:@"Temp4"];
        }
    }
}

@end
