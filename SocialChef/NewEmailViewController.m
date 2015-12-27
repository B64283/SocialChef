//
//  NewEmailViewController.m
//  SocialChef
//
//  Created by Matthew Darke on 12/26/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import "NewEmailViewController.h"
#import <Parse/Parse.h>

@interface NewEmailViewController ()

@end

@implementation NewEmailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(BOOL)validateEmail:(NSString *)emailAdd {
    
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSPredicate *test2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    
    return [test2 evaluateWithObject: emailAdd];
    
}


- (IBAction)saveButn:(id)sender{
    
    
    if ([self validateEmail:[_userEmailchange text]] != 1 ) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Email Error" message:@"Please Enter A Valid Email."preferredStyle:UIAlertControllerStyleAlert];
        
        [self presentViewController:alertController animated:YES completion:nil];
        //For multiple buttons you can use :
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
        }]];
        
        
        
        
        
        
    }
    

    
    if  ([self validateEmail:[_userEmailchange text]] == 1 ) {
        
        
        [self changeUserEmail];
        
        
        
        
        
    }
    

    
    
    
    
    
}


-(void)changeUserEmail {
    
    
    
    NSString *userEmailText = [self.userEmailchange.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
    
    PFQuery *query = [PFUser query];
    [query whereKey:@"email" equalTo:_userEmailchange.text];
    
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        if (object != nil) {
            
            //set warning
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"User email Error" message:@"This email is already taken please enter a different name."preferredStyle:UIAlertControllerStyleAlert];
            
            [self presentViewController:alertController animated:YES completion:nil];
            //For multiple buttons you can use :
            
            [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                
                
                
                
            }]];
            
            NSLog(@"User exist");
            
        }
        else
        {
            NSLog(@"User don`t exist");
            
            PFUser *newUserEmail = [PFUser currentUser];
            newUserEmail.email = userEmailText;
            [newUserEmail saveInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
                if (!error) {
                    
                    
                    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"You have changed your email!" message: @"" preferredStyle:UIAlertControllerStyleAlert];
                    
                    [self presentViewController:alertController animated:YES completion:nil];
                    //For multiple buttons you can use :
                    
                    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                        [self dismissViewControllerAnimated:YES completion:nil];
                        
                    }]];
                    
                }
                
            }];
            
            
            
        }
    }];
    
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
