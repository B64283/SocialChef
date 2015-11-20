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


-(IBAction)TakePhoto:(id)sender;
-(IBAction)Sharerecipe:(id)sender;


@property (strong, nonatomic)IBOutlet UIBarButtonItem *share;

@property (strong, nonatomic) NSMutableArray* userStrIngArray;

@property (weak, nonatomic) IBOutlet UITableView* myIngredientTableView;

@property (weak, nonatomic) IBOutlet UITableView* myDirectionsTableView;



@end
