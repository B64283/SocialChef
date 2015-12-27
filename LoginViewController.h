//
//  LoginViewController.h
//  SocialChef
//
//  Created by Matthew Darke on 11/11/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <Parse/Parse.h>
@interface LoginViewController : ViewController <NSURLConnectionDataDelegate, FBSDKGraphRequestConnectionDelegate>

{

NSArray *userStringArray;

}
@property (weak, nonatomic)IBOutlet UITextField *userNameSin;

@property (weak, nonatomic)IBOutlet UITextField *userPassword;

-(IBAction)signInAct:(id)sender;
-(IBAction)forgotPassAction:(id)sender;


@property (strong,nonatomic)NSMutableData *profilePicData;






@end
