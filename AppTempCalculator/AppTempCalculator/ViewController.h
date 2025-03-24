//
//  ViewController.h
//  AppTempCalculator
//
//  Created by geralduwu on 2025-03-20.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *enterLabel;

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *outputLabel;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segControl;

- (IBAction)convert:(id)sender;

- (IBAction)switchConversion:(id)sender;

@end

