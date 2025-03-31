//
//  ViewController.m
//  AppCalculadora03
//
//  Created by Sebastian on 25/03/25.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)operationPressed:(id)sender {
    if (currentOperation == 0) {
        result = currentNumber;
    }
    else {
        switch (currentOperation) {
            case 1: result = result + currentNumber; break;
            case 2: result = result - currentNumber; break;
            case 3: result = result * currentNumber; break;
            case 4: result = result / currentNumber; break;
            default: break;
        }
    }
    
    currentNumber = 0;
    self.display.text = [NSString stringWithFormat:@"%6.0f", result];
    
    if ([sender tag] == 0) {
        result = 0;
    }
    currentOperation = (int) [sender tag];
    
}

- (IBAction)cancel:(id)sender {
    self.display.text = @"0";
    currentNumber = 0;
}

- (IBAction)digitPressed:(id)sender {
    currentNumber = currentNumber * 10 + (float)[sender tag];
    self.display.text = [NSString stringWithFormat:@"%6.0f", currentNumber];
}

@end
