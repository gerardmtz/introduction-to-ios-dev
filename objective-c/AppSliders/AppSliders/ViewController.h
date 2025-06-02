//
//  ViewController.h
//  AppSliders
//
//  Created by geralduwu on 2025-02-20.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UISlider *fontSizeSlider;

@property (weak, nonatomic) IBOutlet UISlider *alphaSlider;


- (IBAction)fontSize:(id)sender;

- (IBAction)alpha:(id)sender;

- (IBAction)linkURL:(id)sender;


@end

