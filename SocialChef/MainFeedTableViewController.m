//
//  MainFeedTableViewController.m
//  SocialChef
//
//  Created by Matthew Darke on 11/11/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import "MainFeedTableViewController.h"

#import "RecipeDetailsViewController.h"
#import "AddRecipeViewController.h"
#import <ParseUI/ParseUI.h>
#import <Parse/Parse.h>


@interface MainFeedTableViewController ()
{
    
    
    
}






@property (nonatomic, strong)NSMutableArray *followingArray;
@property (nonatomic, strong)NSMutableArray *likesArray;
@property (nonatomic, strong)NSMutableArray *userStrArray;
@end

@implementation MainFeedTableViewController


- (void)viewDidLoad {
    //self.myyTabelView.delegate = self;
    //self.myyTabelView.dataSource = self;
    //searchResults = [NSMutableArray array];
    //[searchBar becomeFirstResponder];
    //self.tableView.tableHeaderView = self.searchBar;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"BlackNavagation"] forBarMetrics:UIBarMetricsDefault];
    [super viewDidLoad];

    
    [self.tableView reloadData];
    
    searchResults = [NSMutableArray array];
    searchResultsName = [NSMutableArray array];
    
    
    
    
    
    PFQuery *query = [PFQuery queryWithClassName:@"Takenphoto"];
    [PFUser currentUser];
    [query whereKey:@"Takenphoto" equalTo:@"Takenimage"];
    
    [query countObjectsInBackgroundWithBlock:^(int count, NSError *error) {
        if (!error) {
            // The count request succeeded. Log the count
            NSLog(@"Sean has played %d games", count);
        } else {
            // The request failed
        }
    }];
    
    // Associate the device with a user
    }









//search bar methid
-(void)searchBar:(UISearchBar*)searchBar textDidChange:(NSString*)text
{
    if(text.length == 0)
    {
        isFiltered = FALSE;
        [self.tableView reloadData];
        
    }
    else
    {
        isFiltered = true;
        [self.tableView reloadData];
        
        
        [searchResults removeAllObjects];
        [searchResultsName removeAllObjects];
        
        PFQuery *query = [PFQuery queryWithClassName:@"Takenphoto"];
        [query whereKeyExists:@"title"];  //this is based on whatever query you are trying
        
        PFQuery *queryName = [PFQuery queryWithClassName:@"User"];
        [queryName whereKeyExists:@"username"];
        
        
        //PFUser *user = [query1 whereKeyExists:@"whoIsuser"];
        
        [query whereKey:@"title" containsString:text];
        
        
        
        
        
        NSArray * resultsName = [queryName findObjects];
        //[query whereKeyExists:@"Takenimage"];
        
        NSArray *results = [query findObjects];
        //NSArray *resultsName = [query findObjects];
        //NSArray *resultsName = [queryName findObjects];
        
        //query.limit = 50;
        
        [searchResults removeAllObjects];
        [searchResultsName removeAllObjects];

        
       // NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"SELF contains[C] %@", text];
        
        //searchResults = [NSMutableArray arrayWithArray: [searchResults filteredArrayUsingPredicate:resultPredicate]];

        //for (resultPredicate in results)
        
            NSRange nameRange = [text rangeOfString:text options:NSCaseInsensitiveSearch];
            NSRange descriptionRange = [text rangeOfString:text options:NSCaseInsensitiveSearch];
            if(nameRange.location != NSNotFound || descriptionRange.location != NSNotFound)
            {
               [searchResults addObjectsFromArray:results];
                [searchResultsName addObjectsFromArray:resultsName];
            }
        
        
        [self.tableView reloadData];
        
    }
        
    
}






-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_searchBar resignFirstResponder];
    
    
}


