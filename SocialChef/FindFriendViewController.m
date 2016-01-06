//
//  FindFriendViewController.m
//  SocialChef
//
//  Created by Matthew Darke on 12/5/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import "FindFriendViewController.h"
#import <ParseFacebookUtilsV4/PFFacebookUtils.h>
#import "SettingsViewController.h"

@interface FindFriendViewController ()

@property (weak, nonatomic) IBOutlet PFImageView *profilImageView;

@property (weak, nonatomic) IBOutlet UILabel *userNamLable;

@property (weak, nonatomic) IBOutlet UILabel *follwerNumberLable;


@property (weak, nonatomic) IBOutlet UILabel *follwingNumberLable;







@end

@implementation FindFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"BlackNavagation"] forBarMetrics:UIBarMetricsDefault];
    [super viewDidLoad];

    // Do any additional setup after loading the view.
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
    self.profilImageView.file = user [@"profilePhoto"];
    [self.profilImageView loadInBackground];
    self.userNamLable.text = user.username;
    
    //following
    PFQuery *followingQuery = [PFQuery queryWithClassName:@"Activity"];
    [followingQuery whereKey:@"FromUser" equalTo:user];
    [followingQuery whereKey:@"Type" equalTo:@"follow"];
    
    [followingQuery findObjectsInBackgroundWithBlock:^(NSArray * followingActivities, NSError * error) {
        if (!error) {
            self.follwingNumberLable.text = [[NSNumber numberWithInteger:followingActivities.count]stringValue];
            
        }
        
        
        
    }];
    
    //follower
    PFQuery *followerQuery = [PFQuery queryWithClassName:@"Activity"];
    [followerQuery whereKey:@"ToUser" equalTo:user];
    [followerQuery whereKey:@"Type" equalTo:@"follow"];
    
    [followerQuery findObjectsInBackgroundWithBlock:^(NSArray * followerActivities, NSError * error) {
        if (!error) {
            self.follwerNumberLable.text = [[NSNumber numberWithInteger:followerActivities.count]stringValue];
            
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
    
    
    
    PFQuery *superQuery = [PFQuery orQueryWithSubqueries:[NSArray arrayWithObjects: photosFromFollowedUsersQuery,nil]];
    
    
   //left this out
    //phototsFromCurrentUserQuery,
    
    
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
