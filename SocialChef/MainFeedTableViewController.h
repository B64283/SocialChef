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

@interface MainFeedTableViewController : PFQueryTableViewController <FollowButtonDelegate, LikesButtonDelegate, UITableViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate>
{
   
    IBOutlet UITableView *searchResultsTableView;

    
}

- (NSIndexPath *)_indexPathForPaginationCell;


    
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) NSMutableArray *searchResults;



   
    







- (IBAction)commentButn:(id)sender;


@end
