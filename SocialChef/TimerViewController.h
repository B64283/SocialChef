//
//  TimerViewController.h
//  SocialChef
//
//  Created by Matthew Darke on 12/3/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
@interface TimerViewController : UIViewController
{
    SystemSoundID playSoundID;
    
    
    
   IBOutlet UILabel *countDwnLble;
    
    NSTimer *countdownTimer;
    
    
}

- (IBAction)startTmr:(id)sender;
- (IBAction)resetTmr:(id)sender;







@end
