//
//  ViewController.h
//  AppRandomNumber
//
//  Created by geralduwu on 2025-03-12.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)randomNumber:(id)sender;
- (IBAction)randomNumber50to100:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;




@end

