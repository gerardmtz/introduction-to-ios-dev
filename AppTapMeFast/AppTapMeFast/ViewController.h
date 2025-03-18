//
//  ViewController.h
//  appTapMeFast
//
//  Created by Sebastian on 10/03/25.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    NSTimer *timer;
    
    int timeInt;
    int scoreInt;
    int gameMode;
}

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
- (IBAction)startGame:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButton;


@end

