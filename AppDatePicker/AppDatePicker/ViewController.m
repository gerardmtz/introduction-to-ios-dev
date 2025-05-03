//
//  ViewController.m
//  AppDatePicker
//
//  Created by geralduwu on 2025-04-29.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self selectDate:nil];
    
}


- (IBAction)selectDate:(id)sender {
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"E, d MMM yyy HH:mm:ss Z"];
//    self.datePicker.preferredDatePickerStyle = UIDatePickerStyleWheels;
    self.datePicker.preferredDatePickerStyle = UIDatePickerStyleInline;
    self.label.text = [dateFormat stringFromDate: self.datePicker.date];
    
}
@end
