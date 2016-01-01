//
//  MainFeedTableViewController.h
//  SocialChef
//
//  Created by Matthew Darke on 11/11/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>
#import "FollowButton.h"
#import "LikesButton.h"

@interface MainFeedTableViewController : PFQueryTableViewController <FollowButtonDelegate, LikesButtonDelegate, UITableViewDelegate,UITableViewDataSource, UISearchDisplayDelegate, UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate>
{
     BOOL isFiltered;
    //IBOutlet UISearchResultsTableView *searchResutsTableView;
    NSMutableArray *searchResults;
    UISearchBar *searchBar;
    UISearchDisplayController *searchController;
}

- (NSIndexPath *)_indexPathForPaginationCell;

//@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
    






   
    







- (IBAction)commentButn:(id)sender;


@end
