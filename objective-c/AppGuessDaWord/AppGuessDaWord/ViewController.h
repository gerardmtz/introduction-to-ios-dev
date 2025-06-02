//
//  ViewController.h
//  AppGuessDaWord
//
//  Created by geralduwu on 2025-03-20.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// IBOutlets ligadas desde el Storyboard
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextField *userInput;

// Diccionario de imágenes (key: palabra, value: nombre de la imagen)
@property (nonatomic, strong) NSDictionary<NSString*, NSString*> *imagesDictionary;

// Acción del botón
- (IBAction)guessButton:(id)sender;

@end
