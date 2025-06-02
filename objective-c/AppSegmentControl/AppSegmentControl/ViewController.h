//
//  ViewController.h
//  AppSegmentControl
//
//  Created by Adrian Nuñez on 21/02/25.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentOutlet;
- (IBAction)segmentedControl:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *label;


@end

