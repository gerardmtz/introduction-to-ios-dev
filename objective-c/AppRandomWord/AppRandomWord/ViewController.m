//
//  ViewController.m
//  AppRandomWord
//
//  Created by geralduwu on 2025-03-12.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)randomWord:(id)sender {
    NSArray* words = @[@"uwu", @"nya", @"jsjs", @"꒰ᐢ. .ᐢ꒱₊˚⊹", @"(╥﹏╥)"];
    int num = arc4random()%words.count;
    self.label.text = words[num];
}

// TAREA
// HACER UN JUEGO QUE ADIVINE UNA PALABRA
// SU ARREGLO DEBE DE TENER CUANDO MENOS 10 PALABRAS
// POR CADA PALABRA QUE ADIVINE EL USUARIO
// 5 PUNTOS. MOSTRAR EL SCORE, UN MENSAJE SI ACIERTA
// O NO LA PALABRA
// SE DEBERÁ PROPORCIONAR UNA PISTA


@end
