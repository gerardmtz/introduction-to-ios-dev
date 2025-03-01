//
//  ViewController.m
//  App2Examen
//
//  Created by geralduwu on 2025-02-28.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    srand((unsigned int)time(NULL));
    guessNumber = rand() % 100 + 1;
    
    printf("Generated: %d\n", guessNumber);

}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


- (IBAction)guessButton:(id)sender {
    NSString *inputString = [_input stringValue];
    
    userNumber = [inputString integerValue];
    
//    guessNumber = rand() % 100 + 1;
    
    if (userNumber == guessNumber)
    {
        [_infoLabel setStringValue:@"Haz acertado 🎉"];
        
    }
    else if (userNumber < guessNumber)
    {
        [_infoLabel setStringValue:@"El número es mayor ⬆️"];
        
    }
    else if (userNumber > guessNumber)
    {
        [_infoLabel setStringValue:@"El número es menor ⬇️"];
    }
    
    printf("User Number: %d\n", userNumber);
}
@end
