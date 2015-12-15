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
#import "AppDelegate.h"
@interface LoginViewController () 

//@end
//
//@implementation LoginViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Social-414Chef"] forBarMetrics:UIBarMetricsDefault];
//    
//            // do stuff with the user
//        
//        FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
//        loginButton.center = self.view.center;
//        [self.view addSubview:loginButton];
//    
//    if ([PFUser currentUser]) {
//        
//        [self performSegueWithIdentifier:@"Signin" sender:self];
//
//        
//    }
//    
//    else if (![PFUser currentUser]) {
//
//        
//        NSArray *permissions = [NSArray arrayWithObjects:@"public_profile", @"email", @"user_friends", nil];
//        
//        
//        [PFFacebookUtils logInInBackgroundWithReadPermissions:permissions block:^(PFUser *user, NSError *error) {
//            if (!user) {
//                NSLog(@"Uh oh. The user cancelled the Facebook login.");
//                
//                
//            }if (user){
//                
//                [self _loadData];
//    [self performSegueWithIdentifier:@"Signin" sender:self];
//        }
//            
//        }];
//        
//        //    // Request new Publish Permissions
//        //    [PFFacebookUtils linkUserInBackground:[PFUser currentUser]
//        //                   withPublishPermissions:@[ @"publish_actions"]
//        //                                    block:^(BOOL succeeded, NSError *error) {
//        //                                        if (succeeded) {
//        //                                            NSLog(@"User now has read and publish permissions!");
//        //                                        }
//        //                                    }];
//        
//
//    }
//    
//    
//
//}
//
//-(void)viewDidAppear:(BOOL)animated {
//    if ([PFUser currentUser]) {
//        [self performSegueWithIdentifier:@"Signin" sender:self];
//        
//
//    }
//    
//    
//    
//}
//
//-(void)viewWillAppear:(BOOL)animated{
//    
//    if ([PFUser currentUser]) {
//        [self performSegueWithIdentifier:@"Signin" sender:self];
//        
//        
//    }
//
//    
//    
//}


@property (weak, nonatomic) IBOutlet FBSDKLoginButton *loginButton;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Social-414Chef"] forBarMetrics:UIBarMetricsDefault];
    
    
    
    // do stuff with the user
    UIButton *myLoginButton=[UIButton buttonWithType:UIButtonTypeCustom];
    myLoginButton.backgroundColor=[UIColor darkGrayColor];
    myLoginButton.frame=CGRectMake(0,0,180,40);
    myLoginButton.center = self.view.center;
    [myLoginButton setTitle: @"FaceBook Login" forState: UIControlStateNormal];
    
    // Handle clicks on the button
    [myLoginButton
     addTarget:self
     action:@selector(loginButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    // Add the button to the view
    [self.view addSubview:myLoginButton];
    if ([PFUser currentUser]) {
        [self _loadData];
        [self performSegueWithIdentifier:@"Signin" sender:self];
        
        
    }
    
    //    else if (![PFUser currentUser]) {
    //
    //
    //        NSArray *permissions = [NSArray arrayWithObjects:@"public_profile", @"email", @"user_friends", nil];
    //
    //
    //        [PFFacebookUtils logInInBackgroundWithReadPermissions:permissions block:^(PFUser *user, NSError *error) {
    //            if (!user) {
    //                NSLog(@"Uh oh. The user cancelled the Facebook login.");
    //
    //
    //            }if (user){
    //
    //    [self performSegueWithIdentifier:@"Signin" sender:self];
    //        }
    //
    //        }];
    
    //    // Request new Publish Permissions
    //    [PFFacebookUtils linkUserInBackground:[PFUser currentUser]
    //                   withPublishPermissions:@[ @"publish_actions"]
    //                                    block:^(BOOL succeeded, NSError *error) {
    //                                        if (succeeded) {
    //                                            NSLog(@"User now has read and publish permissions!");
    //                                        }
    //                                    }];
    
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_userNameSin resignFirstResponder];
    [_userPassword resignFirstResponder];
}

