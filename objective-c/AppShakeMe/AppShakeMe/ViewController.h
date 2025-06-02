//
//  ViewController.h
//  AppShakeMe
//
//  Created by Adrian Nuñez on 07/04/25.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    NSTimer *timer;
    int scoreInt;
    int timeInt;
    int gameMode;
    int imageInt;
}
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
- (IBAction)startGame:(id)sender;


@end

