//
//  ViewController.h
//  AppTrafficLights
//
//  Created by geralduwu on 2025-03-04.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    NSTimer *timer;
    NSTimer *scoreTimer;
    
    int timerInt;
    int scoreInt;
}


@property (weak, nonatomic) IBOutlet UIImageView *trafficLight;


@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;


@property (weak, nonatomic) IBOutlet UIButton *startButton;

- (IBAction)startGame:(id)sender;




@end

