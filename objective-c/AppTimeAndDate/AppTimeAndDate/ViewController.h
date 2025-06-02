//
//  ViewController.h
//  AppTimeAndDate
//
//  Created by Adrian Nuñez on 21/02/25.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    NSTimer *timer;
    
}
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;


@end

