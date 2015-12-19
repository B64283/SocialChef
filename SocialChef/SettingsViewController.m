//
//  SettingsViewController.m
//  SocialChef
//
//  Created by Matthew Darke on 12/5/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import "SettingsViewController.h"
#import "AppDelegate.h"
@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)backTotheSett:(UIStoryboardSegue *)segue

{
    //AddIngredientsViewController *source = segue.sourceViewController;
    
    
}

-(IBAction)signOut:(id)sender{
    
    [PFUser logOut];
[self performSegueWithIdentifier:@"BacktoLogin" sender:self];  
}


-(IBAction)signOutChangePass:(id)sender{
    
     [PFUser logOut];
    [self performSegueWithIdentifier:@"changepassSegue" sender:self];
    
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
