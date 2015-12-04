//
//  RegisterViewController.m
//  SocialChef
//
//  Created by Matthew Darke on 12/4/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import "RegisterViewController.h"
@interface RegisterViewController ()

@end

@implementation RegisterViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    
    // PFUser *user = [PFUser currentUser];
    
    //if (user.username != nil) {
    
    // [self performSegueWithIdentifier:@"login" sender:self];
    // }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)registerNewUser {
    
    PFUser *newUser = [PFUser user];
    newUser.username = _userName.text;
    newUser.email = _eMail.text;
    newUser.password = _passWord.text;
    
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            
            // Hooray! Let them use the app now.
            UIAlertView *eventAlertView = [[UIAlertView alloc]initWithTitle:@" Registration successful!" message:@"PLEEASE SIGN IN" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
            
            if(eventAlertView != nil)
                
            {
                [eventAlertView show];
                [eventAlertView dismissWithClickedButtonIndex:0 animated:YES];
                
                [self.navigationController popViewControllerAnimated:YES];
            }
            
            
        } else {
            
            // Hooray! Let them use the app now.
            UIAlertView *eventAlertView = [[UIAlertView alloc]initWithTitle:@" Registration Error" message:@"Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            if(eventAlertView != nil)
                
            {
                [eventAlertView show];
                
            }
            
        }
    }];
    
    
}












- (IBAction)registerButn:(id)sender{
    
    [self registerNewUser];
    
    
    
}



@end
