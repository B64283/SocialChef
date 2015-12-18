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



@property (weak, nonatomic) IBOutlet FBSDKLoginButton *loginButton;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Social-414Chef"] forBarMetrics:UIBarMetricsDefault];
    
    
    
    // do stuff with the user
    UIButton *myLoginButton=[UIButton buttonWithType:UIButtonTypeCustom];
    myLoginButton.backgroundColor=[UIColor blueColor];
    myLoginButton.frame=CGRectMake(0,0,160,30);
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
        
        
    }else if (![PFUser currentUser]) {
        
        
        
    }
    
    
}



//-(IBAction)forgotPassAction:(id)sender{
    
    //[PFUser requestPasswordResetForEmailInBackground:@"email@example.com"];
    
    
//}










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
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Signin Succsessful" message:@""preferredStyle:UIAlertControllerStyleAlert];
            
            [self presentViewController:alertController animated:YES completion:nil];
            //For multiple buttons you can use :
            
            [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [self performSegueWithIdentifier:@"Signin" sender:self];
            }]];
      
    } else {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Signin Error" message:@"Please Enter Correct User Name And Password"preferredStyle:UIAlertControllerStyleAlert];
        
        [self presentViewController:alertController animated:YES completion:nil];
        //For multiple buttons you can use :
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
           // [self performSegueWithIdentifier:@"Signin" sender:self];
        }]];
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
        
        if (user.isNew) {
            NSLog(@"User signed up and logged in through Facebook!");
            [self _loadData];
            [self performSegueWithIdentifier:@"Signin" sender:self];
            
        } else if(user) {
            NSLog(@"Logged in");
            [self _loadData];
            [self performSegueWithIdentifier:@"Signin" sender:self];
        
        } else {
            
            NSLog(@"Cancelled");
            
        }
    }];
}

-(IBAction)forgotPassAction:(id)sender{
    
    
    [self performSegueWithIdentifier:@"lossSegue" sender:self];
    
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
            
    //ive tried to remedy this to no avail
            [NSURLConnection connectionWithRequest:pictureURLRequest delegate:self];
            
            
            
            
            
            if (facebookName && facebookName != 0) {
                [[PFUser currentUser]setObject:facebookName forKey:@"username"];
            }
            if (facebookID && facebookID != 0) {
                [[PFUser currentUser]setObject:facebookID forKey:@"facebookID"];
            }
            
            NSURLRequest *urlRequest = [NSURLRequest requestWithURL:pictureURL];
            
            // Run network request asynchronously
             //ive tried to remedy this to no avail
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
