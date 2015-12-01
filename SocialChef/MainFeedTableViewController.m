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




@interface MainFeedTableViewController ()
@property (nonatomic, strong)NSMutableArray *followingArray;

@end

@implementation MainFeedTableViewController


- (void)viewDidLoad {
    
    
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"BlackNavagation"] forBarMetrics:UIBarMetricsDefault];
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    //self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}



-(id)initWithCoder:(NSCoder *)aDecoder
{
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.parseClassName = @"Takenphoto";
        self.pullToRefreshEnabled = YES;
        self.paginationEnabled = YES;
        self.objectsPerPage = 8;
    }
    
    return self;
    
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self loadObjects];
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
       AddRecipeViewController *destViewController = segue.destinationViewController;
    }
    
    else if ([segue.identifier isEqualToString:@"DetailsSegue"])
        
    {
    
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
    
    
}

// return objects in a different indexpath order. in this case we return object based on the section, not row, the default is row



- (PFObject *)objectAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section < self.objects.count) {
        
        return [self.objects objectAtIndex:indexPath.section];

    }
    else{
        return nil;

    }
}


- (NSIndexPath *)_indexPathForPaginationCell {
    return [NSIndexPath indexPathForRow:0 inSection:[self.objects count]];
    
}






//get recipe image and profile image and other recipe info

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == self.objects.count) {
        return nil;
    }
    
    static NSString *CellIdentifier = @"SectionHeaderCell";
    UITableViewCell *sectionHeaderView = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    PFImageView *profileImageView = (PFImageView * )[sectionHeaderView viewWithTag:1];
    UILabel *userNameLable = (UILabel *)[sectionHeaderView viewWithTag:2];
    UILabel *titleLable = (UILabel *)[sectionHeaderView viewWithTag:3];
    
    
    PFObject *photo = [self.objects objectAtIndex:section];
    PFUser *user = [photo objectForKey:@"whoIsuser"];
    PFFile *profilePicture = [user objectForKey:@"profilePhoto"];
    NSString *title = photo[@"title"];
    
    
    userNameLable.text = user.username;
    
    titleLable.text = title;
    
    profileImageView.file = profilePicture;
    [profileImageView loadInBackground];
    
    
    FollowButton *followButton = (FollowButton *)[sectionHeaderView viewWithTag: 4];
    followButton.delegate = self;
    
    followButton.sectionIndex = section;
    
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
    
    
    return sectionHeaderView;
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    NSInteger sections = self.objects.count;
    
    if (self.paginationEnabled && sections >0) {
        
        sections++;
        
    }
    return sections;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object {
    
    if (indexPath.section == self.objects.count) {
        UITableViewCell *cell = [self tableView:tableView cellForNextPageAtIndexPath:indexPath];
        return cell;
    }
    
    static NSString *CellIdentifier = @"ImageCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    PFImageView *photo = (PFImageView *)[cell viewWithTag:1];
     photo.file = object [@"Takenimage"];
    [photo loadInBackground];
    
    
    return cell;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == self.objects.count) {
        
        return 0.0f;
    
    }else
    
        return 94.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //if last section return 50
    if (indexPath.section == self.objects.count) {
        return 50.0f;
    }else
    return 204.0f;
}







- (UITableViewCell *)tableView:(UITableView *)tableView cellForNextPageAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"LoadMoreCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    return cell;
    
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == self.objects.count && self.paginationEnabled) {
        
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













@end
