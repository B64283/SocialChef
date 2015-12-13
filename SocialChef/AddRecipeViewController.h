//
//  AddRecipeViewController.h
//  SocialChef
//
//  Created by Matthew Darke on 11/17/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"
#import <Parse/Parse.h>

@interface AddRecipeViewController : UIViewController  <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITableViewDelegate, UIAlertViewDelegate, UITableViewDataSource>



{
   NSMutableArray *userStrIngArray;
    IBOutlet UIAlertView *alert;
    
    __weak IBOutlet UIImageView *imageView;
    
    UIImagePickerController *picker;
    
    UIImage *image;
    
    
}
- (id)initWithImage:(UIImage *)aImage;

-(IBAction)TakePhoto:(id)sender;
-(IBAction)Sharerecipe:(id)sender;

@property (weak, nonatomic)IBOutlet UITextField *recipeTitle;



@property (weak, nonatomic)IBOutlet UITextField *recipeServings;

@property (weak, nonatomic)IBOutlet UITextField *ingredItem1;
@property (weak, nonatomic)IBOutlet UITextField *ingredItem2;
@property (weak, nonatomic)IBOutlet UITextField *ingredItem3;
@property (weak, nonatomic)IBOutlet UITextField *ingredItem4;
@property (weak, nonatomic)IBOutlet UITextField *ingredItem5;
@property (weak, nonatomic)IBOutlet UITextField *ingredItem6;
@property (weak, nonatomic)IBOutlet UITextField *ingredItem7;
@property (weak, nonatomic)IBOutlet UITextField *ingredItem8;
@property (weak, nonatomic)IBOutlet UITextField *ingredItem9;
@property (weak, nonatomic)IBOutlet UITextField *ingredItem10;
@property (weak, nonatomic)IBOutlet UITextField *ingredItem11;
@property (weak, nonatomic)IBOutlet UITextField *ingredItem12;
@property (weak, nonatomic)IBOutlet UITextField *ingredItem13;
@property (weak, nonatomic)IBOutlet UITextField *ingredItem14;
@property (weak, nonatomic)IBOutlet UITextField *ingredItem15;
@property (weak, nonatomic)IBOutlet UITextField *ingredItem16;
@property (weak, nonatomic)IBOutlet UITextField *ingredItem17;
@property (weak, nonatomic)IBOutlet UITextField *ingredItem18;

@property (weak, nonatomic)IBOutlet UITextView *stepOne;
@property (weak, nonatomic)IBOutlet UITextView *stepTwo;
@property (weak, nonatomic)IBOutlet UITextView *stepThree;

@property (weak, nonatomic)IBOutlet UIView *myView;
@property (weak, nonatomic)IBOutlet UIScrollView *scrollView;















@property (strong, nonatomic)IBOutlet UIBarButtonItem *share;

@property (strong, nonatomic) NSMutableArray* userStrIngArray;

@property (weak, nonatomic) IBOutlet UITableView* myIngredientTableView;

@property (weak, nonatomic) IBOutlet UITableView* myDirectionsTableView;



@end
