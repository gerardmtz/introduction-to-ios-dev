//
//  ViewController.h
//  AppTexto
//
//  Created by geralduwu on 2025-02-24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UITextField *message;

- (IBAction)changeColor:(id)sender;

- (IBAction)changeFont:(id)sender;

- (IBAction)addShadow:(id)sender;
- (IBAction)changeSize:(id)sender;


@end

