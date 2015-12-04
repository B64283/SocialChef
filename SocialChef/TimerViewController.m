//
//  TimerViewController.m
//  SocialChef
//
//  Created by Matthew Darke on 12/3/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController ()

@end

@implementation TimerViewController

bool start;
int minutes;
int seconds;

NSTimeInterval Time;
NSTimer *timer1;







- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)valueChanged:(UIStepper *)sender
{
    seconds = [sender value];
    minutes = seconds / 60;
    
    
    
    // "If" statement for resetting seconds to 0 in order for the label to look like a watch. REAL number of seconds stored by stepper modulus operated by 60.
    
    if (seconds > 59) {
        seconds = seconds % 60;
    }
    
    [countDwnLble setText: [NSString stringWithFormat:@"%2i : %2i", minutes, seconds]];
    
}



-(IBAction)startTmr:(id)sender
{
    if (start == false){
        
        start = true;
        
        
        
        if (! timer1)
            
            timer1 = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                      target:self
                                                    selector:@selector(updateTime)
                                                    userInfo:nil
                                                     repeats:YES];
        [sender setTitle:@"Stop" forState:UIControlStateNormal];
        //[countdownTimer invalidate];
        //[self updateTime];
        
    }   else
    {
        start = false;
        [sender setTitle:@"Start" forState:UIControlStateNormal];
        
    }
    
}



-(IBAction)resetTmr:(id)sender
{
    countDwnLble.text = @"00:00";
    [countdownTimer invalidate];
    [self updateTime];
}


-(void)updateTime
{
    
    if (start == false) {
        
        return;
        
    }
    seconds = seconds -1;
    countDwnLble.text = [NSString stringWithFormat: @"%2i : %2i", minutes, seconds];
    
    if (seconds <= 0) {
        if (minutes <= 0) {
            
            [countdownTimer invalidate];
            countDwnLble.text = @"Time is up!";
            
            NSURL *SoundUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"Alarm" ofType:@"wav"]];
            AudioServicesCreateSystemSoundID((__bridge CFURLRef)SoundUrl, & playSoundID);
            
            
            AudioServicesPlaySystemSound(playSoundID);
        }
        else {
            seconds = 60;
            minutes -= 1;
            
            
            
            
            
            
            
            
            
            
            //[self updateTime];
            //put uialert and alarm here
            //UIAlertView *eventAlertView = [[UIAlertView alloc]initWithTitle:@"Time Up!" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            //if(eventAlertView != nil)
            
            // {
            //[eventAlertView show];
            //[self updateTime];
            //[countdownTimer invalidate];
            // }
            
        }
    }
    
}












/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
