//
//  ViewController.h
//  AppTapMeFast
//
//  Created by geralduwu on 2025-03-10.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    NSTimer *timer;
    
    int timeInt;
    int scoreInt;
    int gameMode;
}


@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UILabel *scoreLable;

- (IBAction)startGame:(id)sender;


@end

