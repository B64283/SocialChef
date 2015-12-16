//
//  AddShoppingItemsViewController.m
//  SocialChef
//
//  Created by Matthew Darke on 12/3/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import "AddShoppingItemsViewController.h"
#import "ShoppingListViewController.h"
#import <Parse/Parse.h>
@interface AddShoppingItemsViewController ()

@end

@implementation AddShoppingItemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)saveItemButton:(id)sender {
    
    
        [self performSelector:@selector(submitForm)];
        [self.navigationController popViewControllerAnimated:YES];
}

    
    
-(void)submitForm {
    
    
    PFObject *privateNote = [PFObject objectWithClassName:@"nSavedItems"];
    // privateNote[@"content"] = @"This note is private!";
    
    //[privateNote saveInBackground];
    
    //PFObject *gameScore = [PFObject objectWithClassName:@"savedItems"];
    privateNote[@"itemName"] = _itemName.text;
    privateNote[@"itemNumber"] = _itemNumber.text;
    
    privateNote.ACL = [PFACL ACLWithUser:[PFUser currentUser]];
    [privateNote saveEventually];
    [privateNote pinInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            
            //[self dismissViewControllerAnimated:YES completion:nil];
            // The object has been saved.
           
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Saved" message:@" item successfully saved!"preferredStyle:UIAlertControllerStyleAlert];
            
            [self presentViewController:alertController animated:YES completion:nil];
            //For multiple buttons you can use :
            
            [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                
                [self closeAlertview];
           
            }]];
        
        
        } else {
            // There was a problem, check error.description
            
           
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Oops!" message:@" There was an error" preferredStyle:UIAlertControllerStyleAlert];
            
            [self presentViewController:alertController animated:YES completion:nil];
            //For multiple buttons you can use :
            
            [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                
                [self closeAlertview];
                
            }]];
        }
    }];
     
            
}



-(void)closeAlertview
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



        
        
        
        
        
        
        
        

-(IBAction)backTotheStart:(UIStoryboardSegue *)segue
{
    
    
    
    
    
    
    
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
