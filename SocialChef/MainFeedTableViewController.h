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

@interface MainFeedTableViewController : PFQueryTableViewController <FollowButtonDelegate, LikesButtonDelegate, UITableViewDelegate,UITableViewDataSource, UISearchDisplayDelegate, UISearchBarDelegate>
{
     BOOL isFiltered;
    //IBOutlet UISearchResultsTableView *searchResutsTableView;
    NSMutableArray *searchResults;
    //UISearchBar *searchBar;
    //UISearchDisplayController *searchController;
    
}

- (NSIndexPath *)_indexPathForPaginationCell;

@property (strong, nonatomic)UISearchController *searchDisplay;

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@property (weak, nonatomic) IBOutlet UITableView *myyTabelView;





   
    







- (IBAction)commentButn:(id)sender;


@end
