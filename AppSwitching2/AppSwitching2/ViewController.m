//
//  ViewController.m
//  AppSwitching2
//
//  Created by geralduwu on 2025-04-20.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self playBackroungMusic];
}

- (void) playBackroungMusic {
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"vacations-young-instrumental" ofType:@"mp3"];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];

    NSError *error;
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:&error];

    if (error) {
        NSLog(@"Error al cargar el archivo de audio: %@", [error localizedDescription]);
    } else {
        self.audioPlayer.numberOfLoops = -1; // play on loop, change to 0 to play only one time
        [self.audioPlayer play];
    }
}

@end