//- (void)filterResults:(NSString *)searchTerm {
//    
//    [searchResults removeAllObjects];
//    
//    PFQuery *query = [PFQuery queryWithClassName:@"Takenphoto"];
//    [query whereKeyExists:@"title"];  //this is based on whatever query you are trying
//    [query whereKeyExists:@"Takenimage"];
//    [query whereKeyExists:@"whoIsuser"];
//    //to accomplish
//    
//    [query whereKey:@"title" containsString:searchTerm];
//    [query whereKeyExists:@"Takenimage"];
//    
//    NSArray *results = [query findObjects];
//    
//    query.limit = 50;
//    
//    
//    //[searchResults addObjectsFromArray:results];
//    
//    
//    }


//- (BOOL)searchDisplayController:(UISearchController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
//    
//    
//    
//    
//    return YES;
//}
//
//







-(id)initWithCoder:(NSCoder *)aDecoder
{
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.parseClassName = @"Takenphoto";
        self.pullToRefreshEnabled = YES;
        self.paginationEnabled = NO;
        self.objectsPerPage = 100;
    }
    
    return self;
    
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    //[self loadObjects];
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
       //AddRecipeViewController *destViewController = segue.destinationViewController;
    }
    
    else if ([segue.identifier isEqualToString:@"DetailsSegue"])
        
    {
     
        NSIndexPath *indexPath = nil;
        //sends filtered data to detailView
        if (isFiltered == true) {
            indexPath = [self.tableView indexPathForSelectedRow];
            PFObject *photo = [searchResults objectAtIndex:indexPath.row];
            if (photo) {
                RecipeDetailsViewController *photoDetailsVC = [segue destinationViewController];
                
                
                
                photoDetailsVC.getObject = photo;
            }

        }
            else{
        
        
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        PFObject *photo = [self.objects objectAtIndex:indexPath.row];
        //PFQuery *photoQ = [self.objects objectAtIndex:indexPath.section];
        //PFQuery *photoZ = [self.objects objectAtIndex:indexPath.section];
        if (photo) {
            RecipeDetailsViewController *photoDetailsVC = [segue destinationViewController];
            
            
            
        photoDetailsVC.getObject = photo;
        }
            }
//           if (photoQ) {
//            RecipeDetailsViewController *photoDetailsVCQ = [segue destinationViewController];
//        
//        
//               photoDetailsVCQ.getObjectQuery = photoQ;
//
//           }
//         if (photoZ) {
//        
//             RecipeDetailsViewController *photoDetailsVCZ = [segue destinationViewController];
//             
//             
//             photoDetailsVCZ.getObjectQuery = photoZ;
//             
        
             
             
             
             
             //PFObject *post = [self.objects objectAtIndex:indexPath.section];
//        
//        PFQuery *Qpost = [self.objects objectAtIndex:indexPath.section];
//        
//        NSLog(@"%@", post.objectId);
//        
//        RecipeDetailsViewController *vcu =
//        
//        
//        RecipeDetailsViewController *vcuQ = [segue destinationViewController];
        
               
        }
        

    }




#pragma mark - PFQueryTableViewDataSource and Delegates
- (void)objectsDidLoad:(NSError *)error {
    [super objectsDidLoad:error];
    
    
    PFQuery *query = [PFQuery queryWithClassName:@"Activity"];
    [query whereKey:@"FromUser"  equalTo:[PFUser currentUser]];
    [query whereKey:@"Type"  equalTo:@"follow"];
    [query includeKey:@"ToUser"];
    [query findObjectsInBackgroundWithBlock:^(NSArray * objects, NSError * error) {
       
        if (!error) {
            self.followingArray = [NSMutableArray array];
            if (objects.count > 0) {
                
                for (PFObject *activity in objects) {
                    PFUser *user = activity[@"ToUser"];
                   
                    //get object id from each user object
                    
                    //from parse: (you should check to see whether users Contains a PFuser with an object ID matches your current user)
                    [self.followingArray addObject:user.objectId];
                    
                
                }
            }
            [self.tableView reloadData];
        }
        
    }];
    
   PFQuery *queryLike = [PFQuery queryWithClassName:@"Activity"];
    [queryLike whereKey:@"FromUser"  equalTo:[PFUser currentUser]];
    [queryLike whereKey:@"Type"  equalTo:@"like"];
    [queryLike includeKey:@"ToUser"];
    [queryLike findObjectsInBackgroundWithBlock:^(NSArray * objects, NSError * error) {
        
        if (!error) {
            self.likesArray = [NSMutableArray array];
            if (objects.count > 0) {
                
                for (PFObject *activity in objects) {
                    PFUser *user = activity[@"ToUser"];
                    
                    //get object id from each user object
                    
                    //from parse: (you should check to see whether users Contains a PFuser with an object ID matches your current user)
                    [self.likesArray addObject:user.objectId];
                    
                    
                }
            }
            [self.tableView reloadData];
        }
        
    }];

    
    
    
}

