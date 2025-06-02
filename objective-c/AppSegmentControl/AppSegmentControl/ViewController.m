//
//  ViewController.m
//  AppSegmentControl
//
//  Created by Adrian Nuñez on 21/02/25.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self segmentedControl:nil];
}


- (IBAction)segmentedControl:(id)sender {
    
    if(self.segmentOutlet.selectedSegmentIndex==0){
        self.label.text=@"Se selecciona segmento 1";
    }else if(self.segmentOutlet.selectedSegmentIndex==1){
        self.label.text=@"Se selecciona segmento 2";
    }else if(self.segmentOutlet.selectedSegmentIndex==2){
        self.label.text=@"Se selecciona segmento 3";
    }else if(self.segmentOutlet.selectedSegmentIndex==3){
        self.label.text=@"Se selecciona segmento 4";
    }
}
@end
