//
//  AddIngredientsViewController.h
//  SocialChef
//
//  Created by Matthew Darke on 11/17/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddIngredientsViewController : UIViewController

@property (weak, nonatomic)IBOutlet UITextField *ingredientName;
@property (weak, nonatomic)IBOutlet UITextField *measureNumber;

- (IBAction)saveButn:(id)sender;






@end
