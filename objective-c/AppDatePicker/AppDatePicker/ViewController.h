//
//  ViewController.h
//  AppDatePicker
//
//  Created by geralduwu on 2025-04-29.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
- (IBAction)selectDate:(id)sender;

@end

