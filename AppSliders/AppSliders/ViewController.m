//
//  ViewController.m
//  AppSliders
//
//  Created by geralduwu on 2025-02-20.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)linkURL:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://image-cdn.neatoshop.com/styleimg/147741/none/black/default/552812-20;1711508736y.jpg"] options: @{} completionHandler:nil];
}

- (IBAction)alpha:(id)sender {
    self.label.alpha = self.alphaSlider.value;
}

- (IBAction)fontSize:(id)sender {
    [self.label setFont:[UIFont fontWithName:@"Futura" size: self.fontSizeSlider.value]];
}
@end
