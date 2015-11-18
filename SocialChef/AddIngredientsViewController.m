//
//  AddIngredientsViewController.m
//  SocialChef
//
//  Created by Matthew Darke on 11/17/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import "AddIngredientsViewController.h"
#import <Parse/Parse.h>
#import "AddRecipeViewController.h"

@interface AddIngredientsViewController ()

@end

@implementation AddIngredientsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)submitForm {
    
    
    PFObject *privateNote = [PFObject objectWithClassName:@"newSavedItems"];
    // privateNote[@"content"] = @"This note is private!";
    
    //[privateNote saveInBackground];
    
    //PFObject *gameScore = [PFObject objectWithClassName:@"savedItems"];
    privateNote[@"itemName"] = _ingredientName.text;
    privateNote[@"itemNumber"] = _measureNumber.text;
    
    privateNote.ACL = [PFACL ACLWithUser:[PFUser currentUser]];
    [privateNote saveEventually];
    [privateNote pinInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            
            //[self dismissViewControllerAnimated:YES completion:nil];
            // The object has been saved.
            UIAlertView *eventAlertView = [[UIAlertView alloc]initWithTitle:@"Saved!" message:@"  item successfully saved" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
            
            if(eventAlertView != nil)
                
            {
                [eventAlertView show];
                
                [eventAlertView dismissWithClickedButtonIndex:0 animated:YES];
            }
            
            
        } else {
            // There was a problem, check error.description
            
            UIAlertView *eventAlertView = [[UIAlertView alloc]initWithTitle:@"Oops!" message:@" There was an error" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            if(eventAlertView != nil)
                
            {
                [eventAlertView show];
                
            }
            
            
        }
    }];
    
    
    
    
    
}



- (IBAction)saveButn:(id)sender {
    
    [self performSelector:@selector(submitForm)];
    
    [self.navigationController popViewControllerAnimated:YES];
    






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
