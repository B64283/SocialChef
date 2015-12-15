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
#import "CommentCell.h"

@interface RecipeDetailsViewController ()
@property (weak, nonatomic) IBOutlet UITableView* myCommentTableView;
@property (weak, nonatomic) IBOutlet PFImageView *profileImageView;
@property (weak, nonatomic) IBOutlet PFImageView *recipeImageView;

@property (weak, nonatomic) IBOutlet UILabel *userNameLable;

@property (strong, nonatomic) IBOutlet UIButton *starButton1;
@property (strong, nonatomic) IBOutlet UIButton *starButton2;
@property (strong, nonatomic) IBOutlet UIButton *starButton3;
@property (strong, nonatomic) IBOutlet UIButton *starButton4;
@property (strong, nonatomic) IBOutlet UIButton *starButton5;




@end

@implementation RecipeDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self performSelector:@selector(retrieveFromParse)];
    [self.myCommentTableView reloadData];
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




-(IBAction)onClick:(id)sender
{
    UIButton *bttn = (UIButton *)sender;
    if (bttn != nil)
        
    {
        if  (bttn.tag == 1)
        {
            
            _starButton1 = (UIButton *)[self.view viewWithTag:1];
            _starButton2 = (UIButton *)[self.view viewWithTag:2];
            _starButton3 = (UIButton *)[self.view viewWithTag:3];
            _starButton4 = (UIButton *)[self.view viewWithTag:4];
            _starButton5 = (UIButton *)[self.view viewWithTag:5];
            [_starButton1 setImage:[UIImage imageNamed:@"selectedStar.png"] forState:UIControlStateNormal];
            [_starButton2 setImage:[UIImage imageNamed:@"GrayStar.png"] forState:UIControlStateNormal];
            [_starButton3 setImage:[UIImage imageNamed:@"GrayStar.png"] forState:UIControlStateNormal];
            [_starButton4 setImage:[UIImage imageNamed:@"GrayStar.png"] forState:UIControlStateNormal];
            [_starButton5 setImage:[UIImage imageNamed:@"GrayStar.png"] forState:UIControlStateNormal];
    
        }
        else if (bttn.tag == 2)
        {
            _starButton1 = (UIButton *)[self.view viewWithTag:1];
            _starButton2 = (UIButton *)[self.view viewWithTag:2];
            _starButton3 = (UIButton *)[self.view viewWithTag:3];
            _starButton4 = (UIButton *)[self.view viewWithTag:4];
            _starButton5 = (UIButton *)[self.view viewWithTag:5];
            [_starButton1 setImage:[UIImage imageNamed:@"selectedStar.png"] forState:UIControlStateNormal];
            [_starButton2 setImage:[UIImage imageNamed:@"selectedStar.png"] forState:UIControlStateNormal];
            [_starButton3 setImage:[UIImage imageNamed:@"GrayStar.png"] forState:UIControlStateNormal];
            [_starButton4 setImage:[UIImage imageNamed:@"GrayStar.png"] forState:UIControlStateNormal];
            [_starButton5 setImage:[UIImage imageNamed:@"GrayStar.png"] forState:UIControlStateNormal];

        }
        else if (bttn.tag == 3)
        {
            _starButton1 = (UIButton *)[self.view viewWithTag:1];
            _starButton2 = (UIButton *)[self.view viewWithTag:2];
            _starButton3 = (UIButton *)[self.view viewWithTag:3];
            _starButton4 = (UIButton *)[self.view viewWithTag:4];
            _starButton5 = (UIButton *)[self.view viewWithTag:5];
            [_starButton1 setImage:[UIImage imageNamed:@"selectedStar.png"] forState:UIControlStateNormal];
            [_starButton2 setImage:[UIImage imageNamed:@"selectedStar.png"] forState:UIControlStateNormal];
            [_starButton3 setImage:[UIImage imageNamed:@"selectedStar.png"] forState:UIControlStateNormal];
            [_starButton4 setImage:[UIImage imageNamed:@"GrayStar.png"] forState:UIControlStateNormal];
            [_starButton5 setImage:[UIImage imageNamed:@"GrayStar.png"] forState:UIControlStateNormal];
            

        }
        else if (bttn.tag == 4)
        {
            _starButton1 = (UIButton *)[self.view viewWithTag:1];
            _starButton2 = (UIButton *)[self.view viewWithTag:2];
            _starButton3 = (UIButton *)[self.view viewWithTag:3];
            _starButton4 = (UIButton *)[self.view viewWithTag:4];
            _starButton5 = (UIButton *)[self.view viewWithTag:5];
            [_starButton1 setImage:[UIImage imageNamed:@"selectedStar.png"] forState:UIControlStateNormal];
            [_starButton2 setImage:[UIImage imageNamed:@"selectedStar.png"] forState:UIControlStateNormal];
            [_starButton3 setImage:[UIImage imageNamed:@"selectedStar.png"] forState:UIControlStateNormal];
            [_starButton4 setImage:[UIImage imageNamed:@"selectedStar.png"] forState:UIControlStateNormal];
            [_starButton5 setImage:[UIImage imageNamed:@"GrayStar.png"] forState:UIControlStateNormal];
            

            
     
        }
        else if (bttn.tag == 5)
        {
            
            _starButton1 = (UIButton *)[self.view viewWithTag:1];
            _starButton2 = (UIButton *)[self.view viewWithTag:2];
            _starButton3 = (UIButton *)[self.view viewWithTag:3];
            _starButton4 = (UIButton *)[self.view viewWithTag:4];
            _starButton5 = (UIButton *)[self.view viewWithTag:5];
            [_starButton1 setImage:[UIImage imageNamed:@"selectedStar.png"] forState:UIControlStateNormal];
            [_starButton2 setImage:[UIImage imageNamed:@"selectedStar.png"] forState:UIControlStateNormal];
            [_starButton3 setImage:[UIImage imageNamed:@"selectedStar.png"] forState:UIControlStateNormal];
            [_starButton4 setImage:[UIImage imageNamed:@"selectedStar.png"] forState:UIControlStateNormal];
            [_starButton5 setImage:[UIImage imageNamed:@"selectedStar.png"] forState:UIControlStateNormal];
            

            

            
            
            
            
        }
    }
    
}


