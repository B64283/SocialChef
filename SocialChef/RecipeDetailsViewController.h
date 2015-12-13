//
//  RecipeDetailsViewController.h
//  SocialChef
//
//  Created by Matthew Darke on 11/16/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainFeedCustomClass.h"
#import <Parse/Parse.h>

@interface RecipeDetailsViewController : UIViewController <UITableViewDelegate, UIAlertViewDelegate, UITableViewDataSource>


{
    //IBOutlet UIImageView *profImageView;
    //IBOutlet UILabel *profNameLable1;
    IBOutlet UILabel *likesLable1;
    
    IBOutlet UILabel *recipeTitleLable;
    
    IBOutlet UILabel *servingLable;
    IBOutlet UILabel *ingredientsLable1;
    IBOutlet UILabel *ingredientsLable2;
    IBOutlet UILabel *ingredientsLable3;
    IBOutlet UILabel *ingredientsLable4;
    IBOutlet UILabel *ingredientsLable5;
    IBOutlet UILabel *ingredientsLable6;
    IBOutlet UILabel *ingredientsLable7;
    IBOutlet UILabel *ingredientsLable8;
    IBOutlet UILabel *ingredientsLable9;
    IBOutlet UILabel *ingredientsLable10;
    IBOutlet UILabel *ingredientsLable11;
    IBOutlet UILabel *ingredientsLable12;
    IBOutlet UILabel *ingredientsLable13;
    IBOutlet UILabel *ingredientsLable14;
    IBOutlet UILabel *ingredientsLable15;
    IBOutlet UILabel *ingredientsLable16;
    IBOutlet UILabel *ingredientsLable17;
    IBOutlet UILabel *ingredientsLable18;
    
    IBOutlet UITextView *instructions1;
    IBOutlet UITextView *instructions2;
    IBOutlet UITextView *instructions3;
    
    
    
    
    
NSMutableArray *userStrArray; 
    
    
        
    
    
    
}
@property (strong, nonatomic) NSMutableArray* userStrArray;
@property (strong, nonatomic)IBOutlet UIBarButtonItem *back;
@property (weak, nonatomic) PFObject *getObject;
@property (weak, nonatomic) PFQuery *getObjectQuery;

@property (weak, nonatomic)IBOutlet UITextField *comment;



- (IBAction)sendCommentButton:(id)sender;


-(IBAction)showComments:(id)sender;


@property (nonatomic,strong)MainFeedCustomClass *currentRecipe;


@end
