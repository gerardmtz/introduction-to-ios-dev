//
//  ViewController.h
//  AppEnabling
//
//  Created by Adrian Nuñez on 18/02/25.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
    
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segControl;
- (IBAction)btnEnable:(id)sender;
- (IBAction)btnDisable:(id)sender;



@end

