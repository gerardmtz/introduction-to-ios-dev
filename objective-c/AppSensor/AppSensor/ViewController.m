//
//  ViewController.m
//  AppSensor
//
//  Created by geralduwu on 2025-05-01.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // enables proximity monitoring
    [UIDevice currentDevice].proximityMonitoringEnabled = YES;
    
    // checks the initial state (good practice)
    [self updateSensorStatus];
    
    // register notifications when the proximity stage changes
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(proximityStateDigChange:)
                                            name:UIDeviceProximityStateDidChangeNotification
                                            object:nil];
    NSLog(@"Proximity monitoring enabled");
    
}

-(void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // important: disable monitoring and remove observer when the view
    // disappears to preven crashes and battery drain
    [UIDevice currentDevice].proximityMonitoringEnabled = NO;
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                          name: UIDeviceProximityStateDidChangeNotification
                                          object:nil];
    
    NSLog(@"Proximity monitoring disabled");
}

// method called when the proximity sensor state changes
-(void) proximityStateDigChange:(NSNotification *) notification {
    NSLog(@"Proximity state changed!");
    [self updateSensorStatus];
}

// helper method to update the UI based on the sensor state
-(void) updateSensorStatus {
    BOOL isClose = [UIDevice currentDevice].proximityState;
    
    if (isClose) {
        self.statusLabel.textColor = [UIColor whiteColor];
        self.statusLabel.text = @"Sensor Covered!";
        self.view.backgroundColor = [UIColor blackColor];
        NSLog(@"Sensor is CLOSE");
    } else {
        self.statusLabel.textColor = [UIColor blackColor];
        self.statusLabel.text = @"Sensor is Uncovered!";
        self.view.backgroundColor = [UIColor whiteColor];
        NSLog(@"Sensor is NOT close");
    }
}

// clean up obsever in dealloc as well (good practice)
-(void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
