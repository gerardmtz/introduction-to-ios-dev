//
//  ViewController.m
//  AppPlayASound
//
//  Created by geralduwu on 2025-04-09.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *soundURL = [NSURL fileURLWithPath: [
        [NSBundle mainBundle] pathForResource:@"Sound" ofType:@"wav"]
    ];
    
    AudioServicesCreateSystemSoundID( (__bridge CFURLRef) soundURL, &soundID);
}


- (IBAction)playSound:(id)sender {
    AudioServicesPlaySystemSound(soundID);
}

@end