// return objects in a different indexpath order. in this case we return object based on the section, not row, the default is row



- (PFObject *)objectAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row < self.objects.count) {
        
        return [self.objects objectAtIndex:indexPath.row];

    }
    if (indexPath.row < searchResults.count) {
        
        
        return [searchResults objectAtIndex:indexPath.row];
    }
    
    else return nil;
}



        
//        
//- (NSIndexPath *)_indexPathForPaginationCell {
//    
//    return [NSIndexPath indexPathForRow:0 inSection:[self.objects count]];
//    
//}
//





//get recipe image and profile image and other recipe info

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    if (section == self.objects.count) {
//        return nil;
//    }
//    
//    static NSString *CellIdentifier = @"SectionHeaderCell";
//    
//    
//    
//    UITableViewCell *sectionHeaderView = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    
//    
//    if (sectionHeaderView == nil)
//    {
////
//      sectionHeaderView = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//        
//            }

    
    
    

    





        
        
        
        
    
    

    

    
    
    




// this is a problem

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    
//    NSInteger sections = self.objects.count;
//    
//    if (sections >0) {
//        
//        sections++;
//           
//           
//        
//    
//    }
//    
//    return sections;
//
//
//
//    
//
//    
//
//}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{    //return [recipeArray count];
    NSUInteger rowCount;
    if(self ->isFiltered == true)
    {
        rowCount = searchResults.count;
    }
    else if (self ->isFiltered == false)
        
    {
        rowCount = self.objects.count;
        
    }
       return rowCount;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object {
    
    static NSString *CellIdentifier = @"ImageCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ImageCell"];
    }
    
    
    if (tableView == self.tableView) {
        
        PFImageView *profileImageView = (PFImageView * )[cell viewWithTag:10];
        //PFImageView *takenPhotoImageView = (PFImageView * )[cell viewWithTag:6];
        
        UILabel *userNameLable = (UILabel *)[cell viewWithTag:2];
        UILabel *titleLable = (UILabel *)[cell viewWithTag:3];
        
        PFObject *photo = [self.objects objectAtIndex:indexPath.row];
        PFUser *user = [photo objectForKey:@"whoIsuser"];
        PFFile *profilePicture = [user objectForKey:@"profilePhoto"];
        
        //PFFile *takenPicture = [user objectForKey:@"Takenimage"];
        [user fetchIfNeeded];
       
        PFImageView *photo1 = (PFImageView *)[cell viewWithTag:6];
        photo1.file = object [@"Takenimage"];
        [object fetchIfNeeded];
        [photo1 loadInBackground];
        

        
        //
        NSString *title = photo[@"title"];
        //NSString *titleServing = photo[@"serving"];
        
        
        userNameLable.text = user.username;
        
        titleLable.text = title;
        
        profileImageView.file = profilePicture;
        //[ fetchIfNeeded];
        [profileImageView loadInBackground];
        
//        takenPhotoImageView.file = takenPicture;
//        [takenPhotoImageView loadInBackground];
        
        
        FollowButton *followButton = (FollowButton *)[cell viewWithTag: 4];
        followButton.delegate = self;
        
        
        followButton.sectionIndex = indexPath.row;
        //Likes button
        LikesButton *likesButton = (LikesButton *)[cell viewWithTag: 5];
        likesButton.delegate = self;
        
        likesButton.sectionIndex = indexPath.row;
        
        
        
        if (!self.likesArray || [user.objectId isEqualToString:[PFUser currentUser].objectId] ) {
            likesButton.hidden = YES;
            
            
        }else{
            likesButton.hidden = NO;
            NSInteger indexOfMatchedObject = [self.likesArray indexOfObject:user.objectId];
            
            if (indexOfMatchedObject == NSNotFound) {
                likesButton.selected = NO;
                
                
            }else{
                
                likesButton.selected = YES;
            }
        }
        
        
        
        // update state of following button we dont want user to follow their self
        
        if (!self.followingArray || [user.objectId isEqualToString:[PFUser currentUser].objectId] ) {
            followButton.hidden = YES;
            
            
        }else{
            followButton.hidden = NO;
            NSInteger indexOfMatchedObject = [self.followingArray indexOfObject:user.objectId];
            
            if (indexOfMatchedObject == NSNotFound) {
                followButton.selected = NO;
                
                
            }else{
                
                followButton.selected = YES;
            }
        }
        
        
        // return sectionHeaderView;
        if (isFiltered == TRUE) {
            
            PFImageView *profileImageView = (PFImageView * )[cell viewWithTag:10];
            UILabel *userNameLable = (UILabel *)[cell viewWithTag:2];
            UILabel *titleLable = (UILabel *)[cell viewWithTag:3];
            
            
            //PFUser *obj2 = [searchResults objectAtIndex:section];
            
            //if([searchResults count]>0){
            //obj2 =
            
            
            PFObject *photo = [searchResults objectAtIndex:indexPath.row];
            //PFObject *photo2 = [searchResultsName objectAtIndex:indexPath.row];
            
            PFUser *user = [photo objectForKey:@"whoIsuser"];
            PFFile *profilePicture = [user objectForKey:@"profilePhoto"];
            
            NSLog(@"%@", searchResults);
            NSLog(@"%lu",searchResults.count);
            
            //
            PFImageView *photo1 = (PFImageView *)[cell viewWithTag:6];
            photo1.file = object [@"Takenimage"];
            [object fetchIfNeeded];
            [photo1 loadInBackground];
            
            NSString *title = photo[@"title"];
            //NSString *titleServing = photo[@"serving"];
            
            
            userNameLable.text = user.username;
            
            titleLable.text = title;
            
            profileImageView.file = profilePicture;
            [profileImageView loadInBackground];
            
            
            
            
            //        PFQuery *query = [PFQuery queryWithClassName:@"Takenphoto"];
            //        PFObject *searchedUser = [query getObjectWithId:obj2.objectId];
            //        NSString *title = [searchedUser objectForKey:@"title"];
            //
            //            //PFObject *photo = [self.objects objectAtIndex:section];
            //            PFUser *user = [searchedUser objectForKey:@"whoIsuser"];
            //            //PFFile *profilePicture = [user objectForKey:@"profilePhoto"];
            //
            //
            //
            //
            //        //PFObject *photo = [searchResults objectAtIndex:section];e
            //        //PFUser *user = [searchedUser objectForKey:@"whoIsuser"];
            //
            //        PFFile *profilePicture = [searchedUser objectForKey:@"profilePhoto"];
            //
            //
            //        //
            //       // NSString *title = photo[@"title"];
            //        //NSString *titleServing = photo[@"serving"];
            //
            //        [user fetchIfNeeded];
            //        userNameLable.text = user.username;
            //
            //        titleLable.text = title;
            //        //[searchedUser fetchIfNeededInBackground];
            //
            //        profileImageView.file = profilePicture;
            //        [profileImageView loadInBackground];
            
            FollowButton *followButton = (FollowButton *)[cell viewWithTag: 4];
            followButton.delegate = self;
            
            followButton.sectionIndex = indexPath.row;
            
            //Likes button
            LikesButton *likesButton = (LikesButton *)[cell viewWithTag: 5];
            likesButton.delegate = self;
            
            likesButton.sectionIndex = indexPath.row;
            
            
            
            if (!self.likesArray || [user.objectId isEqualToString:[PFUser currentUser].objectId] ) {
                likesButton.hidden = YES;
                
                
            }else{
                
                likesButton.hidden = NO;
                NSInteger indexOfMatchedObject = [self.likesArray indexOfObject:user.objectId];
                
                if (indexOfMatchedObject == NSNotFound) {
                    likesButton.selected = NO;
                    
                    
                }else{
                    
                    likesButton.selected = YES;
                }
            }
            
            // update state of following button we dont want user to follow their self
            
            if (!self.followingArray || [user.objectId isEqualToString:[PFUser currentUser].objectId] ) {
                followButton.hidden = YES;
                
                
            }else{
                followButton.hidden = NO;
                NSInteger indexOfMatchedObject = [self.followingArray indexOfObject:user.objectId];
                
                if (indexOfMatchedObject == NSNotFound) {
                    followButton.selected = NO;
                    
                    
                }else{
                    
                    followButton.selected = YES;
                }
            }
            //return sectionHeaderView;
        }
    }
    
    
    return cell;
}





