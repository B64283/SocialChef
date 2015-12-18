//
//  ProfileTableViewController.m
//  SocialChef
//
//  Created by Matthew Darke on 11/18/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import "ProfileTableViewController.h"
#import <ParseFacebookUtilsV4/PFFacebookUtils.h>
@interface ProfileTableViewController ()

@property (weak, nonatomic) IBOutlet PFImageView *profileImageView;

@property (weak, nonatomic) IBOutlet UILabel *userNameLable;

@property (weak, nonatomic) IBOutlet UILabel *followerNumberLable;


@property (weak, nonatomic) IBOutlet UILabel *followingNumberLable;
@property (weak, nonatomic) IBOutlet UILabel *recipeNumberLable;









@end

@implementation ProfileTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"BlackNavagation"] forBarMetrics:UIBarMetricsDefault];
//    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    PFQuery *phototsFromCurrentUserQuery = [PFQuery queryWithClassName:@"Takenphoto"];
    [phototsFromCurrentUserQuery whereKey:@"whoIsuser" equalTo:[PFUser currentUser]];
    
    
    
    [phototsFromCurrentUserQuery countObjectsInBackgroundWithBlock:^(int count, NSError *error) {
        if (!error) {
            // The count request succeeded. Log the count
            NSLog(@"Sean has played %d games", count);
       
            _recipeNumberLable.text = [NSString stringWithFormat:@"%d", count];
        
        } else {
            // The request failed
        }
    }];

    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self updateUserStatus];
    
    
}



-(void)updateUserStatus {
    
    PFUser *user = [PFUser currentUser];
    self.profileImageView.file = user [@"profilePhoto"];
    [self.profileImageView loadInBackground];
    self.userNameLable.text = user.username;

    //following
    PFQuery *followingQuery = [PFQuery queryWithClassName:@"Activity"];
    [followingQuery whereKey:@"FromUser" equalTo:user];
    [followingQuery whereKey:@"Type" equalTo:@"follow"];
    
    [followingQuery findObjectsInBackgroundWithBlock:^(NSArray * followingActivities, NSError * error) {
        if (!error) {
            self.followingNumberLable.text = [[NSNumber numberWithInteger:followingActivities.count]stringValue];
            
        }
    
    
    
}];
   
    //follower
    PFQuery *followerQuery = [PFQuery queryWithClassName:@"Activity"];
    [followerQuery whereKey:@"ToUser" equalTo:user];
    [followerQuery whereKey:@"Type" equalTo:@"follow"];
    
    [followerQuery findObjectsInBackgroundWithBlock:^(NSArray * followerActivities, NSError * error) {
        if (!error) {
            self.followerNumberLable.text = [[NSNumber numberWithInteger:followerActivities.count]stringValue];
            
        }
        
        
        
    }];

    
}

-(PFQuery *)queryForTable {
    
//    if (![PFUser currentUser] || ![PFFacebookUtils isLinkedWithUser: [PFUser currentUser]]){
//        return nil;
//    
//        }
    
    PFQuery *followingQuery = [PFQuery queryWithClassName:@"Activity"];
    [followingQuery whereKey:@"FromUser" equalTo:[PFUser currentUser]];
    [followingQuery whereKey:@"Type" equalTo:@"follow"];
   
    //limiting the photos seen
    
    PFQuery *photosFromFollowedUsersQuery = [PFQuery queryWithClassName:@"Takenphoto"];
    [photosFromFollowedUsersQuery whereKey:@"whoIsuser" matchesKey:@"ToUser" inQuery:followingQuery];
    
    PFQuery *phototsFromCurrentUserQuery = [PFQuery queryWithClassName:@"Takenphoto"];
    [phototsFromCurrentUserQuery whereKey:@"whoIsuser" equalTo:[PFUser currentUser]];
    
    
    
    PFQuery *superQuery = [PFQuery orQueryWithSubqueries:[NSArray arrayWithObjects:phototsFromCurrentUserQuery,nil]];
    
 //left this out
    //photosFromFollowedUsersQuery
    
    
    //get user profile info from userclass
    [superQuery includeKey:@"whoIsuser"];
    [superQuery orderByDescending:@"createdAt"];
    
    return superQuery;
    
    
    
    
    
}


#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}


-(IBAction)backTotheStart:(UIStoryboardSegue *)segue

{
    //AddIngredientsViewController *source = segue.sourceViewController;
    
    
}





/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
