//
//  ViewController.h
//  AppSwitch
//
//  Created by geralduwu on 2025-02-19.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UISwitch *switchOutlet;
- (IBAction)theSwitch:(id)sender;





@end

