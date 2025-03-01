//
//  ViewController.m
//  AppAlert
//
//  Created by geralduwu on 2025-02-20.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)actionSheet:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Titulo" message:@"Mensaje" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"Boton 1" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.label.text = @"Boton 1 fue presionado";
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"Boton 2" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.label.text = @"Boton 2 fue presionado";
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissModalViewControllerAnimated:YES];
    }];
    
    [alert addAction:action1];
    [alert addAction:action2];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
    
}
@end
