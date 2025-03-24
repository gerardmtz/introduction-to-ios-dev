//
//  ViewController.m
//  AppGuessDaWord
//
//  Created by geralduwu on 2025-03-20.
//

#import "ViewController.h"

@interface ViewController ()

// Propiedades para manejar la lógica del juego
@property (nonatomic, strong) NSMutableArray<NSString *> *keysArray;
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, assign) NSInteger correctCount;
@property (nonatomic, assign) NSInteger totalCount;
@property (nonatomic, assign) NSInteger attemptsPerWord;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Llama a setupGame para inicializar el juego
    [self setupGame];
}

// Getter para el diccionario de imágenes
- (NSDictionary<NSString*, NSString*> *)imagesDictionary {
    if (!_imagesDictionary) {
        _imagesDictionary = @{
            @"gpu":         @"gpuImage",
            @"ada":         @"adaImage",
            @"compiler":    @"compilerImage",
            @"emacs":       @"emacsImage",
            @"ibm":         @"ibmImage",
            @"ios":         @"iosImage",
            @"openbsd":     @"openbsdImage",
            @"server":      @"serverImage",
            @"linux":       @"tuxImage",
            @"typescript":  @"typescriptImage"
        };
    }
    return _imagesDictionary;
}

// Acción del botón "Adivinar"
- (IBAction)guessButton:(id)sender {
    
    // Verifica si ya no hay más palabras
    if (self.currentIndex >= self.keysArray.count) {
        return;
    }
    
    // Respuesta del usuario (pasar a minúsculas)
    NSString *userAnswer = self.userInput.text.lowercaseString;
    // Palabra actual que se está adivinando
    NSString *currentWord = self.keysArray[self.currentIndex].lowercaseString;
    
    // Quitar espacios en blanco
    userAnswer = [userAnswer stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if ([userAnswer isEqualToString:currentWord]) {
        // Acierta
        self.correctCount++;
        
        // Mostrar alerta de acierto
        [self showAlertWithTitle:@"¡Correcto!"
                         message:[NSString stringWithFormat:@"La palabra era: %@", currentWord]
                      completion:^{
            // Pasar a la siguiente imagen
            self.currentIndex++;
            [self loadCurrentImage];
        }];
        
    } else {
        // Falla
        self.attemptsPerWord--;
        
        if (self.attemptsPerWord > 0) {
            // Todavía le quedan intentos
            [self showAlertWithTitle:@"¡Incorrecto!"
                             message:[NSString stringWithFormat:@"Te quedan %ld intentos", (long)self.attemptsPerWord]
                          completion:nil];
        } else {
            // Se acabaron los intentos para esta palabra
            [self showAlertWithTitle:@"¡Fallaste!"
                             message:[NSString stringWithFormat:@"La palabra era: %@", currentWord]
                          completion:^{
                // Pasar a la siguiente imagen
                self.currentIndex++;
                [self loadCurrentImage];
            }];
        }
    }
    
    // Checar si se han completado todas las palabras
    if (self.currentIndex >= self.keysArray.count) {
        [self checkWinCondition];
    }
}

// Muestra alertas con un botón OK
- (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
                completion:(void (^)(void))completion {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {
        if (completion) {
            completion();
        }
    }];
    
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}

// Verifica la condición de victoria (todas adivinadas o 80% de acierto)
- (void)checkWinCondition {
    CGFloat successRate = (CGFloat)self.correctCount / (CGFloat)self.totalCount;
    BOOL hasGuessedAll = (self.currentIndex >= self.totalCount);
    BOOL hasEnoughCorrect = (successRate >= 0.8);
    
    if (hasGuessedAll || hasEnoughCorrect) {
        // Ganó
        NSString *msg = [NSString stringWithFormat:
                         @"¡Felicidades! Adivinaste %ld de %ld (%.0f%%)",
                         (long)self.correctCount,
                         (long)self.totalCount,
                         successRate * 100];
        
        [self showAlertWithTitle:@"¡Ganaste!" message:msg completion:^{
            // Aquí podrías reiniciar el juego
            [self setupGame];
        }];
        
    } else {
        // Terminó el juego sin lograr el 80%
        NSString *msg = [NSString stringWithFormat:
                         @"Adivinaste %ld de %ld (%.0f%%). No alcanzaste 80%%",
                         (long)self.correctCount,
                         (long)self.totalCount,
                         successRate * 100];
        
        [self showAlertWithTitle:@"¡Juego Terminado!" message:msg completion:^{
            // Reiniciar o cerrar
            [self setupGame];
        }];
    }
}

// Carga la imagen actual según la palabra en keysArray[currentIndex]
- (void)loadCurrentImage {
    if (self.currentIndex < self.keysArray.count) {
        NSString *currentWord = self.keysArray[self.currentIndex];
        NSString *imageName = self.imagesDictionary[currentWord];
        // Muestra la imagen en tu IBOutlet imageView
        self.imageView.image = [UIImage imageNamed:imageName];
        
        // Limpiar textField
        self.userInput.text = @"";
        
        // Reiniciar intentos para la palabra actual
        self.attemptsPerWord = 3;
    } else {
        // Si no hay más imágenes, checar si ganó
        [self checkWinCondition];
    }
}

// Baraja el contenido de un NSMutableArray
- (void)shuffleArray:(NSMutableArray *)array {
    for (NSUInteger i = array.count - 1; i > 0; i--) {
        [array exchangeObjectAtIndex:i
                  withObjectAtIndex:arc4random_uniform((u_int32_t)i + 1)];
    }
}

// Inicializa/ Reinicia el juego
- (void)setupGame {
    // 1) Obtener todas las keys del diccionario
    self.keysArray = [NSMutableArray arrayWithArray:self.imagesDictionary.allKeys];
    
    // 2) Barajar keys para que aparezcan en orden aleatorio
    [self shuffleArray:self.keysArray];
    
    // 3) Inicializar contadores
    self.currentIndex = 0;
    self.correctCount = 0;
    self.totalCount = self.keysArray.count;
    self.attemptsPerWord = 3; // p.ej. 3 intentos por palabra
    
    // 4) Cargar la primera imagen/palabra
    [self loadCurrentImage];
}

@end
