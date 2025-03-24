//
//  ViewController.m
//  AppFactBank
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


- (IBAction)randomFact:(id)sender {
    
    NSArray *facts = @[
        @"When you get killed by army ants, it’s not bites that kill you. It’s invasion of the lungs",
        
        @"50% of insects have disappeared since 1970. Insect population is down 27% in the last 30 years. Declining between 1 and 4% each year depending on the genus",
        
        @"Bananas could be gone within a year. We only grow one type of banana tree. If a specific infection occurs that kills that kind of tree, it woult spread like wildfire and we have no alternative.... Appearently this already happened now so long ago.",
        
        @"Scientists don't know exactly how Acetaminophen works to relieve pain and reduce fever. They have an idea but nothing for sure. But yet it's the most commonly used pain reliever in the world.",
        
        @"Anthrax spores can remain viable for decades in the soil or animal products such as dried or processed hides and wool.",
        
    ];
    
    int random = arc4random()%facts.count;
    self.tapTheBrain.text = facts[random];
    
}
@end
