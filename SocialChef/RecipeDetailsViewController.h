//
//  RecipeDetailsViewController.h
//  SocialChef
//
//  Created by Matthew Darke on 11/16/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainFeedCustomClass.h"


@interface RecipeDetailsViewController : UIViewController
{
    IBOutlet UIImageView *profImageView;
    IBOutlet UILabel *profNameLable1;
    IBOutlet UILabel *likesLable1;
    
    IBOutlet UILabel *recipeTitleLable;
    
    IBOutlet UILabel *servingLable;
    IBOutlet UILabel *ingredientsLable1;
    IBOutlet UILabel *ingredientsLable2;
    IBOutlet UILabel *ingredientsLable3;
    IBOutlet UILabel *ingredientsLable4;
    IBOutlet UILabel *ingredientsLable5;
    IBOutlet UILabel *ingredientsLable6;
    
    IBOutlet UITextView *directionsTextViewLable1;
    IBOutlet UIImageView *recipeImageView;
    
    
    
    
        
    
    
    
}

@property (strong, nonatomic)IBOutlet UIBarButtonItem *back;

-(IBAction)showComments:(id)sender;


@property (nonatomic,strong)MainFeedCustomClass *currentRecipe;


@end