- (IBAction)signInAct:(id)sender{
    
    
    
    [PFUser logInWithUsernameInBackground:_userNameSin.text password:_userPassword.text
                                    block:^(PFUser *userS, NSError *error) {
                                        
                                        if (userS) {
                                            
                                            // Do stuff after successful login.
                                            UIAlertView *eventAlertView = [[UIAlertView alloc]initWithTitle:@"Sign in successful!" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                            
                                            if(eventAlertView != nil)
                                                
                                            {
                                                [eventAlertView show];
                                                
                                            }
                                            [self performSegueWithIdentifier:@"Signin" sender:self];
                                        } else {
                                            // The login failed. Check error to see why.
                                            UIAlertView *eventAlertView = [[UIAlertView alloc]initWithTitle:@"  Sign in unsuccessful. Please enter correct name and password" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                            if(eventAlertView != nil)
                                                
                                            {
                                                [eventAlertView show];
                                            }
                                            
                                            
                                        }
                                    }];
    
    
    
    
}

-(IBAction)backSt:(UIStoryboardSegue *)segue

{
    //AddIngredientsViewController *source = segue.sourceViewController;
    
    
}










-(void)loginButtonClicked
{
    NSArray *permissions = [NSArray arrayWithObjects:@"public_profile", @"email", @"user_friends", nil];
    
    
    [PFFacebookUtils logInInBackgroundWithReadPermissions:permissions block:^(PFUser *user, NSError *error) {
        
        if (error) {
            NSLog(@"Process error");
            
        } else if (user.isNew) {
            NSLog(@"Cancelled");
            
        } else {
            NSLog(@"Logged in");
            [self _loadData];
            [self performSegueWithIdentifier:@"Signin" sender:self];

            
            
        }
    }];
}






























- (void)_loadData {
    // ...
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection  *connection, id result, NSError *error) {
        if (!error) {
            // result is a dictionary with the user's Facebook data
            //PFUser *user = [PFUser currentUser];
            
            NSString *facebookID = [result objectForKey:@"id"];
            
            NSString *facebookName = [result objectForKey:@"name"];
            
            
            NSURL *pictureURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=square", facebookID]];
            //large&return_ssl_resources=1
            
            NSURLRequest *pictureURLRequest = [NSURLRequest requestWithURL:pictureURL];
            [NSURLConnection connectionWithRequest:pictureURLRequest delegate:self];
            
            
            
            
            
            if (facebookName && facebookName != 0) {
                [[PFUser currentUser]setObject:facebookName forKey:@"username"];
            }
            if (facebookID && facebookID != 0) {
                [[PFUser currentUser]setObject:facebookID forKey:@"facebookID"];
            }
            
            NSURLRequest *urlRequest = [NSURLRequest requestWithURL:pictureURL];
            
            // Run network request asynchronously
            [NSURLConnection sendAsynchronousRequest:urlRequest
                                               queue:[NSOperationQueue mainQueue]
                                   completionHandler:
             ^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                 if (connectionError == nil && data != nil) {
                     // Set the image in the imageView
                     // ...
                     
                 }
             }];
            
            
            
            [[PFUser currentUser]saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
                
                FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                              initWithGraphPath:@"me/friends"
                                              parameters:nil];
                [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,
                                                      id result,
                                                      NSError *error) {
                    // Handle the result
            
                    
                    if (!error) {
                        NSArray *data = [result objectForKey:@"data"];
                        NSMutableArray *facebookIDs = [[NSMutableArray alloc]initWithCapacity:data.count];
                        for (NSDictionary *friendData in data){
                            
                            [facebookIDs addObject:[friendData objectForKey:@"id"]];
                            
                        }
                        
                    [[PFUser currentUser]setObject:facebookIDs forKey:@"facebookFriends"];
                    [[PFUser currentUser]saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error){
                            
                        }];
                        
                        
                    }else{
                        
                    }
                }];
            
            }];
            
        }else{
            
        }

    }];
}


-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    
    
    
}


-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    
    _profilePicData = [[NSMutableData alloc]init];
    
    
}


-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    
    [self.profilePicData appendData:data];
}

//needs logout method
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    if (self.profilePicData.length == 0 || !self.profilePicData) {
        
    }
    else{
        PFFile *profilePicFile = [PFFile fileWithData:self.profilePicData];
        [profilePicFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            
            if (!succeeded) {
                
                
            }
            else{
                PFUser *user = [PFUser currentUser];
                user[@"profilePhoto"] = profilePicFile;
                [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
                    if (!succeeded) {
                        
                        
                    }
                    else{
                        
                       //
                    }
                }];
                
            }
        }];
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
