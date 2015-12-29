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

@interface MainFeedTableViewController : PFQueryTableViewController <FollowButtonDelegate, LikesButtonDelegate, UITableViewDelegate, UISearchBarDelegate, UISearchControllerDelegate>
{
   BOOL isFiltered;
    //IBOutlet UISearchResultsTableView *searchResutsTableView;
    NSMutableArray *searchResults;
    UISearchBar *searchBar;
    UISearchController *searchController;
}

- (NSIndexPath *)_indexPathForPaginationCell;


    






   
    







- (IBAction)commentButn:(id)sender;


@end
