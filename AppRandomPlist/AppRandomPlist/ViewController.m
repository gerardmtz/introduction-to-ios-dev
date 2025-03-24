//
//  ViewController.m
//  AppRandomPlist
//
//  Created by geralduwu on 2025-03-19.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (IBAction)randomImage:(id)sender {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"RandomImages" ofType:@"plist"];
    NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSMutableArray *array = dictionary[@"Images"];
    
    int randomNum = arc4random()%array.count;
    
    self.imageView.image = [UIImage imageNamed:array[randomNum]];

}
@end
