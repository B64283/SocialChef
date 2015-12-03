//
//  AddShoppingItemsViewController.h
//  SocialChef
//
//  Created by Matthew Darke on 12/3/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface AddShoppingItemsViewController : UIViewController


@property (weak, nonatomic)IBOutlet UITextField *itemName;
@property (weak, nonatomic)IBOutlet UITextField *itemNumber;

- (IBAction)saveItemButton:(id)sender;

@property (strong, nonatomic)IBOutlet UIButton *backTo;
@end
