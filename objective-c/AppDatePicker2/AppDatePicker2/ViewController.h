//
//  ViewController.h
//  AppDatePicker2
//
//  Created by geralduwu on 2025-04-29.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nombre;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIButton *calcularEdad;
@property (weak, nonatomic) IBOutlet UILabel *edad;

- (IBAction)calcularEdad:(id)sender;

@end

