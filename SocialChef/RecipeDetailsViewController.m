//
//  RecipeDetailsViewController.m
//  SocialChef
//
//  Created by Matthew Darke on 11/16/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import "RecipeDetailsViewController.h"

@interface RecipeDetailsViewController ()

@end

@implementation RecipeDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    profImageView.image = self.currentRecipe.userImage;
    profNameLable1.text = self.currentRecipe.userName;
    likesLable1.text = self.currentRecipe.likes;
    
    recipeTitleLable.text = self.currentRecipe.recipeTitle;
    
    servingLable.text = self.currentRecipe.serving;
    ingredientsLable1.text = self.currentRecipe.ingredients1;
    ingredientsLable2.text = self.currentRecipe.ingredients2;
    ingredientsLable3.text = self.currentRecipe.ingredients3;
    ingredientsLable4.text = self.currentRecipe.ingredients4;
    ingredientsLable5.text = self.currentRecipe.ingredients5;
    ingredientsLable6.text = self.currentRecipe.ingredients6;
    
    directionsTextViewLable1.text = self.currentRecipe.directionsLable;
    recipeImageView.image = self.currentRecipe.recipeImage;

    
    
    
    
}


- (IBAction)showComments:(id)sender {
    
    
    UIAlertView *eventAlertView = [[UIAlertView alloc]initWithTitle:@"This is where the user will add comments on their friends recipes" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    if(eventAlertView != nil)
        
    {
        [eventAlertView show];
    }

    
    
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