//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    if (section == self.objects.count) {
//        
//        return 0.0f;
//    
//    }else
//    
//        return 0.0f;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //if last section return 50
    if (indexPath.row == self.objects.count) {
        return 580.0f;
    }else
    return 304.0f;
}







//- (UITableViewCell *)tableView:(UITableView *)tableView cellForNextPageAtIndexPath:(NSIndexPath *)indexPath {
//    
//    static NSString *CellIdentifier = @"LoadMoreCell";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    
//    return cell;
//    
//}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == self.objects.count || searchResults.count) {
        
        [self loadNextPage];
        
    }
        
        
}


//use includekey to accsess other data
- (PFQuery *)queryForTable {
    
    
    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
    
    [query includeKey:@"whoIsuser"];
    [query orderByDescending:@"createdAt"];
    
    
    return query;
    
    
    
}

//follow button
-(void)followButton:(FollowButton *)button didTapWithSectionIndex:(NSInteger)index {
    
    PFObject *photo = [self.objects objectAtIndex:index];
    PFUser *user = photo [@"whoIsuser"];
    
    if (!button.selected) {
        [self followUser:user];
       
        
        
        
    }else{
        [self UnfollowUser:user];
    }
    
    //refresh tableView to show change
    [self.tableView reloadData];
    
}


