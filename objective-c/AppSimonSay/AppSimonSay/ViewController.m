//
//  ViewController.m
//  AppSimonSay
//
//  Created by geralduwu on 2025-03-28.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    timeInt = 20;
    scoreInt = 0;
    gameMode = 0;
    self.simonLabel.layer.cornerRadius = 20;
    self.simonLabel.clipsToBounds = YES;
    self.startButton.layer.cornerRadius = 40;
    self.timeLabel.text = [NSString stringWithFormat:@"Time: %i", timeInt];
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i", scoreInt];
    
    self.leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    self.leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:self.leftSwipe];
    
    
    self.rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    self.rightSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:self.rightSwipe];
    
    self.upSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    self.upSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:self.upSwipe];
    
    self.downSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    self.downSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:self.downSwipe];
    
}

-(void) handleSwipes: (UISwipeGestureRecognizer *) sender{
    if (gameMode == 1) {
        // swipe left
        
        if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
//            [simonTimer invalidate];
            
            if ([self.simonLabel.text isEqual:@"Simon says swipe left"]) {
                scoreInt += 1;
                self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i"];
                // [self simonSays]
            }
            else {
                scoreInt -= 1;
                elf.scoreLabel.text = [NSString stringWithFormat:@"Score: %i"];
                // [self simonSays]
            }
    }
}

- (IBAction)startGame:(id)sender {
    
    
    
}
@end
