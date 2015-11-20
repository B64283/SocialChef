//
//  MainFeedTableViewController.m
//  SocialChef
//
//  Created by Matthew Darke on 11/11/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import "MainFeedTableViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <ParseFacebookUtilsV4/PFFacebookUtils.h>
#import "MainFeedCustomClass.h"
#import "CustomCell.h"
#import "RecipeDetailsViewController.h"
#import "AddRecipeViewController.h"


@interface MainFeedTableViewController ()

@end

@implementation MainFeedTableViewController

@synthesize recipeArray;



- (void)viewDidLoad {
    
    
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Social-414Chef"] forBarMetrics:UIBarMetricsDefault];
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    //self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
   MainFeedCustomClass *recipe1 = [[MainFeedCustomClass alloc]init];
    recipe1.userName =@"Matthew Darke";
    recipe1.userFollow = @"22";
    recipe1.likes = @"11";
    recipe1.serving = @"4";
    recipe1.ingredients1 =@"Monterey Jack cheese";
    recipe1.ingredients2 =@"1 large red onion";
    recipe1.ingredients3 =@"1 bag of dried pacilla chillies";
    recipe1.ingredients4 =@"1 tsp onion powder";
    recipe1.ingredients5 =@"2 cloves of garlic";
    recipe1.ingredients6 =@"1 tsp salt";
    recipe1.directionsLable = @"fry each tortilla in hot oil a few seconds on each side to soften. drain/set-aside\n\n2. put a small handful of both cheese on a tortilla. Add a sprinkle of onions. Roll up and place seam side down in a baking pan";
    
    
    
    recipe1.recipeTitle = @"Cheese Enchaladas with pascilla sauce";
    recipe1.userImage = [UIImage imageNamed:@"MeImage.jpg"];
    recipe1.recipeImage = [UIImage imageNamed:@"IMG_1732.jpg"];
 
    
    
    
    /////////////////////////////////////////////////////////////////////////////
    
    
    
    MainFeedCustomClass *recipe2 = [[MainFeedCustomClass alloc]init];
    recipe2.userName =@"Jessica Darke";
    recipe2.userFollow = @"30";
    recipe2.likes = @"22";
    recipe2.serving = @"4";
    recipe2.ingredients1 =@"4 scalloped chicken brest";
    recipe2.ingredients2 =@"4 small shallots";
    recipe2.ingredients3 =@"1 cup heavy whipping cream";
    recipe2.ingredients4 =@"1 tsp safforon";
    recipe2.ingredients5 =@"2 cups white wine";
    recipe2.ingredients6 =@"1 tsp salt";
    recipe2.directionsLable = @"fry each tortilla in hot oil a few seconds on each side to soften. drain/set-aside\n\n2. put a small handful of both cheese on a tortilla. Add a sprinkle of onions. Roll up and place seam side down in a baking pan";

    recipe2.recipeTitle = @"Chicken Scallopinni with a saffron cream wine sauce";
    recipe2.userImage = [UIImage imageNamed:@"jess.jpg"];
    recipe2.recipeImage = [UIImage imageNamed:@"IMG_Scallopinni.jpg"];
    
   
    
    
    
    
    
    recipeArray = [[NSMutableArray alloc]initWithObjects:recipe1, recipe2, nil];
    
    
    
    [self->myTabelView reloadData];
    
    
}



-(IBAction)backTotheStart:(UIStoryboardSegue *)segue




{

    
    
}


- (IBAction)commentButn:(id)sender {
    
    [self performSegueWithIdentifier:@"DetailsSegue" sender:self];
    
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
////#warning Incomplete implementation, return the number of sections
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return [recipeArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCustomCell"];
    if (cell != nil)
    {
        MainFeedCustomClass *currentRecipe = [recipeArray objectAtIndex:indexPath.row];
        
        [cell refreshCellWithInfo:currentRecipe.userName secondString:currentRecipe.userFollow thirdString:currentRecipe.recipeTitle fourthString:currentRecipe.likes cellImage:currentRecipe.userImage recepImage:currentRecipe.recipeImage];
        
        //cell.detailTextLabel.text = currentRecipe.description;
    
    // Configure the cell..
    }
    return cell;
}









/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  
    if ([segue.identifier isEqualToString:@"AddRecipeSegue"])
    {
       AddRecipeViewController *destViewController = segue.destinationViewController;
    
    
    
    }
    
    
    
    else if ([segue.identifier isEqualToString:@"DetailsSegue"])
        
    {
    
        
        RecipeDetailsViewController *destViewController = segue.destinationViewController;
        
        NSIndexPath *indexPath = [self.mmyTableView indexPathForSelectedRow];
        destViewController.currentRecipe = [recipeArray objectAtIndex:indexPath.row];
    
    
    }
    
    
}


@end
