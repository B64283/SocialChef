//
//  RegisterViewController.h
//  SocialChef
//
//  Created by Matthew Darke on 12/4/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>


@interface RegisterViewController : UIViewController

@property (weak, nonatomic)IBOutlet UITextField *userName;
@property (weak, nonatomic)IBOutlet UITextField *eMail;
@property (weak, nonatomic)IBOutlet UITextField *passWord;

- (IBAction)registerButn:(id)sender;

-(BOOL)validateUserName:(NSString *)namedd;

-(BOOL)validateEmail:(NSString *)emailAdd;
-(BOOL)validatePass:(NSString *)passAdd;




@end
