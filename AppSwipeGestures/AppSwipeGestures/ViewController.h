//
//  ViewController.h
//  AppSwipeGestures
//
//  Created by geralduwu on 2025-03-27.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *label;

// swipe view variables
@property(nonatomic, strong) UISwipeGestureRecognizer *leftSwipe;
@property(nonatomic, strong) UISwipeGestureRecognizer *rightSwipe;
@property(nonatomic, strong) UISwipeGestureRecognizer *upSwipe;
@property(nonatomic, strong) UISwipeGestureRecognizer *downSwipe;

@end
