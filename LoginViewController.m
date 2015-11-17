//
//  LoginViewController.m
//  SocialChef
//
//  Created by Matthew Darke on 11/11/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import "LoginViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <ParseFacebookUtilsV4/PFFacebookUtils.h>

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Social-414Chef"] forBarMetrics:UIBarMetricsDefault];
    
   PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        // do stuff with the user
        [self performSegueWithIdentifier:@"Signin" sender:self];
    
    } else {
        // show the signup or login screen
        // Do any additional setup after loading the view.
        FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
        loginButton.center = self.view.center;
        [self.view addSubview:loginButton];
        
        NSArray *permissions = [NSArray arrayWithObjects:@"public_profile", @"email", @"user_friends", nil];
        
        [PFFacebookUtils logInInBackgroundWithReadPermissions:permissions block:^(PFUser *user, NSError *error) {
            if (!user) {
                NSLog(@"Uh oh. The user cancelled the Facebook login.");
                
            } else if (user.isNew) {
                NSLog(@"User signed up and logged in through Facebook!");
                [self performSegueWithIdentifier:@"Signin" sender:self];
                
//            } else if (user){
//                NSLog(@"User logged in through Facebook!");
//                [self performSegueWithIdentifier:@"Signin" sender:self];
//                
            
            }else{
                [self performSegueWithIdentifier:@"Signin" sender:self];
            }
        }];
        
        //    // Request new Publish Permissions
        //    [PFFacebookUtils linkUserInBackground:[PFUser currentUser]
        //                   withPublishPermissions:@[ @"publish_actions"]
        //                                    block:^(BOOL succeeded, NSError *error) {
        //                                        if (succeeded) {
        //                                            NSLog(@"User now has read and publish permissions!");
        //                                        }
        //                                    }];
        

    }
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
