//
//  ViewController.h
//  AppCalculadora03
//
//  Created by Sebastian on 25/03/25.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    int currentOperation;
    float result;
    float currentNumber;
}

@property (weak, nonatomic) IBOutlet UILabel *display;
- (IBAction)digitPressed:(id)sender;

- (IBAction)cancel:(id)sender;
- (IBAction)operationPressed:(id)sender;

@end

