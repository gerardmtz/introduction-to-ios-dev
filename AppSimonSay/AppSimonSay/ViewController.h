//
//  ViewController.h
//  AppSimonSay
//
//  Created by geralduwu on 2025-03-28.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    int timeInt;
    int scoreInt;
    int gameMode;
}

@property (nonatomic, strong) UISwipeGestureRecognizer *leftSwipe;
@property (nonatomic, strong) UISwipeGestureRecognizer *rightSwipe;
@property (nonatomic, strong) UISwipeGestureRecognizer *upSwipe;
@property (nonatomic, strong) UISwipeGestureRecognizer *downSwipe;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (weak, nonatomic) IBOutlet UILabel *simonLabel;

@property (weak, nonatomic) IBOutlet UIButton *startButton;

- (IBAction)startGame:(id)sender;


@end