// follow USER
-(void)followUser:(PFUser *)user {
    if (![user.objectId isEqualToString:[PFUser currentUser].objectId]) {
        
        //update array to make changes happen
        [self.followingArray addObject:user.objectId];
        
        PFObject *followActivity = [PFObject objectWithClassName:@"Activity"];
        followActivity [@"FromUser"] = [PFUser currentUser];
        followActivity [@"ToUser"] = user;
        followActivity [@"Type"] = @"follow";
        [followActivity saveEventually];
        
        
        PFInstallation *currentInstallation = [PFInstallation currentInstallation];
        [currentInstallation setObject:[PFUser currentUser] forKey:@"owner1"];
        [currentInstallation saveInBackground];
        
        
        
        PFQuery * pushQuery = [PFInstallation query];
        //PFUser * userReceivingPush;
        [pushQuery whereKey:@"owner1" equalTo:user];
        
        NSString * alert = [NSString stringWithFormat:@" %@! Is now following YOU", [PFUser currentUser].username];
        NSDictionary *data = [NSDictionary dictionaryWithObjectsAndKeys:
                              alert, @"alert",
                              @"default", @"sound",
                              @"Increment", @"badge",
                              nil];
        [PFPush sendPushDataToQueryInBackground:pushQuery withData:data block:^(BOOL succeeded, NSError *error) {
            if (!error) {
                
            }
            else {
            }
        }];
        
        
        
        
        
        

        
        
        
        
        
        
        
        
        // might need to use
        
//        
//        PFInstallation *currentInstallation = [PFInstallation currentInstallation];
//        [currentInstallation addUniqueObject:@"global" forKey:@"channels"];
//        [currentInstallation saveInBackground];
//        
//        // Send a notification to all devices subscribed to the "Giants" channel.
//        PFPush *push = [[PFPush alloc] init];
//        [push setChannel:@"global"];
//        [push setMessage:@"User is now following You"];
//        [push sendPushInBackground];
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
  
//        [[PFInstallation currentInstallation] setObject:[PFUser currentUser] forKey:@"Activity"];
//        [[PFInstallation currentInstallation] saveEventually];
//        
//        PFQuery *userQuery = [PFInstallation query];
//        [userQuery whereKey:@"FromUser" equalTo:@"ToUser"];
//        // Create our Installation query
//        
//        
//       
//        
//        // Send push notification to query
//        PFPush *push = [[PFPush alloc] init];
//        [push setQuery:userQuery]; // Set our Installation query
//        [push setMessage:@"Willie Hayes injured by own pop fly."];
//        [push sendPushInBackground];
    
    
    
    }
    
    
    
    
    
}



