//
//  NewEmailViewController.h
//  SocialChef
//
//  Created by Matthew Darke on 12/26/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewEmailViewController : UIViewController


-(BOOL)validateEmail:(NSString *)emailAdd;

- (IBAction)saveButn:(id)sender;


@property (weak, nonatomic)IBOutlet UITextField *userEmailchange;



@end
