//
//  FindFriendViewController.h
//  SocialChef
//
//  Created by Matthew Darke on 12/5/15.
//  Copyright © 2015 Matthew Darke. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "MainFeedTableViewController.h"

#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>
#import "FollowButton.h"
#import "LikesButton.h"
@interface FindFriendViewController : MainFeedTableViewController <FollowButtonDelegate, LikesButtonDelegate, UITableViewDelegate,UITableViewDataSource, UISearchDisplayDelegate, UISearchBarDelegate>

{
    
    //BOOL isFiltered;
    //IBOutlet UISearchResultsTableView *searchResutsTableView;
    //NSMutableArray *searchResults;
    //NSMutableArray *searchResultsName;
    //UISearchBar *searchBar;
    //UISearchDisplayController *searchController;
    
    
    
    
    
}


@property (strong, nonatomic) IBOutlet UISearchBar *searchBarName;


@property (strong, nonatomic)IBOutlet UIBarButtonItem *backToSett;



@end