// Unfollow User
-(void)UnfollowUser:(PFUser *)user {
    
    //update array to make changes happen
    [self.followingArray removeObject:user.objectId];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Activity"];
    [query whereKey:@"FromUser" equalTo:[PFUser currentUser]];
    [query whereKey:@"ToUser" equalTo:user];
    [query whereKey:@"Type" equalTo:@"follow"];
    [query findObjectsInBackgroundWithBlock:^(NSArray * followActivities, NSError * error)
    
    {
        if (!error) {
            for (PFObject *followActivity in followActivities) {
                [followActivity deleteEventually];
            }
        }
    }];
    
    
    
    
    
}


-(void)likesButton:(LikesButton *)button didTapWithSectionIndex:(NSInteger)index {
    
    PFObject *photo = [self.objects objectAtIndex:index];
    PFUser *user = photo [@"whoIsuser"];
    
    if (!button.selected) {
        [self likeUser:user];
        
    }else{
        
        [self UnLikeUser:user];
    }
    
    //refresh tableView to show change
    [self.tableView reloadData];



}


// follow USER
-(void)likeUser:(PFUser *)user {
    if (![user.objectId isEqualToString:[PFUser currentUser].objectId]) {
        
        //update array to make changes happen
        [self.likesArray addObject:user.objectId];
        
        PFObject *followActivity = [PFObject objectWithClassName:@"Activity"];
        followActivity [@"FromUser"] = [PFUser currentUser];
        followActivity [@"ToUser"] = user;
        followActivity [@"Type"] = @"like";
        [followActivity saveEventually];
        
    }
    
    
    
}



// Unfollow User
-(void)UnLikeUser:(PFUser *)user {
    
    //update array to make changes happen
    [self.likesArray removeObject:user.objectId];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Activity"];
    [query whereKey:@"FromUser" equalTo:[PFUser currentUser]];
    [query whereKey:@"ToUser" equalTo:user];
    [query whereKey:@"Type" equalTo:@"like"];
    [query findObjectsInBackgroundWithBlock:^(NSArray * followActivities, NSError * error)
     
     {
         if (!error) {
             for (PFObject *followActivity in followActivities) {
                 [followActivity deleteEventually];
             }
         }
     }];
    
    
    
    
    
}









@end
