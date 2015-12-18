//
//  LossPasswordViewController.m
//  SocialChef
//
//  Created by Matthew Darke on 12/16/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import "LossPasswordViewController.h"
#import <Parse/Parse.h>
@interface LossPasswordViewController ()

@end

@implementation LossPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)sendEmail {
    
   //NSString *emailTetxt = [self.eMailText.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    [PFUser requestPasswordResetForEmailInBackground:self.eMailText.text block:^(BOOL succeeded, NSError *error) {
        
                if(succeeded){
                    //send message
                    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Email Sent" message:@"An Email has bees sent to the adress submitted. Please follow instructions to reset password"preferredStyle:UIAlertControllerStyleAlert];
                    
                    [self presentViewController:alertController animated:YES completion:nil];
                    //For multiple buttons you can use :
                    
                    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                        ///[self closeAlertview];
                        
                        [self performSegueWithIdentifier:@"fromchangePass" sender:self];
                    }]];
                    

            
            
        }else{
        
        //failed message
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"ERROR" message:@"email does not exist in our database. Please try again"preferredStyle:UIAlertControllerStyleAlert];
            
            [self presentViewController:alertController animated:YES completion:nil];
            //For multiple buttons you can use :
            
            [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                
            }]];
            

        }
        
        
    }];
}


- (IBAction)sendButn:(id)sender{
    
    
    [self sendEmail];
    
}


-(void)closeAlertview
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
