//
//  SigninViewController.m
//  SocialChef
//
//  Created by Matthew Darke on 12/4/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import "SigninViewController.h"
#import "RegisterViewController.h"

@interface SigninViewController ()

@end

@implementation SigninViewController

//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    PFUser *currentUser = [PFUser currentUser];
//    if (currentUser) {
//        // do stuff with the user
//        [self performSegueWithIdentifier:@"SignWoFB" sender:self];
//    }
//    
//}
//
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//
//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    [_userNameSin resignFirstResponder];
//    [_userPassword resignFirstResponder];
//}
//
//- (IBAction)signInAct:(id)sender{
//    
//    
//    
//    [PFUser logInWithUsernameInBackground:_userNameSin.text password:_userPassword.text block:^(PFUser *userS, NSError *error) {
//                                        
//    if (userS) {
//                                            
//// Do stuff after successful login.
//    UIAlertView *eventAlertView = [[UIAlertView alloc]initWithTitle:@"Sign in successful!" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//                                            
//    if(eventAlertView != nil)
//                                                
//        {
//                                            [eventAlertView show];
//                                            
//                                        }
//                                        [self performSegueWithIdentifier:@"SignWoFB" sender:self];
//                                    } else {
//                                        // The login failed. Check error to see why.
//                                        UIAlertView *eventAlertView = [[UIAlertView alloc]initWithTitle:@"  Sign in unsuccessful. Please enter correct name and password" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//                                        if(eventAlertView != nil)
//                                            
//                                        {
//                                            [eventAlertView show];
//                                        }
//                                        
//                                        
//                                    }
//                                }];
//    
//    
//    
//    
//}
//
//
//
//
//
//
//
//
//
//
//-(IBAction)backSt:(UIStoryboardSegue *)segue
//
//{
//    //AddIngredientsViewController *source = segue.sourceViewController;
//    
//    
//}
//

@end
