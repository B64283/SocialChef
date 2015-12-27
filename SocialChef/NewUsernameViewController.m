//
//  NewUsernameViewController.m
//  SocialChef
//
//  Created by Matthew Darke on 12/26/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import "NewUsernameViewController.h"
#import <Parse/Parse.h>
@interface NewUsernameViewController ()

@end

@implementation NewUsernameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)saveButn:(id)sender{
    
    [self changeUserName];
    
    
    
}


-(void)changeUserName {
    
    
    
    NSString *userNameText = [self.userNamechange.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
    
    PFQuery *query = [PFUser query];
    [query whereKey:@"username" equalTo:_userNamechange.text];
    
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
            
            PFUser *newUserName = [PFUser currentUser];
            newUserName.username = userNameText;
            [newUserName saveInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
                if (!error) {
                    
                
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"You have changed your username!" message: @"" preferredStyle:UIAlertControllerStyleAlert];
                
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
