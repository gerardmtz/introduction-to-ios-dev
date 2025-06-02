//
//  ViewController.m
//  AppShakeMe
//
//  Created by Adrian Nuñez on 07/04/25.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    timeInt = 10;
    scoreInt = 0;
    gameMode = 0;
    imageInt = 1;
    self.scoreLabel.text = [NSString stringWithFormat:@"%i",scoreInt];
    self.timeLabel.text = [NSString stringWithFormat:@"%i",timeInt];
    
    // Do any additional setup after loading the view.
}


- (IBAction)startGame:(id)sender {
    if(timeInt==10){
//        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateCounter) userInfo:nil repeat:YES];
        
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateCounter) userInfo:nil repeats:YES];
        
        gameMode = 1;
        self.startButton.enabled = NO;
        self.startButton.alpha = 0.25;
    }
    
    if (timeInt == 0) {
        timeInt = 10;
        scoreInt = 0;
        imageInt = 1;
        self.imageView.image = [UIImage imageNamed:@"Face1"];
        self.scoreLabel.text = [NSString stringWithFormat:@"%i",scoreInt];
        self.timeLabel.text = [NSString stringWithFormat:@"%i",timeInt];
        [ self.startButton setTitle:@"Start Game" forState:UIControlStateNormal];
        
    }

}

-(void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (event.subtype == UIEventSubtypeMotionShake) {
        if (gameMode == 1) {
            scoreInt += 1;
            self.scoreLabel.text = [ NSString stringWithFormat:@"%i", scoreInt ];
            imageInt += 1;
            
            if (imageInt > 12) {
                imageInt = 1;
            }
            
            self.imageView.image = [UIImage imageNamed: [NSString stringWithFormat:@"Face%i", imageInt]];
        }
        
    }
}

-(void) updateCounter{
    timeInt-=1;
    self.timeLabel.text = [NSString stringWithFormat:@"%i",timeInt];
    
    if(timeInt){
        [timer invalidate];
        gameMode = 1;
        self.startButton.enabled = YES;
        self.startButton.alpha = 1.0;
        [self.startButton setTitle:@"Restart"forState:UIControlStateNormal];
    }
    
}
@end
