//
//  RecipeDetailsViewController.m
//  SocialChef
//
//  Created by Matthew Darke on 11/16/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import "RecipeDetailsViewController.h"
#import <ParseFacebookUtilsV4/PFFacebookUtils.h>
#import "MainFeedTableViewController.h"
#import <Parse/Parse.h>

@interface RecipeDetailsViewController ()

@property (weak, nonatomic) IBOutlet PFImageView *profileImageView;
@property (weak, nonatomic) IBOutlet PFImageView *recipeImageView;

@property (weak, nonatomic) IBOutlet UILabel *userNameLable;




@end

@implementation RecipeDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.getObjectQuery = [PFQuery queryWithClassName:@"Takenphoto"];
    
    NSString *titleLableString = [self.getObject objectForKey:@"title"];
    
    recipeTitleLable.text = titleLableString;
    
    
    //_recipeImageView.image = [self.getObject objectForKey:@"Takenimage"];

    PFImageView *photo = _recipeImageView;
    photo.file = [self.getObject objectForKey:@"Takenimage"];
    [photo loadInBackground];
    
    
    
   
    
    //_userNameLable.text = [self.getObject objectForKey:@"whoIsuser"];
    servingLable.text = [self.getObject objectForKey:@"serving"];
    ingredientsLable1.text = [self.getObject objectForKey:@"ingred1"];
    ingredientsLable2.text = [self.getObject objectForKey:@"ingred2"];
    ingredientsLable3.text = [self.getObject objectForKey:@"ingred3"];
    ingredientsLable4.text = [self.getObject objectForKey:@"ingred4"];
    ingredientsLable5.text = [self.getObject objectForKey:@"ingred5"];
    ingredientsLable6.text = [self.getObject objectForKey:@"ingred6"];
    ingredientsLable7.text = [self.getObject objectForKey:@"ingred7"];
    ingredientsLable8.text = [self.getObject objectForKey:@"ingred8"];
    ingredientsLable9.text = [self.getObject objectForKey:@"ingred9"];
    ingredientsLable10.text = [self.getObject objectForKey:@"ingred10"];
    ingredientsLable11.text = [self.getObject objectForKey:@"ingred11"];
    ingredientsLable12.text = [self.getObject objectForKey:@"ingred12"];
    ingredientsLable13.text = [self.getObject objectForKey:@"ingred13"];
    ingredientsLable14.text = [self.getObject objectForKey:@"ingred14"];
    ingredientsLable15.text = [self.getObject objectForKey:@"ingred15"];
    ingredientsLable16.text = [self.getObject objectForKey:@"ingred16"];
    ingredientsLable17.text = [self.getObject objectForKey:@"ingred17"];
    ingredientsLable18.text = [self.getObject objectForKey:@"ingred18"];

    instructions1.text = [self.getObject objectForKey:@"stepOne"];
    instructions2.text = [self.getObject objectForKey:@"stepTwo"];
    instructions3.text = [self.getObject objectForKey:@"stepThree"];






}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    

    
    
    
    
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