- (void)retrieveFromParse
{
    PFQuery *query = [PFQuery queryWithClassName:@"nSavedItems"];
    [query whereKey:@"ToUser" equalTo:recipeTitleLable.text];
    
    [query orderByDescending:@"createdAt"];
    [query fromLocalDatastore];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            
            userStrArray = [[NSMutableArray alloc]initWithArray:objects];
            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        
        
        [_myCommentTableView reloadData];
        
    }];
    
    
}


- (void)viewWillAppear:(BOOL)animated {
    
    [self performSelector:@selector(retrieveFromParse)];
    [self.myCommentTableView reloadData];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [userStrArray count];
    
}





- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommentCell"];
    if (cell != nil)
    {
        PFObject *tempObject = [userStrArray objectAtIndex:indexPath.row];
        
        
        cell.commentText = [tempObject objectForKey:@"comment"];
        
        
        
    }
    
    [cell refreshCell];
    return cell;
    
    
}


//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//    return YES;
//}
//
//
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{    //are we in delete mode
//    
//    if (editingStyle == UITableViewCellEditingStyleDelete)
//    {
//        PFObject *tempObject = [userStrArray objectAtIndex:indexPath.row];
//        
//        [tempObject deleteInBackground];
//        
//        
//        [tempObject unpinInBackground];
//        
//        [userStrArray removeObjectAtIndex:indexPath.row];
//        
//        [_myCommentTableView reloadData];
//        
//        
//        
//        
//    }
//}





- (IBAction)sendCommentButton:(id)sender {
    
    
    [self performSelector:@selector(submitForm)];
    
    [self performSelector:@selector(retrieveFromParse)];
    [self.myCommentTableView reloadData];
    //[self.navigationController popViewControllerAnimated:YES];
}



-(void)submitForm {
    
    
    
    
    PFObject *comment = [PFObject objectWithClassName:@"nSavedItems"];
    comment[@"comment"] = _comment.text;
    
    //self.getObjectQuery = [PFQuery queryWithClassName:@"Takenphoto"];
    
    // _recipeImageView.image = [self.getObject objectForKey:@"Takenimage"];
    
    // NSString *titleLableString = [self.getObject objectForKey:@"title"];
    
    
    
    
    //_recipeImageView.image = [self.getObject objectForKey:@"Takenimage"];
    
    //PFFile *photo = _recipeImageView;
    
    
    // photo.file = [self.getObject objectForKey:@"Takenimage"];
    
    
    [comment setValue:recipeTitleLable.text forKey:@"ToUser"]; // Set toUser
    
    
    [comment setValue:[PFUser currentUser] forKey:@"FromUser"]; // Set fromUser
    [comment setValue:@"usercomment" forKey:@"Type"];
    //[comment setValue:_recipeImageView.image forKey:@"photoKey"];
    
    // Set the proper ACLs
    comment.ACL = [PFACL ACLWithUser:[PFUser currentUser]];
    [comment.ACL setPublicReadAccess:YES];
    //comment.ACL = ACL;

    

    [comment saveEventually];
    [comment pinInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            
            [self performSelector:@selector(retrieveFromParse)];
            [self.myCommentTableView reloadData];
            //[self dismissViewControllerAnimated:YES completion:nil];
            // The object has been saved.
            UIAlertView *eventAlertView = [[UIAlertView alloc]initWithTitle:@"Comment Saved!" message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            //[self performSelector:@selector(backTothe:)];
            if(eventAlertView != nil)
                
            {
                [eventAlertView show];
                
            }
            
        } else {
            // There was a problem, check error.description
            
            UIAlertView *eventAlertView = [[UIAlertView alloc]initWithTitle:@"Oops!" message:@" There was an error" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            if(eventAlertView != nil)
                
            {
                [eventAlertView show];
                
            }
            
        }
    }];
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
