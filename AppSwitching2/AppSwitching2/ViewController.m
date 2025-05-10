//
//  ViewController.m
//  AppSwitching2
//
//  Created by geralduwu on 2025-04-20.
//

#import "ViewController.h"
#import "MacWindowView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor darkGrayColor]; // Example background
    [self playBackroungMusic];
    [self renderMacWindowView];
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

- (void) renderMacWindowView {
    CGRect windowFrame = CGRectMake(50, 100, 300, 250); // Example frame
    MacWindowView *macWindow = [[MacWindowView alloc] initWithFrame:windowFrame title:@"My Image"];
    
    [self.view addSubview:macWindow]; // Add it to your view controller's view

    // --- Add your actual content (e.g., an UIImageView) to the contentAreaView ---
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"your_image_name"]]; // Replace with your image
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.translatesAutoresizingMaskIntoConstraints = NO;

    // Add the imageView to the window's content area
    [macWindow.contentAreaView addSubview:imageView];

    // Constrain the imageView within the contentAreaView (example: centered with padding)
    CGFloat padding = 10.0;
    [NSLayoutConstraint activateConstraints:@[
        [imageView.topAnchor constraintEqualToAnchor:macWindow.contentAreaView.topAnchor constant:padding],
        [imageView.leadingAnchor constraintEqualToAnchor:macWindow.contentAreaView.leadingAnchor constant:padding],
        [imageView.trailingAnchor constraintEqualToAnchor:macWindow.contentAreaView.trailingAnchor constant:-padding],
        [imageView.bottomAnchor constraintEqualToAnchor:macWindow.contentAreaView.bottomAnchor constant:-padding]
    ]];
    
}

@end
