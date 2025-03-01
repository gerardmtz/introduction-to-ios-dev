//
//  ViewController.m
//  AppTimer
//
//  Created by geralduwu on 2025-02-18.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    counter = 15;
    self.display.text = [NSString stringWithFormat:@"%i", counter];
}


- (IBAction)restartTimer:(id)sender {
    [timer invalidate];
    counter = 15;
    self.display.text = [NSString stringWithFormat:@"%i", counter];
}

- (IBAction)pauseTimer:(id)sender {
    [timer invalidate];
}

- (IBAction)startTimer:(id)sender {
    self->timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                  target:self
                                                selector:@selector(updateTimer)
                                                userInfo:nil
                                                 repeats:YES];

}

- (void)updateTimer {
    counter -= 1;
    self.display.text = [NSString stringWithFormat:@"%i", counter];
    
    if (counter == 0)
        [timer invalidate];
}


@end
