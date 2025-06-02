//
//  ViewController.m
//  AppSwipeGestures
//
//  Created by geralduwu on 2025-03-27.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // LEFT
    self.leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    self.leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:self.leftSwipe];
    
    // RIGHT
    self.rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    self.rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:self.rightSwipe];
    
    
    // UP
    self.upSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    self.upSwipe.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:self.upSwipe];
    
    // DOWN
    self.downSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    self.downSwipe.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:self.downSwipe];
    
}


-(void) handleSwipe:(UISwipeGestureRecognizer *)sender {
    
    if(sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        self.label.text = @"Left";
    }
    
    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        self.label.text = @"Right";
    }
    
    if (sender.direction == UISwipeGestureRecognizerDirectionUp) {
        self.label.text = @"Up";
    }
    
    if (sender.direction == UISwipeGestureRecognizerDirectionDown) {
        self.label.text = @"Down";
    }
}

@end

