//
//  RegisterViewController.m
//  SocialChef
//
//  Created by Matthew Darke on 12/4/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import "RegisterViewController.h"
#import <Parse/Parse.h>

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


-(BOOL)validateUserName:(NSString *)namedd {
    
    NSString *userRegEx = @"^[a-zA-Z][a-zA-Z0-9._-]{0,21}([-.][^_]|[^-.]{2})$";
    
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", userRegEx];
    
    return [test evaluateWithObject: namedd];
    
}

-(BOOL)validateEmail:(NSString *)emailAdd {
    
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSPredicate *test2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    
    return [test2 evaluateWithObject: emailAdd];
    
}

-(BOOL)validatePass:(NSString *)passAdd{
    
    NSString *passRegEx = @"^[a-zA-Z][a-zA-Z0-9._-]{0,21}([-.][^_]|[^-.]{2})$";
    
    NSPredicate *test2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passRegEx];
    
    return [test2 evaluateWithObject: passAdd];
    
}












-(void)registerNewUser {
    
    NSString *userNameText = [self.userName.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
    NSString *passWordTetxt = [self.passWord.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    PFQuery *query = [PFUser query];
    [query whereKey:@"username" equalTo:_userName.text];
    
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        if (object != nil) {
            
            //set warning
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"User Name Error" message:@"This UserName is already taken please enter a different name."preferredStyle:UIAlertControllerStyleAlert];
            
            [self presentViewController:alertController animated:YES completion:nil];
            //For multiple buttons you can use :
            
            [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                
            }]];

            
            NSLog(@"User exist");
            
        }
        else
        {
            NSLog(@"User don`t exist");
            
            if (userNameText.length !=0 && passWordTetxt.length !=0) {
                
                
                PFUser *newUser = [PFUser user];
                newUser.username = _userName.text;
                newUser.email = _eMail.text;
                newUser.password = _passWord.text;
                
                // other fields can be set just like with PFObject
                // user[@"phone"] = @"415-392-0202";
                
                [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                    if (!error) {
                        // Hooray! Let them use the app now.
                        
                        
                        
                       [self dismissViewControllerAnimated:YES completion:nil];
                        
                        
                        
                    } else {   NSString *errorString = [error userInfo][@"error"];   //
                        
                        NSLog(@"The error is: %@", errorString);
                        //Show the errorString somewhere and let the user try again.
                        
                    }
                }];
            }
            
            
            
            
            
            else{
                
                //fields cannot be blank warning
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Fields Error" message:@"Fields Cannot Be Blank."preferredStyle:UIAlertControllerStyleAlert];
                
                [self presentViewController:alertController animated:YES completion:nil];
                //For multiple buttons you can use :
                
                [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                    
                }]];

        
            }

            }
    }];

    
    
    
    
    
}





    



    
    
    
    









- (IBAction)registerButn:(id)sender{
    
    if ([self validateUserName:[_userName text]] != 1 ) {
        
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"User Name Error" message:@"Enter a user name over three charecters in length."preferredStyle:UIAlertControllerStyleAlert];
        
        [self presentViewController:alertController animated:YES completion:nil];
        //For multiple buttons you can use :
    
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        }]];
 
        }
    
    if ([self validatePass:[_passWord text]] != 1 ) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Password Error" message:@"Create a password over three charecters in length."preferredStyle:UIAlertControllerStyleAlert];
        
        [self presentViewController:alertController animated:YES completion:nil];
        //For multiple buttons you can use :
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
        }]];

        
}
    
    if ([self validateEmail:[_eMail text]] != 1 ) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Email Error" message:@"Please Enter A Valid Email."preferredStyle:UIAlertControllerStyleAlert];
        
        [self presentViewController:alertController animated:YES completion:nil];
        //For multiple buttons you can use :
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
        }]];
 
        
    }
    
    
    if  ([self validateUserName:[_userName text]] == 1 && [self validateEmail:[_eMail text]] == 1 && [self validatePass:[_passWord text]]) {
        
    
        [self registerNewUser];
        
        
        
        
    }

    
    }



@end
